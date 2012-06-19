From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [Patch v5 00/13] add imx usb driver for mx28/6x
Date: Tue, 19 Jun 2012 04:07:31 +0200
Message-ID: <201206190407.31524.marex@denx.de>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <F281D0F91ED19E4D8E63A7504E8A649803BE2DE2@039-SN2MPN1-023.039d.mgd.msft.net> <CAOMZO5C7KaxO_X23Ur9YwHEoAvCPf4emxMzH4mmrFX6=de5GZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5C7KaxO_X23Ur9YwHEoAvCPf4emxMzH4mmrFX6=de5GZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Fabio Estevam,

> Peter,
> 
> On Mon, Jun 18, 2012 at 10:14 PM, Chen Peter-B29397
> 
> <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >> Nothing shows up in the console after connecting the stick.
> >> 
> >> Attached my .config file.
> > 
> > Make sure the vbus is on for your usb port.
> 
> So what is the magic needed here? Isn't Richard's series supposed to work
> as is?
> 
> What should be done in addition to Richard's patch in order to get USB
> host to work on mx28evk?

Ah right, you need to toggle the power supply (vbus) GPIO.

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
