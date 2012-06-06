From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 00/12] add imx usb driver for mx28/6x
Date: Wed, 6 Jun 2012 14:27:34 +0800
Message-ID: <CAAQ0ZWQATu+grzkpy=TLVSbqTGDScj=Zp-zMfwNu1E4=55s0vA@mail.gmail.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
	<20120605150209.GZ28631@arwen.pp.htv.fi>
	<20120606022714.GA2667@S2101-09.ap.freescale.net>
	<20120606060348.GD32345@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120606060348.GD32345-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6 June 2012 14:03, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Yes, sure but the whole series is very "coupled" together... Maybe
> Richard could try to split this series into things that can go through
> arm-soc with no dependency on the other part and things that depend on
> drivers/usb/*
>
As far as arch/arm patches applying concerned, I haven't seen any
dependency on drivers/usb part.  If those patches can be applied on
arm-soc tree and do not break anything, that's good enough.  For usb
to actually function, we will need to wait usb and arm-soc trees get
together somewhere, firstly linux-next, eventually mainline.

Regards,
Shawn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
