From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6q-cm-fx6: fix the operation points
Date: Sun, 12 Jun 2016 11:36:59 -0300
Message-ID: <CAOMZO5APbW8Hc_HCEyF=22T320KJ6K+E1AVpZPH4Rkzjqi-8rQ@mail.gmail.com>
References: <6b48c849983548f29259b42d69c5224c@rwthex-s1-b.rwth-ad.de>
 <650a7982db35484194a0be26863a89f9@rwthex-s1-a.rwth-ad.de> <2256c64f85d847d29c2c3e0f4e095d90@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2256c64f85d847d29c2c3e0f4e095d90-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 12, 2016 at 11:05 AM, Christopher Spinrath
<christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:

> Well, without this patch the SoC runs at 1.2GHz so it seems like the
> fuse indicates that it is possible. But with a fair amount of IPs
> enabled and high load the board becomes unstable (display
> flickering/blanks, ethernet package drops, ...). I guess CompuLab
> allowed 1.2GHz at first and then realized that it is a bad idea (at
> least for some boards).
>
> Is there any way to influence the fuse (e.g. from the
> firmware/bootloader) or do you have another proposal on how to fix this
> issue?

Ok, understood. So the mx6q fuse indicates that 1.2GHz operation is
possible on , but the board itself does not behave nicely at this
frequency.

Maybe you could send a v2 of this patch that matches the operating
points form mx6qdl.dtsi and remove only the 1.2GHz entry and put the
explanation you gave us here in the dts and commit log.

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
