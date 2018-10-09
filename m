Return-Path: <SRS0=6MUZ=MV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34426 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbeJIQgc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Oct 2018 12:36:32 -0400
Received: by mail-ed1-f68.google.com with SMTP id w19-v6so1023576eds.1
        for <devicetree@vger.kernel.org>; Tue, 09 Oct 2018 02:20:34 -0700 (PDT)
Date: Tue, 9 Oct 2018 11:20:32 +0200
From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: Can't set MX6UL_PAD_LCD_DATA10 register with devicetree
Message-ID: <20181009092032.GB13624@graute-opti>
References: <20181005124519.GA7699@graute-opti>
 <CAOMZO5AivtqPAdcNJk8O2pnse4-gTzL+rzxk7G6gwCcdUcZjHg@mail.gmail.com>
 <20181009062829.GA4362@graute-opti>
 <e4e78033-7eb2-67b7-e7b9-daf54895bc9e@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4e78033-7eb2-67b7-e7b9-daf54895bc9e@ysoft.com>
Sender: devicetree-owner@vger.kernel.org
To: =?utf-8?B?Vm9rw6HEjQ==?= Michal <Michal.Vokac@ysoft.com>
Cc: Fabio Estevam <festevam@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On 09/10/18, Vokáč Michal wrote:
> On 9.10.2018 08:28, Oliver Graute wrote:
> > On 08/10/18, Fabio Estevam wrote:
> >> Hi Oliver,
> >>
> >> On Fri, Oct 5, 2018 at 9:46 AM Oliver Graute <oliver.graute@gmail.com> wrote:
> >>>
> >>> Hello list,
> >>>
> >>> I try to set the following PAD in my imx6ul devicetree (derived from
> >>> imx6ul-14x14-evk.dts)
> >>>
> >>> MX6UL_PAD_LCD_DATA10__GPIO3_IO15 0x100b0
> >>
> >> I don't see anything wrong with the definition of
> >> MX6UL_PAD_LCD_DATA10__GPIO3 in imx6ul-pinfunc.h.
> >>
> >> Could you share your whole dts file?
> > 
> > see dts file below
> >>
> >> Are you sure you are not getting a pin conflict due to previous usage
> >> of MX6UL_PAD_LCD_DATA10?
> > 
> > I commented out the MX6UL_PAD_LCD_DATA10__LCDIF_DATA10 Pad in the lcdif section
> > is this sufficient?
> 
> As Fabio noted - you use the same pad in two pinctrl groups.
> One usage is in the pinctrl_hog3 group as a GPIO and second usage is in
> the pinctrl_lcdif_dat group as a LCD data signal. That is actually OK.
> 
> The problem is that neither of those two pinctrl groups is used by some
> device node and hence the configuration is not applied.

yes you are right!
> 
> If you want configure all the pins in the pinctrl_hog3 group you probably
> need to use it in the iomuxc node. See bellow.
> 
> > &iomuxc {
> > 	pinctrl-names = "default";
> 
> Add this line to configure all the pins in hog3 group when pinctrl is probed.
> 
> 	pinctrl-0 = <&pinctrl_hog3>;

this line indeed solved my problem, now the register value is fine.

many thanks for this hint.

Best regards,

Oliver
