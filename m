Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839DBC43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 12:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56EC32081B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575464031;
	bh=KrClp9Nd6wxWZ4C+7+GANIBwUZyE6o5TbfPk7RfY+r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=heTUWnznm7EAN4zFSIO0CIkrgoHEEuetJ1qtdSzDl6TylncjOSG7HayFip3X5wBX7
	 GZBQUAo1yGgGcoJuHcfR6fM2WIjq7P0Q9n+AZMYW+e1PFBt4XwxaMDzo/rLf5Uvszc
	 fgy14RMDMj42DsqT+dMo45GMiYcxcOaoMeb3L31s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfLDMxv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 07:53:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:39444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfLDMxu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 4 Dec 2019 07:53:50 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAEF420674;
        Wed,  4 Dec 2019 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575464030;
        bh=KrClp9Nd6wxWZ4C+7+GANIBwUZyE6o5TbfPk7RfY+r4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ed2YBioUL3Xgm/lBvrUURCEg5JUb8HTynYNC7HDoVXX8BF5MH4XDxpth0m57vdo/r
         gqbkILgRhJdlVxUhyRTKKd4MFZhRc9mRAMxC4PDrvYXXMmiD0uE3zMvISoG+pBmLpP
         FeQ7yqr1+X81Ov/G1TEml29WDyeGT00niToZkTQ8=
Date:   Wed, 4 Dec 2019 20:53:37 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Christoph Fritz <chf.fritz@googlemail.com>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: phycore-imx6: set buck regulator modes
 explicitly
Message-ID: <20191204125336.GM3365@dragon>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
 <1573652416-9848-5-git-send-email-chf.fritz@googlemail.com>
 <AM5PR1001MB099480739860863EB08EA73280760@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <1574973044.2362.11.camel@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574973044.2362.11.camel@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 28, 2019 at 09:30:44PM +0100, Christoph Fritz wrote:
> Hi Shawn,
> 
>  any chance to get this patch queued for the upcoming kernel?

Sorry, no.  I need to wait for DA9063_BUCK_MODE_SYNC landing on 5.5-rc1,
and then apply this DTS patch.

Shawn

> 
> bye
>  -- Christoph
> 
> On Wed, 2019-11-13 at 16:26 +0000, Adam Thomson wrote:
> > On 13 November 2019 13:40, Christoph Fritz wrote:
> > 
> > > This patch sets initial buck regulator modes explicitly to a state this
> > > hardware needs. So a wrong initial mode set by bootloader or pmic itself
> > > does not interfere anymore.
> > > 
> > > Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> > 
> > Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> > 
> > > ---
> > >  arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > > b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > > index 6486df3..644625d 100644
> > > --- a/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > > +++ b/arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi
> > > @@ -5,6 +5,7 @@
> > >   */
> > > 
> > >  #include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/regulator/dlg,da9063-regulator.h>
> > > 
> > >  / {
> > >  	aliases {
> > > @@ -109,6 +110,7 @@
> > >  				regulator-name = "vdd_arm";
> > >  				regulator-min-microvolt = <730000>;
> > >  				regulator-max-microvolt = <1380000>;
> > > +				regulator-initial-mode =
> > > <DA9063_BUCK_MODE_SYNC>;
> > >  				regulator-always-on;
> > >  			};
> > > 
> > > @@ -116,6 +118,7 @@
> > >  				regulator-name = "vdd_soc";
> > >  				regulator-min-microvolt = <730000>;
> > >  				regulator-max-microvolt = <1380000>;
> > > +				regulator-initial-mode =
> > > <DA9063_BUCK_MODE_SYNC>;
> > >  				regulator-always-on;
> > >  			};
> > > 
> > > @@ -123,6 +126,7 @@
> > >  				regulator-name = "vdd_ddr3";
> > >  				regulator-min-microvolt = <1500000>;
> > >  				regulator-max-microvolt = <1500000>;
> > > +				regulator-initial-mode =
> > > <DA9063_BUCK_MODE_SYNC>;
> > >  				regulator-always-on;
> > >  			};
> > > 
> > > @@ -130,6 +134,7 @@
> > >  				regulator-name = "vdd_eth";
> > >  				regulator-min-microvolt = <1200000>;
> > >  				regulator-max-microvolt = <1200000>;
> > > +				regulator-initial-mode =
> > > <DA9063_BUCK_MODE_SYNC>;
> > >  				regulator-always-on;
> > >  			};
> > > 
> > > --
> > > 2.1.4
> > 
> 
> 
> 
