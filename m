From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v5 00/13] add imx usb driver for mx28/6x
Date: Mon, 18 Jun 2012 23:17:24 -0300
Message-ID: <CAOMZO5Ap_KYM7uYebqOaCzpTzH2kcCFR6BTWX9GMKxsXoxCOew@mail.gmail.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
	<F281D0F91ED19E4D8E63A7504E8A649803BE2DE2@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAOMZO5C7KaxO_X23Ur9YwHEoAvCPf4emxMzH4mmrFX6=de5GZA@mail.gmail.com>
	<201206190407.31524.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201206190407.31524.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2012 at 11:07 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:

>> What should be done in addition to Richard's patch in order to get USB
>> host to work on mx28evk?
>
> Ah right, you need to toggle the power supply (vbus) GPIO.

Toggle it where?

I see the following:

reg_usb0_vbus: usb0_vbus {
compatible = "regulator-fixed";
regulator-name = "usb0_vbus";
regulator-min-microvolt = <5000000>;
regulator-max-microvolt = <5000000>;
gpio = <&gpio3 9 0>;
enable-active-high;

So the gpio3_9 will turn on the vbus.

What is missing?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
