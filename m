From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Mon, 27 Jan 2014 15:54:14 +0100
Message-ID: <52E67316.5020906@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com> <1390426587-16287-3-git-send-email-hdegoede@redhat.com> <20140127144349.GJ3867@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBJXGTGLQKGQEEJXGMWQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140127144349.GJ3867@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

On 01/27/2014 03:43 PM, Maxime Ripard wrote:
> Hi Hans,
>=20
> Mostly looking good, but I have a few comments below.
>=20
> On Wed, Jan 22, 2014 at 10:36:24PM +0100, Hans de Goede wrote:
>> From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>=20
>> Add register definitions for the usb-clk register found on sun4i, sun5i =
and sun7i SoCs.
>>=20
>> Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> Signed-off-by: Hans de G=
oede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> --- Documentation/devicetree/bindings/clock/sunx=
i.txt |  5 +++++ drivers/clk/sunxi/clk-sunxi.c                     | 12 +++=
+++++++++ 2 files changed, 17 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documen=
tation/devicetree/bindings/clock/sunxi.txt index 79c7197..8bccb6a 100644 --=
- a/Documentation/devicetree/bindings/clock/sunxi.txt +++ b/Documentation/d=
evicetree/bindings/clock/sunxi.txt @@ -37,6 +37,8 @@ Required properties: "=
allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31 "allwinner,=
sun4i-mod0-clk" - for the module 0 family of clocks "allwinner,sun7i-a20-ou=
t-clk" - for the external output clocks +	"allwinner,sun4i-usb-gates-clk" -=
 for usb gates + resets on A10 / A20 +
>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
>=20
> Maybe we can just remove the gates from there? Even though they are gates=
, they are also (a bit) more than that.

To be clear you mean s/usb-gates-clk/usb-clk/ right ?

That sounds reasonable :)

>=20
>> Required properties for all clocks: - reg : shall be the control registe=
r address for the clock. @@ -49,6 +51,9 @@ Required properties for all cloc=
ks: Additionally, "allwinner,*-gates-clk" clocks require: - clock-output-na=
mes : the corresponding gate names that the clock controls
>>=20
>> +And "allwinner,*-usb-gates-clk" clocks also require: +- reset-cells : s=
hall be set to 1 +
>=20
> You should also document what value we should put in the cells, and where=
 to refer to to find the right one.

Ok.

>=20
>> Clock consumers should specify the desired clocks they use with a "clock=
s" phandle cell. Consumers that are using a gated clock should provide an a=
dditional ID in their clock property. This ID is the diff --git a/drivers/c=
lk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c index f1a147c..18cbc3c=
 100644 --- a/drivers/clk/sunxi/clk-sunxi.c +++ b/drivers/clk/sunxi/clk-sun=
xi.c @@ -813,6 +813,16 @@ static const struct gates_data sun4i_ahb_gates_da=
ta __initconst =3D { .mask =3D {0x7F77FFF, 0x14FB3F}, };
>>=20
>> +static const struct gates_data sun4i_usb_gates_data __initconst =3D { +=
	.mask =3D {0x1C0}, +	.reset_mask =3D 0x07, +}; + +static const struct gate=
s_data sun5i_a13_usb_gates_data __initconst =3D { +	.mask =3D {0x140}, +	.r=
eset_mask =3D 0x03, +}; +
>=20
> I guess that means that we will have the OHCI0 gate declared with <&...-g=
ates-clk 6>, while it's actually the first gate for this clock?

Correct.

> Maybe introducing an offset field in the gates_data would be a good idea,=
 so that we always start from indexing the gates from 0 in the DT?

Well for the other "gates" type clks we also have holes in the range, and
we always refer to the clk with the bit number in the reg as the clock-cell
value.

Here the hole just happens to be at the start, but it seems best to me
to be consistent and keep using the bit nr inside the reg as clock-cell
value, without an offset.

>=20
>> static const struct gates_data sun5i_a10s_ahb_gates_data __initconst =3D=
 { .mask =3D {0x147667e7, 0x185915}, }; @@ -1159,6 +1169,8 @@ static const =
struct of_device_id clk_gates_match[] __initconst =3D { {.compatible =3D "a=
llwinner,sun6i-a31-apb1-gates-clk", .data =3D &sun6i_a31_apb1_gates_data,},=
 {.compatible =3D "allwinner,sun7i-a20-apb1-gates-clk", .data =3D &sun7i_a2=
0_apb1_gates_data,}, {.compatible =3D "allwinner,sun6i-a31-apb2-gates-clk",=
 .data =3D &sun6i_a31_apb2_gates_data,}, +	{.compatible =3D "allwinner,sun4=
i-usb-gates-clk", .data =3D &sun4i_usb_gates_data,}, +	{.compatible =3D
>> "allwinner,sun5i-a13-usb-gates-clk", .data =3D &sun5i_a13_usb_gates_data=
,}, {} };
>=20
> Thanks a lot! Maxime

Regards,

Hans

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlLmcxYACgkQF3VEtJrzE/vjVgCfT8pMd/WAl2lr5HVURDcr6zz6
pDsAnjStUQa3j6WGOHPstjO2kV3WwkKO
=3Dozuq
-----END PGP SIGNATURE-----

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
