Return-Path: <SRS0=Xu2X=R2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65]:36298 "EHLO
        vs81.iboxed.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727298AbfCWQlo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 Mar 2019 12:41:44 -0400
Date: Sat, 23 Mar 2019 16:41:58 +0000 (UTC)
From: Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH 1/3] ARM: dts: i.MX50: Add i2c, mmc and spi aliases
In-Reply-To: <20190322014928.GU12513@dragon>
Message-ID: <alpine.DEB.2.20.1903231639230.10071@blala.de>
References: <20190315211423.11308-1-akurz@blala.de> <20190322014928.GU12513@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: =?ISO-8859-15?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On Fri, 22 Mar 2019, Shawn Guo wrote:

> On Fri, Mar 15, 2019 at 09:14:21PM +0000, Alexander Kurz wrote:
> > Using aliases, the devices will be enumerated properly.
> > 
> > Signed-off-by: Alexander Kurz <akurz@blala.de>
> > ---
> >  arch/arm/boot/dts/imx50.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
> > index ee1e3e8bf4ec..82e7acd7fc2a 100644
> > --- a/arch/arm/boot/dts/imx50.dtsi
> > +++ b/arch/arm/boot/dts/imx50.dtsi
> > @@ -26,11 +26,20 @@
> >  		gpio3 = &gpio4;
> >  		gpio4 = &gpio5;
> >  		gpio5 = &gpio6;
> > +		i2c0 = &i2c1;
> > +		i2c1 = &i2c2;
> 
> Reminded by Jonathan's patch, i2c3 is missing here.  I just fixed it up.
> Let's me know if you have a reason for not adding i2c3.
I have missed i2c3, thanks for checking and fixing it.
Alexander
