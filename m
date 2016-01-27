From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/7] remoteproc: Add driver for STMicroelectronics
 platforms
Date: Wed, 27 Jan 2016 07:31:24 +0000
Message-ID: <20160127073124.GI3368@x1>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452602781-22424-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Apologies for ping (I hate doing that), but I haven't heard anything
from you.  Do you want me to re-submit this set, or are you willing to
take this and apply the relevant Acks?

> ST's platforms often have multiple co-processors (usually ST40s or ST=
231s)
> on-board.  This provides the Linux-side infrastructure to flash and b=
oot
> them successfully.
>  =20
> This set has been tested on an STiH410-B2120.
>=20
> v4 =3D> v5:
>  - Check for invalid 'count' (command read length) in write fn()s
>  =20
> v3 =3D> v4:
>  Suggested-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>  - Move to using 'reserved-memory' API
>    - New 'reserved-memory' nodes
>    - Remove memory locations from RemoteProc's DT node's reg properti=
es
>    - Remove C code obtaining/allocating DMA memory
>  - Re-order .start() and .stop() ops
>  - Add protection around Reset API in error path
>  - Explicitly set .has_iommu to false
>  =20
> v2 =3D> v3:
>  - Generify syscon property (st,syscfg-boot =3D> st,syscfg)
>  - Rename IP in DT bindings doc (Remote Processor =3D> Co-Processor)
>  - Remove superfluous 'clock-names' property
>  - Remove superfluous 'reg-names' property
>  - Populate MAINTAINERS
>  - Clean-up DTS formatting
>  - Use strings in debugfs to control procs ('1|0' =3D> 'start|stop')
>  - Align copyright statement with MODULE() macros
>  - Rename driver data structure ('st_rproc' =3D> 'ddata')
>  - Addition of a full error path in .start()
>=20
> v1 =3D> v2:
>  - Remove Linux implementation specific comment from binding document
>  - Force debugfs '0' to shutdown co-processor - rather than !1
>  - Supply more detailed commit message
>  - Propagate errors back from .stop()
>  - Review GPL wording
>  - Supply original author's SoBs
>=20
> Lee Jones (7):
>   remoteproc: debugfs: Check of invalid 'count' value
>   remoteproc: dt: Provide bindings for ST's Remote Processor Controll=
er
>     driver
>   remoteproc: debugfs: Add ability to boot remote processor using
>     debugfs
>   remoteproc: Supply controller driver for ST's Remote Processors
>   MAINTAINERS: Add ST's Remote Processor Driver to ARM/STI ARCHITECTU=
RE
>   ARM: STiH407: Add nodes for RemoteProc
>   ARM: STiH407: Move over to using the 'reserved-memory' API for
>     obtaining DMA memory
>=20
>  .../devicetree/bindings/remoteproc/st-rproc.txt    |  41 +++
>  MAINTAINERS                                        |   1 +
>  arch/arm/boot/dts/stih407-family.dtsi              |  70 +++++
>  drivers/remoteproc/Kconfig                         |   9 +
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/remoteproc_debugfs.c            |  38 ++-
>  drivers/remoteproc/st_remoteproc.c                 | 297 +++++++++++=
++++++++++
>  7 files changed, 455 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st-r=
proc.txt
>  create mode 100644 drivers/remoteproc/st_remoteproc.c
>=20

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
