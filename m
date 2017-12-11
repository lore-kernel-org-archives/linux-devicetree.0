From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 03/20] ARM: dts: aspeed-g4: Correct VUART IRQ number
Date: Mon, 11 Dec 2017 08:58:42 +0100
Message-ID: <CAK8P3a2psgOYZEgO8O3H_xxpDTNd=ESJpSf4bs9kf0nPvKYqtQ@mail.gmail.com>
References: <20171211050704.20621-1-joel@jms.id.au> <20171211050704.20621-4-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211050704.20621-4-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 6:06 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> This should have always been 8.
>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

As this is a bugfix, should we backport it to stable kernels? When you
fix a bug,
I generally recommend including a 'Fixes' tag with the commit ID of the patch
that introduced the problem, and either a 'Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org' tag
if you want it backported, or an explanation in the changelog why it should
not get backported. This really helps Greg and the other stable maintainers
trying to make a decision what to backport and what not.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
