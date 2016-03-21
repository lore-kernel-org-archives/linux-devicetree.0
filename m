From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95 enablement
Date: Mon, 21 Mar 2016 15:36:49 -0700
Message-ID: <CAOi56cXFEUZuu0bJknUYNhfR2jL=LYUTbpnX9diZw2B5JfTaEQ@mail.gmail.com>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456886101-22967-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 1, 2016 at 6:34 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> =
wrote:

> This series adds initial support for the Amlogic S905 based
> Tronsmart Vega S95 Pro, Meta and Telos TV boxes.
>
> v2:
> * Pick up previously acked "tronsmart" patch instead (Matthias)
> * Drop ARM_GIC selection (Sudeep)
> * Change some compatible strings (Sudeep, Andr=C3=A9)
> * Squash some node changes/additions
>
> Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
> in order to avoid the vendor U-Boot overwriting itself (fwiu);
> for the Mini Mx that's reportedly not necessary.

=46YI, the Amlogic P200 dev board also needs this hack with the factory=
 u-boot.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
