From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Wed, 26 Aug 2015 17:40:12 +0100
Message-ID: <20150826164012.GA19409@x1>
References: <1440594483-29601-1-git-send-email-lee.jones@linaro.org>
 <1440594483-29601-2-git-send-email-lee.jones@linaro.org>
 <55DDE25A.2050000@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55DDE25A.2050000-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 26 Aug 2015, Nathan Lynch wrote:

> On 08/26/2015 08:08 AM, Lee Jones wrote:
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.=
txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > new file mode 100644
> > index 0000000..6a933c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > @@ -0,0 +1,38 @@
> > +STMicroelectronics Remote Processor
> > +-----------------------------------
> > +
> > +This binding provides support for adjunct processors found on ST S=
oCs.
> > +
> > +The remote processors can be controlled from the bootloader or the=
 primary OS.
> > +If the bootloader starts a remote processor processor the primary =
OS must detect
> > +its state and act accordingly.
> > +
> > +The node name is significant, as it defines the name of the CPU an=
d the name
> > +of the firmware to load: "rproc-<name>-fw".
>=20
> This business about the firmware name describes a behavior of Linux's
> core remoteproc code and seems out of place in a binding document.

Agreed, will remove.

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
