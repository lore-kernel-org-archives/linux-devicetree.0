From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul: Add flexcan1 and flexcan2 support
Date: Sat, 20 Feb 2016 15:29:44 -0200
Message-ID: <CAOMZO5DfKi5KymQ6p9yF4ntqEJ7O=EEE7CKFmS-0N2XL8=ET7A@mail.gmail.com>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
	<1455963652-24618-2-git-send-email-michael@amarulasolutions.com>
	<CAOMZO5Bk_ZMhYzFLRFNK2TQvK4KHuj62AM_6uF-m-P1kJupTHQ@mail.gmail.com>
	<20160220171816.GA24064@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160220171816.GA24064@panicking>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 20, 2016 at 3:18 PM, Michael Trimarchi
<michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:

> ok. Can you point me out to a driver in freescale source that use it?

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/net/can/flexcan.c?h=imx_3.14.52_1.1.0_ga#n1146
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
