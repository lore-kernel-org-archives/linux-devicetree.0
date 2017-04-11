From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: display/panel: Add common rotation property
Date: Tue, 11 Apr 2017 08:29:43 +0300
Message-ID: <1802283.9kerWUhyh6@avalon>
References: <20170211184858.26421-1-noralf@tronnes.org> <20170211184858.26421-6-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170211184858.26421-6-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Noralf,

On Saturday 11 Feb 2017 19:48:56 Noralf Tr=F8nnes wrote:
> Display panels can be oriented many ways, especially in the embedded
> world. The rotation property is a way to describe this orientation.
> The counter clockwise direction is chosen because that's what fbdev
> and drm use.
>=20
> Signed-off-by: Noralf Tr=F8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes since version 3:
> - Changed display/display.txt -> display/panel/panel.txt
>=20
>  Documentation/devicetree/bindings/display/panel/panel.txt | 4 ++++

We now have both Documentation/devicetree/bindings/display/panel/panel.=
txt and=20
Documentation/devicetree/bindings/display/panel/panel-common.txt as the=
y have=20
been merged concurrently without being aware of each other. Would you m=
ind if=20
I moved this property to panel-common.txt ?

I would also like to document the property in a bit more details to avo=
id=20
confusion about the rotation direction, as "display rotation" could be=20=

interpreted as the angle by which the display output has to be rotated =
to=20
obtain an upside-up image. What would you think of the following, am I=20=

overdoing it, or is it even more confusing ?

- rotation: Panels are commonly mounted rotated, with their native orie=
ntation=20
not aligned with the device's orientation. The rotation property specif=
ies the=20
angle in degrees between the panel's orientation and the device's orien=
tation=20
(corresponding to a counter-clockwise rotation of the panel). Valid val=
ues are=20
0, 90, 180 and 270.


>  1 file changed, 4 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/panel.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel.tx=
t
> b/Documentation/devicetree/bindings/display/panel/panel.txt new file =
mode
> 100644
> index 0000000..e2e6867
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel.txt
> @@ -0,0 +1,4 @@
> +Common display properties
> +-------------------------
> +
> +- rotation:=09Display rotation in degrees counter clockwise (0,90,18=
0,270)

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
