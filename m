From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH Resend 1/1] Revert "of/exynos_g2d: Add Bindings for exynos
	G2D driver"
Date: Fri, 12 Apr 2013 17:47:06 +0900
Message-ID: <CAAQKjZMm_vL1vTP3HHDw8W2ZTRgA+4E_ZLSSERKmR1pAx1o07A@mail.gmail.com>
References: <1365745471-4853-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0522352902=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1365745471-4853-1-git-send-email-sachin.kamat@linaro.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "patches@linaro.org" <patches@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, robherring2@gmail.com, DRI mailing list <dri-devel@lists.freedesktop.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--===============0522352902==
Content-Type: multipart/alternative; boundary=e89a8f3ba019a5289904da25f24b

--e89a8f3ba019a5289904da25f24b
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks,
Inki Dae


2013/4/12 Sachin Kamat <sachin.kamat@linaro.org>

> This reverts commit 09495dda6a62c74b13412a63528093910ef80edd.
> The description is incomplete and the location of this file
> is incorrect. Based on discussion with the Samsung media and DRM subsystem
> maintainers, the documentaion of Samsung G2D bindings has been placed at:
> Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
> The right documentation for G2D bindings has already been merged for
> 3.10-rc
> and hence we need this patch for 3.10-rc too, to avoid confusions due to
> multiple documents.
> ---
>  .../devicetree/bindings/drm/exynos/g2d.txt         |   22
> --------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/drm/exynos/g2d.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/exynos/g2d.txt
> b/Documentation/devicetree/bindings/drm/exynos/g2d.txt
> deleted file mode 100644
> index 1eb124d..0000000
> --- a/Documentation/devicetree/bindings/drm/exynos/g2d.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Samsung 2D Graphic Accelerator using DRM frame work
> -
> -Samsung FIMG2D is a graphics 2D accelerator which supports Bit Block
> Transfer.
> -We set the drawing-context registers for configuring rendering parameters
> and
> -then start rendering.
> -This driver is for SOCs which contain G2D IPs with version 4.1.
> -
> -Required properties:
> -       -compatible:
> -               should be "samsung,exynos-g2d-41".
> -       -reg:
> -               physical base address of the controller and length
> -               of memory mapped region.
> -       -interrupts:
> -               interrupt combiner values.
> -
> -Example:
> -       g2d {
> -               compatible = "samsung,exynos-g2d-41";
> -               reg = <0x10850000 0x1000>;
> -               interrupts = <0 91 0>;
> -       };
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--e89a8f3ba019a5289904da25f24b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied.<br><br>Thanks,<br>Inki Dae<br></div><div class=3D=
"gmail_extra"><br><br><div class=3D"gmail_quote">2013/4/12 Sachin Kamat <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:sachin.kamat@linaro.org" target=3D"_bl=
ank">sachin.kamat@linaro.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This reverts commit 09495dda6a62c74b13412a63=
528093910ef80edd.<br>
The description is incomplete and the location of this file<br>
is incorrect. Based on discussion with the Samsung media and DRM subsystem<=
br>
maintainers, the documentaion of Samsung G2D bindings has been placed at:<b=
r>
Documentation/devicetree/bindings/gpu/samsung-g2d.txt<br>
<br>
Signed-off-by: Sachin Kamat &lt;<a href=3D"mailto:sachin.kamat@linaro.org">=
sachin.kamat@linaro.org</a>&gt;<br>
Cc: Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.c=
om</a>&gt;<br>
Cc: Sylwester Nawrocki &lt;<a href=3D"mailto:s.nawrocki@samsung.com">s.nawr=
ocki@samsung.com</a>&gt;<br>
Cc: Ajay Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.com">ajaykumar.rs=
@samsung.com</a>&gt;<br>
---<br>
The right documentation for G2D bindings has already been merged for 3.10-r=
c<br>
and hence we need this patch for 3.10-rc too, to avoid confusions due to<br=
>
multiple documents.<br>
---<br>
=A0.../devicetree/bindings/drm/exynos/g2d.txt =A0 =A0 =A0 =A0 | =A0 22 ----=
----------------<br>
=A01 file changed, 22 deletions(-)<br>
=A0delete mode 100644 Documentation/devicetree/bindings/drm/exynos/g2d.txt<=
br>
<br>
diff --git a/Documentation/devicetree/bindings/drm/exynos/g2d.txt b/Documen=
tation/devicetree/bindings/drm/exynos/g2d.txt<br>
deleted file mode 100644<br>
index 1eb124d..0000000<br>
--- a/Documentation/devicetree/bindings/drm/exynos/g2d.txt<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-Samsung 2D Graphic Accelerator using DRM frame work<br>
-<br>
-Samsung FIMG2D is a graphics 2D accelerator which supports Bit Block Trans=
fer.<br>
-We set the drawing-context registers for configuring rendering parameters =
and<br>
-then start rendering.<br>
-This driver is for SOCs which contain G2D IPs with version 4.1.<br>
-<br>
-Required properties:<br>
- =A0 =A0 =A0 -compatible:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 should be &quot;samsung,exynos-g2d-41&quot;.<=
br>
- =A0 =A0 =A0 -reg:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 physical base address of the controller and l=
ength<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 of memory mapped region.<br>
- =A0 =A0 =A0 -interrupts:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt combiner values.<br>
-<br>
-Example:<br>
- =A0 =A0 =A0 g2d {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;samsung,exynos-g2d-41&qu=
ot;;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x10850000 0x1000&gt;;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;0 91 0&gt;;<br>
- =A0 =A0 =A0 };<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</font></span></blockquote></div><br></div>

--e89a8f3ba019a5289904da25f24b--

--===============0522352902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0522352902==--
