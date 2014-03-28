From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Fri, 28 Mar 2014 09:28:53 -0300
Message-ID: <20140328122853.GA1636@arch.cereza>
References: <1394626349-16024-1-git-send-email-abrodkin@synopsys.com>
 <1395934023.3511.1.camel@abrodkin-8560l.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395934023.3511.1.camel-qexTn8sybohw4zDQoAj8xIno5vre8uhWHKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Francois Bedard <Francois.Bedard-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 27, Alexey Brodkin wrote:
> On Wed, 2014-03-12 at 16:12 +0400, Alexey Brodkin wrote:
> > Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> >=20
> > Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/axs-nand.txt |  17 +
> >  drivers/mtd/nand/Kconfig                           |   6 +
> >  drivers/mtd/nand/Makefile                          |   1 +
> >  drivers/mtd/nand/axs_nand.c                        | 412 +++++++++=
++++++++++++
> >  4 files changed, 436 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/axs-nand.=
txt
> >  create mode 100644 drivers/mtd/nand/axs_nand.c
>=20
> Any chance to this patch reviewed, commented, accepted?
>=20

=46WIW, I plan to review this any time soon...
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
