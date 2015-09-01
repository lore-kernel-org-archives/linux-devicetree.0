From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v2 2/4] remoteproc: dt: Provide bindings
 for ST's Remote Processor Controller driver
Date: Tue, 1 Sep 2015 10:14:49 +0100
Message-ID: <20150901091449.GQ4796@x1>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-3-git-send-email-lee.jones@linaro.org>
 <20150901085825.GC30542@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150901085825.GC30542@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 01 Sep 2015, Peter Griffin wrote:

> Hi Lee,
>=20
> On Fri, 28 Aug 2015, Lee Jones wrote:
>=20
> > Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/remoteproc/st-rproc.txt    | 35 ++++++++++=
++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/st=
-rproc.txt
>=20
> The patch documening the DT bindings should be ordered before the pat=
ch which adds
> the DT node to aid reviewing.
> >=20
> > diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.=
txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > new file mode 100644
> > index 0000000..fbd7d78
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> > @@ -0,0 +1,35 @@
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
> > +Required properties:
> > +- compatible		Should be one of:
> > +				"st,st231-rproc"
> > +				"st,st40-rproc"
>=20
> st40-proc isn't used anywhere. The stih407 doesn't have a ST40 copro,=
 and
> looking in the vendor tree remoteproc support isn't present for stih4=
15/6 which
> are the the only upstream SoC's to have a ST40 co-pro.
>=20
> So I think st40-rproc support can be removed.
>=20
> > +- reg			Size and length of reserved co-processor memory
> > +- resets		Reset lines (See: ../reset/reset.txt)
> > +- reset-names		Must be "sw_reset" and "pwr_reset"
>=20
> pwr_reset isn't used by any of the st231 co-processors. It seems to
> be related to ST40 support which I don't think is required upstream.
> Removing it would make the driver a fair bit smaller.
>=20
> > +- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt=
)
> > +- clock-names		Must be "rproc_clk"
>=20
> I can't see any co-pro which uses more than one clock, so clock-names=
 looks
> superflous.
>=20
> > +- clock-frequency	Clock frequency to set co-processor at if the bo=
otloader
> > +			hasn't already done so
> > +- st,syscfg-boot	The register that holds the boot vector for the c=
o-processor
>=20
> I would prefer to see this binding match how most other sti drivers r=
eference syscfg
> registers which is: -
>=20
> st,syscfg       =3D <&syscfg_core 0xf4>;
>=20
> Description: phandle of sysconfig bank plus integer array containing =
register offsets.
>=20
> It also means it is easily extendable if more than one syscfg registe=
r is
> required in the future to boot a co-pro.

Ack.  Good points, will fix.

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
