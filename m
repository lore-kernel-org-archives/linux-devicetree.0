From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: imx: source gpt per clk from OSC for system
 timer
Date: Wed, 10 Sep 2014 21:01:52 +0800
Message-ID: <20140910130150.GF22579@dragon>
References: <1409887606-22388-1-git-send-email-b20788@freescale.com>
 <1409887606-22388-4-git-send-email-b20788@freescale.com>
 <CAOMZO5CJLSXy3p-eAe9xOJw8p4gxoRuT91bXV8gswy5oMuU6XQ@mail.gmail.com>
 <5E619FDB-56BB-486E-B627-9D2A9D4F9F54@freescale.com>
 <20140910073333.GC22579@dragon>
 <7fd82b8c08c54f4dadb6b7402231a086@BN1PR0301MB0628.namprd03.prod.outlook.com>
 <20140910114936.GE22579@dragon>
 <8DDD46F6-AA96-4E14-ADD6-45A1AD12423C@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8DDD46F6-AA96-4E14-ADD6-45A1AD12423C-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 12:31:48PM +0000, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> I think it should be OK now, but for the "try osc_per clk first ..." the check
> should be as below?
> 
> If (IS_ERR(clk_per))
>       clk_per = of_clk_get_by_name(np, "per");
> 

Ah, yes.  That was a mistake in my example code.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
