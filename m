From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 19/20] tegra: fdt: Add EMC data for Tegra2
	Seaboard
Date: Fri, 13 Jan 2012 13:51:43 -0800
Message-ID: <CAPnjgZ03OUi=xN-YURmVXHxGSb0AchyOpDtY2k-wV_VWdUML1w@mail.gmail.com>
References: <1326490535-3461-1-git-send-email-sjg@chromium.org>
	<1326490535-3461-20-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326490535-3461-20-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 1:35 PM, Simon Glass <sjg@chromium.org> wrote:
> This adds timings for T20 and T25 Seaboards, using the bindings found her=
e:
>
> http://patchwork.ozlabs.org/patch/132928/
>
> We supply both full speed options for normal running, and half speed opti=
ons
> for testing / development.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> =A0board/nvidia/dts/tegra2-seaboard.dts | =A0 73 ++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 73 insertions(+), 0 deletions(-)
>
> diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegr=
a2-seaboard.dts
> index d2cc428..b114f5f 100644
> --- a/board/nvidia/dts/tegra2-seaboard.dts
> +++ b/board/nvidia/dts/tegra2-seaboard.dts
> @@ -54,4 +54,77 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D "disabled";
> =A0 =A0 =A0 =A0};
>
> + =A0 =A0 =A0 emc@7000f400 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table@166500 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <166500>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 16650=
0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D < =
0x0000000a 0x00000021
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000008 =
0x00000003 0x00000004 0x00000004
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x0000000c 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000004 =
0x00000009 0x0000000d 0x000004df
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000003 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000001 0x0000000a 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000006 0x00000004 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000083 0xa04004ae
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007fd010 =
0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000000 0x00000000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table@333000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <333000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 33300=
0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D < =
0x00000014 0x00000041
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x0000000f =
0x00000005 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x0000000c 0x00000005 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000004 =
0x00000009 0x0000000d 0x000009ff
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000003 0x00000003 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000005 =
0x00000001 0x0000000f 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x0000000c 0x00000006 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000083 0xe034048b
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007e8010 =
0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000000 0x00000000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table@190000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 190000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 19000=
0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D < =
0x0000000c 0x00000026
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000009 =
0x00000003 0x00000004 0x00000004
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x0000000c 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000004 =
0x00000009 0x0000000d 0x0000059f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000003 0x00000003 0x00000003
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000001 0x0000000b 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000007 0x00000004 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000083 0xa06204ae
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007dc010 =
0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000000 0x00000000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 emc-table@380000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 380000 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegr=
a20-emc-table";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 38000=
0 >;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nvidia,emc-registers =3D < =
0x00000017 0x0000004b
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000012 =
0x00000006 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x0000000c 0x00000006 0x00000006
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x00000001 0x00000004 0x00000005
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000004 =
0x00000009 0x0000000d 0x00000b5f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000003 0x00000003 0x00000006
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000006 =
0x00000001 0x00000011 0x000000c8
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000003 =
0x0000000e 0x00000007 0x0000000f
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000002 =
0x00000000 0x00000000 0x00000002
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000083 0xe044048b
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x007d8010 =
0x00000000 0x00000000 0x00000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00000000 =
0x00000000 0x00000000 0x00000000 >; =A0 =A0 =A0 =A0 =A0emc-table@190000 {

Oh dear. I will fix this next revision...

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 };
> +};
> +
> =A0};
> --
> 1.7.7.3
>
