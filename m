Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EBEC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 10:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBA8E206DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 10:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fZ8ym5wi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbfLLKQQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 05:16:16 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50673 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfLLKQQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 05:16:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so1725939wmb.0
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=qTx2vi9sq1DjlIujztZ1QG4YIeemlAnEZ4TJMf6wqjQ=;
        b=fZ8ym5wiyLI8tAQ3CrB2XdCDetkueTTgeNnA+AaN85MRT09dekPDn485MKyKMA/n3l
         Ei72d3mF2vDeKdVokKPTnv7wFWIoc0q27jynW1t/FsI6o858s7jF2XEx8H6JniLGX3jK
         7YWbEjESl8QA9Xvia0TBrauiCvlckNBWvgV5MeU4rrgDz9j82ZHSjdMXOUZvxVFGrPof
         jHpsEnnypSevZjaHGHOphZ33lBQ+qTg11x8OZxv/sdOtkaSAu8pJVuBTOiPG7QaeNgxT
         EYQ/9s8c+w55DskN97YHhsfttrlyNdq5A8Ba/F9Rg81AzYw1NPOc3tCxYzCyqT93itCx
         MUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=qTx2vi9sq1DjlIujztZ1QG4YIeemlAnEZ4TJMf6wqjQ=;
        b=V5V9v6Z8ytZ0JWedUuGZnYTamY5XNoTTvRMLp4iM4ssQLQ0d0t+ySL4/xiGfUaYdQe
         qB8IAuJ1rBw/Sn9Xsz9oYpp8EqdVkW7kJkzleBMuvyKQUVVy7OrL+W+sBZuTfA2n/TZv
         XREj1L4hFBhsK1nw56LXYVD0Wwuc7guY9SiFquyIyFqwN+tjpVvZauiShnZgWiJJHb2o
         WtpF+WmfF7fZ4gbAxySrSfLTMAZu+M6AIaBsIyocZn3dzoluD+kiogvmA9mffsJnJ8vY
         PApmrYI0O33Sls3SDror6iT6xbgQMQFtBUw4STkhdB7+zPDuzT91+mDZzHCIiqVsxOgB
         7EqA==
X-Gm-Message-State: APjAAAWP+ejlblpqsxCfU8i3UC2ZI/gcDdS7Se0yCief9BICgis34rX/
        kYSftQkl9ZzTREIwYBFjCf7GHKv3j4A=
X-Google-Smtp-Source: APXvYqy0R5kxieJspDN7DzFwaZMTS8PH2ROLNLU1OkAXMoWb9HYF7YwVXjoZYbV7FUe0sc4Ynpi8vg==
X-Received: by 2002:a1c:407:: with SMTP id 7mr5451329wme.29.1576145773042;
        Thu, 12 Dec 2019 02:16:13 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o4sm5341601wrx.25.2019.12.12.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 02:16:12 -0800 (PST)
References: <20191206074052.15557-1-jian.hu@amlogic.com> <20191206074052.15557-3-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] clk: meson: add support for A1 PLL clock ops
In-reply-to: <20191206074052.15557-3-jian.hu@amlogic.com>
Date:   Thu, 12 Dec 2019 11:16:11 +0100
Message-ID: <1j8snhluhg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Fri 06 Dec 2019 at 08:40, Jian Hu <jian.hu@amlogic.com> wrote:

> The A1 PLL design is different with previous SoCs. The PLL
> internal analog modules Power-on sequence is different
> with previous, and thus requires a strict register sequence to
> enable the PLL.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 21 +++++++++++++++++++++
>  drivers/clk/meson/clk-pll.h |  1 +
>  drivers/clk/meson/parm.h    |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index ddb1e5634739..4aff31a51589 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -318,6 +318,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>  
> +	/*
> +	 * The A1 design is different with previous SoCs.The PLL
> +	 * internal analog modules Power-on sequence is different with
> +	 * previous, and thus requires a strict register sequence to
> +	 * enable the PLL.

The code does something more, not completly different. This comment is
not aligned with what the code does

> +	 */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> +		/* Enable the pll */
> +		meson_parm_write(clk->map, &pll->en, 1);
> +		udelay(10);
> +		/* Enable the pll self-adaption module current */
> +		meson_parm_write(clk->map, &pll->current_en, 1);
> +		udelay(40);
> +		meson_parm_write(clk->map, &pll->rst, 1);
> +		meson_parm_write(clk->map, &pll->rst, 0);

Here you enable the PLL and self adaptation module then reset the PLL.
However:
#1 when you enter this function, the PLL should already by in reset
and disabled
#2 the code after that will reset the PLL again

So if what you submited works, inserting the following should accomplish
the same thing:

---8<---
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 489092dde3a6..9b38df0a7682 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -330,6 +330,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
        /* Enable the pll */
        meson_parm_write(clk->map, &pll->en, 1);

+       if (MESON_PARM_APPLICABLE(&pll->current_en)) {
+               udelay(10);
+               /* Enable the pll self-adaption module current */
+               meson_parm_write(clk->map, &pll->current_en, 1);
+               udelay(40);
+       }
+
        /* Take the pll out reset */
        meson_parm_write(clk->map, &pll->rst, 0);
--->8---




> +	}
> +
>  	/* do nothing if the PLL is already enabled */
>  	if (clk_hw_is_enabled(hw))
>  		return 0;

In any case, nothing should be done on the clock before this check
otherwise you might just break the clock

> @@ -347,6 +364,10 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
>  
>  	/* Disable the pll */
>  	meson_parm_write(clk->map, &pll->en, 0);
> +
> +	/* Disable PLL internal self-adaption module current */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
> +		meson_parm_write(clk->map, &pll->current_en, 0);
>  }
>  
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 367efd0f6410..30f039242a65 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -36,6 +36,7 @@ struct meson_clk_pll_data {
>  	struct parm frac;
>  	struct parm l;
>  	struct parm rst;
> +	struct parm current_en;
>  	const struct reg_sequence *init_regs;
>  	unsigned int init_count;
>  	const struct pll_params_table *table;
> diff --git a/drivers/clk/meson/parm.h b/drivers/clk/meson/parm.h
> index 3c9ef1b505ce..c53fb26577e3 100644
> --- a/drivers/clk/meson/parm.h
> +++ b/drivers/clk/meson/parm.h
> @@ -20,6 +20,7 @@
>  	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
>  
>  #define MESON_PARM_APPLICABLE(p)		(!!((p)->width))
> +#define MESON_PARM_CURRENT(p)			(!!((p)->width))

Why do we need that ?

>  
>  struct parm {
>  	u16	reg_off;

