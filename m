From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 6/7] ARM: dts: imx6ul: add support for TXUL modules on
 TXUL-Mainboard
Date: Tue, 17 Oct 2017 11:50:14 +0200
Message-ID: <20171017115014.5632584d@karo-electronics.de>
References: <1507891383-15452-1-git-send-email-LW@KARO-electronics.de>
        <1507891383-15452-7-git-send-email-LW@KARO-electronics.de>
        <CAOMZO5BbRwnggKPUo=evT=nHxo9k6v3d-zNLaiOPWabDNdLgpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BbRwnggKPUo=evT=nHxo9k6v3d-zNLaiOPWabDNdLgpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 16 Oct 2017 18:33:17 -0200 Fabio Estevam wrote:
> Hi Lothar,
> 
> On Fri, Oct 13, 2017 at 7:43 AM, Lothar Waßmann <LW@karo-electronics.de> wrote:
> 
> > +/ {
> > +       aliases {
> > +               lcdif_24bit_pins_a = &pinctrl_disp0_3;
> > +               mmc0 = &usdhc1;
> 
> Is this mmc0 alias really needed here?
> 
> I see it inside imx6ul.dtsi, but even inside imx6ul.dtsi: does it make
> sense to have mmc alias?
> 
It is not used by Linux, but it's a convenient way to address the mmc
devices with the U-Boot 'fdt' command.
E.g.:
fdt set mmc0 status disabled
rather than:
fdt set /soc/aips-bus@02100000/usdhc@02190000 status disabled


Lothar Waßmann
