From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Tue, 22 May 2012 10:00:28 +0800
Message-ID: <CAAQ0ZWS_n94j3CePa9qc-HghQnZX7JzW4Fn0gawM1e_x_RDO=g@mail.gmail.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
	<201205212141.52171.marex@denx.de>
	<4FBA9BE4.7020303@grid-net.com>
	<201205212207.34978.marex@denx.de>
	<F281D0F91ED19E4D8E63A7504E8A649803BB2B2F@039-SN2MPN1-023.039d.mgd.msft.net>
	<20120522014158.GF6206@b20223-02.ap.freescale.net>
	<F281D0F91ED19E4D8E63A7504E8A649803BB2B79@039-SN2MPN1-023.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F281D0F91ED19E4D8E63A7504E8A649803BB2B79-RL0Hj/+nBVDtkydW1Tv2Dq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org" <linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22 May 2012 09:44, Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > This driver needs to work on both DT and non-DT support.
>> > Let's do it after next version when we need to add it for old mxc
>> platform.
>> I don't think so. We only need to go right direction and don't do
>> extra work for what is going to be abandoned.
> Are you sure all i.mx platform will support DT in future?
>
I'm with Richard on this.  With all new drivers support DT only, we
can attract people to convert their platform to DT, if they want to
use the new driver.  Otherwise, people lose motivation to move to DT.

Regards,
Shawn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
