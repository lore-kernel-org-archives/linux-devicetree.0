Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D7CC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 13:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E920207D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 13:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQnd8g62"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgFZNwT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 09:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZNwS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 09:52:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C403C03E979
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 06:52:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id l6so1945672pjq.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vkfdqeVUI/su3DQ783AnuOft8liGgSL3jClLkDTp4UY=;
        b=GQnd8g62dBM3UTGxkTLrYB6Bi3sDWOCthPfOY24u7iMn1hJo8BRIi0LKAiFPkODoC5
         Lk0Vxa6ERv12ezALz49HAJyjPKsh80e5/Q6YdvGh8vjqTA6ZBqx5osR5uLpV95wwjnUK
         L5+mKbZ6+4/4kYe4Poln3jPSLObbtdNe6DYKBq6U6aGinaxVTGRjji0J2So4rN4EkF8r
         McrBTSAsUf1qY3fQYJ9Yr58LXY5Kb4PI5sy6X+FvM8OVKBqLXXg+fgvrbV7hmKW43E+c
         VjX3ZLPPIIuEip3L2I850mBcmZpeuxcp+UV4clnuY0wtjjdSgPD/LYAACiWRgC9LEVDp
         jmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vkfdqeVUI/su3DQ783AnuOft8liGgSL3jClLkDTp4UY=;
        b=BYQh3XkpP+RNKsrjq+OekdXfGTyyP8qAUun7/HZm644JmuWCJahCMB8wpAZa3mDcAM
         EMw37W5RnC20pSSBJinNlgtUWHg3vMvXGMWeupnANhYtaTPXjJCWbtaBtJz5Frl7gXbZ
         AYlOAS2puPWIGkvYuNOwWwV4KKgdQ+kcNc16QYmn4vtTxB/t5eaowpfB6PvoGVlUFJUM
         aQDqjBxHbcsCcMzIvVN/Nl72NlsO2GsACs8GRWY8Eaor5/9AS9j6apa2PgOGytUkaOsd
         vZXEloeShUIPK5tezBkxBFA9mkNi4TouZ7CFWL0gv0w4umpfQyoA07//EIksa1QWxenV
         AsOA==
X-Gm-Message-State: AOAM530ApG3ZnA96giYW5tXgXFAIDyvTmxm8QNbN4SLgL4Kx1ApTdj6A
        aZo22Rao2i6ldKB+V7g3ixi4
X-Google-Smtp-Source: ABdhPJy7UaGdsWs8Je1tfDfvQyzaIt6LkNtDGg2IYUTwtTmnV6mTf9yXL2BRzhLxRP2j1aog+TQZ/Q==
X-Received: by 2002:a17:902:bb85:: with SMTP id m5mr2778337pls.267.1593179537839;
        Fri, 26 Jun 2020 06:52:17 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e11:8623:980f:4d73:2b9:f602])
        by smtp.gmail.com with ESMTPSA id f200sm26216098pfa.62.2020.06.26.06.52.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:52:17 -0700 (PDT)
Date:   Fri, 26 Jun 2020 19:22:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 5/6] clk: actions: Add Actions S500 SoC Reset
 Management Unit support
Message-ID: <20200626135209.GC8333@Mani-XPS-13-9360>
References: <cover.1592941257.git.cristian.ciocaltea@gmail.com>
 <de224148c4ddee2de8354d7bcffdb49e2ab1edc2.1592941257.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de224148c4ddee2de8354d7bcffdb49e2ab1edc2.1592941257.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 24, 2020 at 08:47:56PM +0300, Cristian Ciocaltea wrote:
> Add Reset Management Unit (RMU) support for Actions Semi S500 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes in v2:
>  - Remove copyright as indicated by Stephen
> 
>  drivers/clk/actions/owl-s500.c | 78 ++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/clk/actions/owl-s500.c b/drivers/clk/actions/owl-s500.c
> index 025a8f6d6482..61bb224f6330 100644
> --- a/drivers/clk/actions/owl-s500.c
> +++ b/drivers/clk/actions/owl-s500.c
> @@ -23,8 +23,10 @@
>  #include "owl-gate.h"
>  #include "owl-mux.h"
>  #include "owl-pll.h"
> +#include "owl-reset.h"
>  
>  #include <dt-bindings/clock/actions,s500-cmu.h>
> +#include <dt-bindings/reset/actions,s500-reset.h>
>  
>  #define CMU_COREPLL			(0x0000)
>  #define CMU_DEVPLL			(0x0004)
> @@ -497,20 +499,96 @@ static struct clk_hw_onecell_data s500_hw_clks = {
>  	.num = CLK_NR_CLKS,
>  };
>  
> +static const struct owl_reset_map s500_resets[] = {
> +	[RESET_DMAC]	= { CMU_DEVRST0, BIT(0) },
> +	[RESET_NORIF]	= { CMU_DEVRST0, BIT(1) },
> +	[RESET_DDR]	= { CMU_DEVRST0, BIT(2) },
> +	[RESET_NANDC]	= { CMU_DEVRST0, BIT(3) },
> +	[RESET_SD0]	= { CMU_DEVRST0, BIT(4) },
> +	[RESET_SD1]	= { CMU_DEVRST0, BIT(5) },
> +	[RESET_PCM1]	= { CMU_DEVRST0, BIT(6) },
> +	[RESET_DE]	= { CMU_DEVRST0, BIT(7) },
> +	[RESET_LCD]	= { CMU_DEVRST0, BIT(8) },
> +	[RESET_SD2]	= { CMU_DEVRST0, BIT(9) },
> +	[RESET_DSI]	= { CMU_DEVRST0, BIT(10) },
> +	[RESET_CSI]	= { CMU_DEVRST0, BIT(11) },
> +	[RESET_BISP]	= { CMU_DEVRST0, BIT(12) },
> +	[RESET_KEY]	= { CMU_DEVRST0, BIT(14) },
> +	[RESET_GPIO]	= { CMU_DEVRST0, BIT(15) },
> +	[RESET_AUDIO]	= { CMU_DEVRST0, BIT(17) },
> +	[RESET_PCM0]	= { CMU_DEVRST0, BIT(18) },
> +	[RESET_VDE]	= { CMU_DEVRST0, BIT(19) },
> +	[RESET_VCE]	= { CMU_DEVRST0, BIT(20) },
> +	[RESET_GPU3D]	= { CMU_DEVRST0, BIT(22) },
> +	[RESET_NIC301]	= { CMU_DEVRST0, BIT(23) },
> +	[RESET_LENS]	= { CMU_DEVRST0, BIT(26) },
> +	[RESET_PERIPHRESET] = { CMU_DEVRST0, BIT(27) },
> +	[RESET_USB2_0]	= { CMU_DEVRST1, BIT(0) },
> +	[RESET_TVOUT]	= { CMU_DEVRST1, BIT(1) },
> +	[RESET_HDMI]	= { CMU_DEVRST1, BIT(2) },
> +	[RESET_HDCP2TX]	= { CMU_DEVRST1, BIT(3) },
> +	[RESET_UART6]	= { CMU_DEVRST1, BIT(4) },
> +	[RESET_UART0]	= { CMU_DEVRST1, BIT(5) },
> +	[RESET_UART1]	= { CMU_DEVRST1, BIT(6) },
> +	[RESET_UART2]	= { CMU_DEVRST1, BIT(7) },
> +	[RESET_SPI0]	= { CMU_DEVRST1, BIT(8) },
> +	[RESET_SPI1]	= { CMU_DEVRST1, BIT(9) },
> +	[RESET_SPI2]	= { CMU_DEVRST1, BIT(10) },
> +	[RESET_SPI3]	= { CMU_DEVRST1, BIT(11) },
> +	[RESET_I2C0]	= { CMU_DEVRST1, BIT(12) },
> +	[RESET_I2C1]	= { CMU_DEVRST1, BIT(13) },
> +	[RESET_USB3]	= { CMU_DEVRST1, BIT(14) },
> +	[RESET_UART3]	= { CMU_DEVRST1, BIT(15) },
> +	[RESET_UART4]	= { CMU_DEVRST1, BIT(16) },
> +	[RESET_UART5]	= { CMU_DEVRST1, BIT(17) },
> +	[RESET_I2C2]	= { CMU_DEVRST1, BIT(18) },
> +	[RESET_I2C3]	= { CMU_DEVRST1, BIT(19) },
> +	[RESET_ETHERNET] = { CMU_DEVRST1, BIT(20) },
> +	[RESET_CHIPID]	= { CMU_DEVRST1, BIT(21) },
> +	[RESET_USB2_1]	= { CMU_DEVRST1, BIT(22) },
> +	[RESET_WD0RESET] = { CMU_DEVRST1, BIT(24) },
> +	[RESET_WD1RESET] = { CMU_DEVRST1, BIT(25) },
> +	[RESET_WD2RESET] = { CMU_DEVRST1, BIT(26) },
> +	[RESET_WD3RESET] = { CMU_DEVRST1, BIT(27) },
> +	[RESET_DBG0RESET] = { CMU_DEVRST1, BIT(28) },
> +	[RESET_DBG1RESET] = { CMU_DEVRST1, BIT(29) },
> +	[RESET_DBG2RESET] = { CMU_DEVRST1, BIT(30) },
> +	[RESET_DBG3RESET] = { CMU_DEVRST1, BIT(31) },
> +};
> +
>  static struct owl_clk_desc s500_clk_desc = {
>  	.clks	    = s500_clks,
>  	.num_clks   = ARRAY_SIZE(s500_clks),
>  
>  	.hw_clks    = &s500_hw_clks,
> +
> +	.resets     = s500_resets,
> +	.num_resets = ARRAY_SIZE(s500_resets),
>  };
>  
>  static int s500_clk_probe(struct platform_device *pdev)
>  {
>  	struct owl_clk_desc *desc;
> +	struct owl_reset *reset;
> +	int ret;
>  
>  	desc = &s500_clk_desc;
>  	owl_clk_regmap_init(pdev, desc);
>  
> +	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
> +	if (!reset)
> +		return -ENOMEM;
> +
> +	reset->rcdev.of_node = pdev->dev.of_node;
> +	reset->rcdev.ops = &owl_reset_ops;
> +	reset->rcdev.nr_resets = desc->num_resets;
> +	reset->reset_map = desc->resets;
> +	reset->regmap = desc->regmap;
> +
> +	ret = devm_reset_controller_register(&pdev->dev, &reset->rcdev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to register reset controller\n");
> +
>  	return owl_clk_probe(&pdev->dev, desc->hw_clks);
>  }
>  
> -- 
> 2.27.0
> 
