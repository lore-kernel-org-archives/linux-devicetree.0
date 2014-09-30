From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv4 2/6] ARM: dts: Add initial LS1021A QDS board dts support
Date: Tue, 30 Sep 2014 11:39:21 +0200
Message-ID: <5453997.HOc1sLj4Fj@wuerfel>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com> <20140926061354.GD31948@dragon> <7ecfaed8cb1b4c228ee2eb20aab33429@BL2PR03MB467.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ecfaed8cb1b4c228ee2eb20aab33429-AZ66ij2kwab4MB1ZSnT4iOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shengchao Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Huan Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "jaiprakash.singh-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <jaiprakash.singh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 28 September 2014 08:48:17 Jingchang Lu wrote:
> >> +            i2c@3 {
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <0>;
> >> +                    reg = <0x3>;
> >> +
> >> +                    eeprom@56 {
> >> +                            compatible = "at24,24c512";
> >
> >Undocumented property.
> It documented in Documentation/devicetree/bindings/eeprom.txt as the form of "<manufacturer>,<type>". Thanks.
> >
> 

The documented vendor name for Atmel is "atmel", not "at24".

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
