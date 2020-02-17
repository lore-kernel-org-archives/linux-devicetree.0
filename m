Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F35C35242
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 03:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 994E821744
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 03:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581911667;
	bh=jrF0oNRyAPvPKYYpF8tmM5q6hhzDDWjQzsZFCTo4Ikc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y0raaykvene6aB5FD/JmvA034tTxsMEYG9dA0VXf31z3v8OXRfgkCdvPFVdQjqRb7
	 w7mTp9KCr7pfrbIBCbIYW5lqrX8Jjkyje9ifNQlkbyH4sSozet7FOEtEzQEz9C4o8B
	 rPNX7oWe/LgbazmKm/5Wi/9RrYck0eSmd0PqX0JU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBQDy0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 22:54:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:59632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgBQDy0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 16 Feb 2020 22:54:26 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2BCC2072C;
        Mon, 17 Feb 2020 03:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581911666;
        bh=jrF0oNRyAPvPKYYpF8tmM5q6hhzDDWjQzsZFCTo4Ikc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbppxtE2EaohmfIqplGUBKlCfsZT1Lp29fHIY07N/pv1pgPZ4spbRmWBdzLkL2bfq
         2LsmfeIjF0Nrh5D/5DHXJLXYJ/03eipk3xWU0qvxjJ6awGWA/Oi4iOWdG0WdvxNloR
         Jbfp5PZ7ZrYgondMAjyP46dVAEpc6KdfCiu6ETGA=
Date:   Mon, 17 Feb 2020 11:54:16 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, devicetree@vger.kernel.org, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: Re: [PATCH v1 01/12] arm64: dts: librem5-devkit: add sai2 and sai6
 pinctrl definitions
Message-ID: <20200217035416.GB5395@dragon>
References: <20200205143003.28408-1-martin.kepplinger@puri.sm>
 <20200205143003.28408-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205143003.28408-2-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 05, 2020 at 03:29:52PM +0100, Martin Kepplinger wrote:
> From: "Angus Ainslie (Purism)" <angus@akkea.ca>
> 
> Add missing sai2 and sai6 audio interface pinctrl definitions for the
> Librem 5 devkit.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 764a4cb4e125..9702db69d3ed 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -555,6 +555,25 @@
>  		>;
>  	};
>  
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins = <
> +		MX8MQ_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC	0xd6

Please be consistent with existing indentation style.

Shawn

> +		MX8MQ_IOMUXC_SAI2_TXC_SAI2_TX_BCLK	0xd6
> +		MX8MQ_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0	0xd6
> +		MX8MQ_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0	0xd6
> +		MX8MQ_IOMUXC_SAI2_MCLK_SAI2_MCLK	0xd6
> +		>;
> +	};
> +
> +	pinctrl_sai6: sai6grp {
> +		fsl,pins = <
> +		MX8MQ_IOMUXC_SAI1_RXD5_SAI6_RX_DATA0	0xd6
> +		MX8MQ_IOMUXC_SAI1_RXD6_SAI6_RX_SYNC	0xd6
> +		MX8MQ_IOMUXC_SAI1_TXD4_SAI6_RX_BCLK     0xd6
> +		MX8MQ_IOMUXC_SAI1_TXD5_SAI6_TX_DATA0	0xd6
> +		>;
> +	};
> +
>  	pinctrl_typec: typecgrp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_NAND_DATA06_GPIO3_IO12		0x16
> -- 
> 2.20.1
> 
