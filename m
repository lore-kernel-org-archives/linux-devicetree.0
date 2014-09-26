From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv4 2/6] ARM: dts: Add initial LS1021A QDS board dts support
Date: Fri, 26 Sep 2014 07:51:15 +0000
Message-ID: <8afdf8783f3c47558f35b7e88e2cde3c@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com>
 <1411371952-5618-3-git-send-email-jingchang.lu@freescale.com>
 <20140926061354.GD31948@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140926061354.GD31948@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shengchao Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huan Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "jaiprakash.singh-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <jaiprakash.singh-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

[...]
> > +
> > +	soc {
> > +		leds {
> 
> I think leds are board level devices and do not have to be under node
> "soc"?
> 
@Shawn,
Yes, it is.

@Jingchang,
For now we could just remove the led nodes here. There hasn't any real leds
On QDS(and for now we have to test their output pulse).

So this could be added later when need.

> > +			compatible = "pwm-leds";
> 
> Please have a new line between property list and device node ...
> 
This and the following issues about led will be fixed when adding this node separately
In the future.

[...]

Thanks,

BRs
Xiubo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
