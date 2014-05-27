From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] coccinelle: Check for missing NULL terminators in of_device_id
 tables
Date: Tue, 27 May 2014 11:02:45 -0700
Message-ID: <5384D345.4070606@codeaurora.org>
References: <1400888504-31309-1-git-send-email-sboyd@codeaurora.org> <alpine.DEB.2.02.1405240956220.2012@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1405240956220.2012-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>, Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/24/14 00:57, Julia Lawall wrote:
> On Fri, 23 May 2014, Stephen Boyd wrote:
>
>> +... struct of_device_id arr[] = {
>> +	...,
>> +	{
>> +	...,
>> +	.var = E,
>> +	...
>> +	}
>> +};
> You shouldn't need any of the ...s in these rules.
>

Hm.. Removing all the ...s in these rules only gives me 3 matches now. I
used to get 5.

Before

$ COCCI=scripts/coccinelle/misc/of_table.cocci make coccicheck MODE=report

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

./sound/soc/pxa/pxa-ssp.c:810:36-37: pxa_ssp_of_ids is not NULL terminated at line 810
./drivers/mfd/tps65218.c:199:32-33: of_tps65218_match_table is not NULL terminated at line 199
./drivers/staging/mt29f_spinand/mt29f_spinand.c:926:34-35: spinand_dt is not NULL terminated at line 926
./drivers/clk/clk-u300.c:1170:1-2: u300_clk_match is not NULL terminated at line 1170
./drivers/clk/st/clkgen-pll.c:655:1-2: c32_gpu_pll_of_match is not NULL terminated at line 655


After

$ COCCI=scripts/coccinelle/misc/of_table.cocci make coccicheck MODE=report

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

./sound/soc/pxa/pxa-ssp.c:810:36-37: pxa_ssp_of_ids is not NULL terminated at line 810
./drivers/mfd/tps65218.c:199:32-33: of_tps65218_match_table is not NULL terminated at line 199
./drivers/staging/mt29f_spinand/mt29f_spinand.c:926:34-35: spinand_dt is not NULL terminated at line 926


Removing most of the ...s seems to work though. I'll send a v2.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
