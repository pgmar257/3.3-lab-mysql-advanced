select royalty_calc.au_id, round(sum(royalty_calc.sales_royalty) + royalty_calc.advance, 2) profit
from (
select ta.au_id, ta.title_id, t.advance, t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100) sales_royalty
from titleauthor ta
left join titles t on ta.title_id = t.title_id
left join sales s on ta.title_id = s.title_id) royalty_calc
group by royalty_calc.title_id, royalty_calc.au_id
order by profit desc
limit 3;



select ta.au_id, ta.title_id, s.qty, t.price, t.advance, t.royalty, ta.royaltyper, t.price * s.qty * (t.royalty/100) * (ta.royaltyper/100) sales_royalty
from titleauthor ta
left join titles t on ta.title_id = t.title_id
left join sales s on ta.title_id = s.title_id;




SELECT ap.au_id, ap.title_id, SUM(ap.sales_royalty) + ap.advance profit
FROM author_profit ap
GROUP BY ap.au_id, ap.title_id, ap.advance
ORDER BY profit DESC
LIMIT 3;



CREATE TABLE publications.most_profiting_authors
SELECT ap.au_id, SUM(ap.sales_royalty) + ap.advance profit
FROM author_profit ap
GROUP BY ap.au_id, ap.title_id, ap.advance
ORDER BY profit DESC;
