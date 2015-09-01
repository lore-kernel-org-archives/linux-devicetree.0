From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v2 3/4] remoteproc: Supply controller
 driver for ST's Remote Processors
Date: Tue, 1 Sep 2015 10:12:43 +0100
Message-ID: <20150901091243.GP4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-4-git-send-email-lee.jones@linaro.org>
 <55E08B34.9080102@mentor.com>
 <20150901075538.GJ4796@x1>
 <20150901081700.GA30542@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150901081700.GA30542@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Sep 2015, Peter Griffin wrote:

> Hi,
>=20
> On Tue, 01 Sep 2015, Lee Jones wrote:
>=20
> > On Fri, 28 Aug 2015, Nathan Lynch wrote:
> >=20
> > > On 08/28/2015 05:31 AM, Lee Jones wrote:
> > > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kc=
onfig
> > > > index 28c711f..72e97d7 100644
> > > > --- a/drivers/remoteproc/Kconfig
> > > > +++ b/drivers/remoteproc/Kconfig
> > > > @@ -77,4 +77,13 @@ config DA8XX_REMOTEPROC
> > > >  	  It's safe to say n here if you're not interested in multime=
dia
> > > >  	  offloading.
> > > > =20
> > > > +config ST_REMOTEPROC
> > > > +	tristate "ST remoteproc support"
> > > > +	depends on ARCH_STI
> > > > +	select REMOTEPROC
> > > > +	help
> > > > +	  Say y here to support ST's adjunct processors via the remot=
e
> > > > +	  processor framework.
> > > > +	  This can be either built-in or a loadable module.
> > > > +
> > >=20
> > > The code uses reset_control_* APIs, so this should depend on
> > > RESET_CONTROLLER, no?
> >=20
> > There's no need to explicitly depend on RESET_CONTROLLER.
> >=20
> > With !RESET_CONTROLLER the user is WARN()ed about using the reset_*
> > API.
>=20
> ARCH_STI selects RESET_CONTROLLER, so it will always be enabled.

That too.  Thanks for pointing that out.

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
