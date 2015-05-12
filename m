From: Pantelis Antoniou <pantelis.antoniou@gmail.com>
Subject: Re: [PATCH/RFC] kbuild: Create a rule for building device tree overlay objects
Date: Tue, 12 May 2015 17:33:29 +0300
Message-ID: <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com>
References: <1431431816-24612-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1431431816-24612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On May 12, 2015, at 14:56 , Geert Uytterhoeven <geert+renesas@glider.=
be> wrote:
>=20
> This allows to handle device tree overlays like plain device trees.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Questions:
>  - Do we want dtso files under arch/<arch>/boot/dts/, too?
>  - Do we want to move the dts files outside the kernel repository
>    first?
>=20

Oh that=E2=80=99s a nice hornet=E2=80=99s nest you=E2=80=99ve kicked he=
re.

arch/<arch>/boot/dts should not be the place, cause overlays are not re=
lated with boot per se.
As they are right now are board (family) specific.

I think we should try to keep an external kernel repo with them for now=
 until we
figure out where to put them.

> scripts/Makefile.lib | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 79e86613712f2230..4b14eef1d4b2ce8f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -292,6 +292,9 @@ cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
> $(obj)/%.dtb: $(src)/%.dts FORCE
> 	$(call if_changed_dep,dtc)
>=20
> +$(obj)/%.dtbo: $(src)/%.dtso FORCE
> +	$(call if_changed_dep,dtc)
> +
> dtc-tmp =3D $(subst $(comma),_,$(dot-target).dts.tmp)
>=20
> # Bzip2
> --=20
> 1.9.1

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
