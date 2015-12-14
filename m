From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Mon, 14 Dec 2015 09:26:55 -0200
Message-ID: <CAOMZO5CfBKuJ584jwbg98s9tn+0Z7W0nOaZnUkm4cJUSvNGTZw@mail.gmail.com>
References: <1450077974-22762-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450077974-22762-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Patryk Kowalczyk <patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Mon, Dec 14, 2015 at 5:26 AM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Hi all,
>
> There is a known issue that the USB code can't handle USB HUB's
> external pins well, in that case, it may cause some onboard
> USB HUBs can't work since their PHY's clock or reset pin needs to
> operate.
>
> The user reported this issue at below:
> http://www.spinics.net/lists/linux-usb/msg131502.html
>
> In this patch set, I add a generic onboard USB HUB driver to
> handle this problem, the external signals will be configured
> before usb controller's initialization, it much likes we did
> it at board code before.
>
> The user needs to add this generic hub node at dts to support it.
>
> @The udoo users, help to test please.

This is what I get with your series applied:

[    2.288300] usb 1-1: device descriptor read/64, error -71
[    2.518083] usb 1-1: new full-speed USB device number 3 using ci_hdrc
[    2.738078] usb 1-1: device descriptor read/64, error -71
[    3.058078] usb 1-1: device descriptor read/64, error -71
[    3.288079] usb 1-1: new full-speed USB device number 4 using ci_hdrc
[    3.768069] usb 1-1: device not accepting address 4, error -71
[    3.888084] usb 1-1: new full-speed USB device number 5 using ci_hdrc
[    4.368067] usb 1-1: device not accepting address 5, error -71
[    4.374117] usb usb1-port1: unable to enumerate USB device
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
