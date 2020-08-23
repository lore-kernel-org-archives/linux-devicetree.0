Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8267BC433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 02:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 539DD2080D
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 02:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598149155;
	bh=NRYoiNtAhE4tvIlcnFXX/87kIrp0hYWz1W2Z99evvic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RW1HpFgi27RgJ8f7a/JkzHAAwlQ2aD8nGrPB6P0Q7HCsvCHL5QCKNaZcxWR4k2ZcC
	 Snu+ilOeohIIU9DDS9rh0O9fCp2U88AjXExE93JMf30uolc/LtbzSlDVe0SDLG6vZ9
	 F9J3NqVt860W0BN4jsVj8ILESMcVotrWFV/nKJT4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHWCTO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 22:19:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgHWCTO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 22:19:14 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00E3A2078D;
        Sun, 23 Aug 2020 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598149154;
        bh=NRYoiNtAhE4tvIlcnFXX/87kIrp0hYWz1W2Z99evvic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q8DlXKoQ8yLJNAW8wRzws9K45pUguZrijRrQO9xW/bLyolqjNVwxc+cFh88/Aa83B
         VLq6x76bG87NvhuYCJMdIz60l9Ro5WRQF3X9ap3zVL9tsaF09ktAZZRNy6O35t/Izf
         +TF6viTfhF7wjxtnHju304Z9JQZf/SsueZOsAdxM=
Date:   Sun, 23 Aug 2020 10:19:08 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] ARM: dts: imx6q-logicpd: Fix broken PWM
Message-ID: <20200823021908.GO30094@dragon>
References: <20200819195944.2866832-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819195944.2866832-1-aford173@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 02:59:44PM -0500, Adam Ford wrote:
> The DTC doesn't like the default PWM settings, because it's expecting
> three cells.  This patch reduces adds the extra entry of 0 to the PWM
> reference.
> 
> Fixes:  fa28d8212ede ("ARM: dts: imx: default to #pwm-cells = <3> in the SoC dtsi files")
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
