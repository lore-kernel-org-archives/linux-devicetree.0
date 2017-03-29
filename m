From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v3 4/7] arm: dts: r7s72100: Add pin controller node
Date: Wed, 29 Mar 2017 15:26:11 +0200
Message-ID: <20170329132611.GC6247@w540>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-5-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB11651E209BC332719059CC3F8A330@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11651E209BC332719059CC3F8A330@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Mon, Mar 27, 2017 at 05:12:04PM +0000, Chris Brandt wrote:
> Hi Jacopo,
> 
> 
> On Friday, March 24, 2017, Jacopo Mondi
> > +	pinctrl: pinctrl@fcfe3000 {
> > +		compatible = "renesas,r7s72100-ports";
> > +
> > +		#pinctrl-cells = <1>;
> > +
> > +		reg = <0xfcfe3000 0x42C0>;
> 
> Out of curiosity, why did you change this from 0x4248 to 0x42C0?
> 
> In your update for renesas,rza1-pinctrl.txt, for the 'Example', you changed it from 0x4248 to 0x4230 (which Geert pointed out makes more sense), but then in the actual DT file you changed it to 0x42C0. Typo?
>

Yes, type.
Or inability to perform basic mathematical operations.
Not sure yet.

Thanks for spotting this :)
   j


> 
> Chris
> 
