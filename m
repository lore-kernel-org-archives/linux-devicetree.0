From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND v4 0/6] remoteproc: Add driver for STMicroelectronics
 platforms
Date: Thu, 26 Nov 2015 09:10:43 +0000
Message-ID: <20151126091043.GO12874@x1>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
 <CAK=WgbZbiq_BAUEti9tWUtWqZPU_4gDJ5Mfqur=Ou2N4Ea+2GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK=WgbZbiq_BAUEti9tWUtWqZPU_4gDJ5Mfqur=Ou2N4Ea+2GQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 26 Nov 2015, Ohad Ben-Cohen wrote:
> On Tue, Nov 24, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
> > ST's platforms often have multiple co-processors (usually ST40s or =
ST231s)
> > on-board.  This provides the Linux-side infrastructure to flash and=
 boot
> > them successfully.
> >
> > This set has been tested on an STiH410-B2120.
>=20
> It would be nice if you could get at least one Reviewed-by tag coming
> outside of ST (e.g., Suman or Bjorn who are actively using and
> improving remoteproc).

If you require reviews by these guys, shouldn't they be Maintainers?

> >  arch/arm/boot/dts/stih407-family.dtsi              |  70 +++++
>=20
> Since this is outside of remoteproc, please have it Acked, preferably
> by ARM DT maintainer (Olof?).

The bindings have already been Acked by Rob.  So long as the DTS(I)
files conform to them, there should be no issue.  Please be aware that
the DTS(I) changes are applied to this set for your information only
and are not to be applied through the RemoteProc tree.  The usual
process to which we conform is that Maxime (the STi Maintainer) will
apply the DT changes *after* the main driver has been applied, in this
case by you.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
