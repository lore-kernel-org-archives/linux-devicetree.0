From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: berlin: add the LIBGPIO as a dependency for the
 BG2Q
Date: Tue, 15 Apr 2014 11:26:48 +0200
Message-ID: <20140415092648.GB4584@kwain>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
 <20140415170750.7721e907@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140415170750.7721e907@xhacker>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

On Tue, Apr 15, 2014 at 05:07:50PM +0800, Jisheng Zhang wrote:
> On Tue, 15 Apr 2014 01:07:24 -0700
> Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
[=E2=80=A6]
> > diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kc=
onfig
> > index 291f1cac6c3d..c31968712095 100644
> > --- a/arch/arm/mach-berlin/Kconfig
> > +++ b/arch/arm/mach-berlin/Kconfig
> > @@ -28,6 +28,7 @@ config MACH_BERLIN_BG2Q
> >  	select CPU_V7
> >  	select HAVE_ARM_TWD if SMP
> >  	select HAVE_SMP
> > +	select ARCH_REQUIRE_GPIOLIB
>=20
> alphabetically sort.

You're right, will do.

Antoine

--=20
Antoine T=C3=A9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
