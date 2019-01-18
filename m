From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3 02/28] clk: sunxi-ng: Adjust MP clock
 parent rate when allowed
Date: Fri, 18 Jan 2019 22:51:10 +0100
Message-ID: <3212171.R3YZLKKLtu@jernej-laptop>
References: <20181104182705.18047-1-jernej.skrabec@siol.net> <11550554.k1qAFTnke5@jernej-laptop> <20190117072402.ognqxsxewjg3kyyg@plaes.org>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBVMURHRAKGQENG3VE5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190117072402.ognqxsxewjg3kyyg-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 17. januar 2019 ob 08:24:02 CET je Priit Laes napisal(a):
> On Wed, Jan 16, 2019 at 06:00:32PM +0100, Jernej =C5=A0krabec wrote:
> > Dne sreda, 16. januar 2019 ob 13:09:58 CET je Priit Laes napisal(a):
> > > On Thu, Jan 10, 2019 at 06:10:59PM +0100, Jernej =C5=A0krabec wrote:
> > > > Dne =C4=8Detrtek, 10. januar 2019 ob 10:15:48 CET je Priit Laes nap=
isal(a):
> > > > > On Sun, Nov 04, 2018 at 07:26:39PM +0100, Jernej Skrabec wrote:
> > > > > > Currently MP clocks don't consider adjusting parent rate even i=
f
> > > > > > they
> > > > > > are allowed to do so. Such behaviour considerably lowers amount=
 of
> > > > > > possible rates, which is very inconvenient when such clock is u=
sed
> > > > > > for
> > > > > > pixel clock, for example.
> > > > > >=20
> > > > > > In order to improve the situation, adjusting parent rate is
> > > > > > considered
> > > > > > when allowed.
> > > > > >=20
> > > > > > This code is inspired by clk_divider_bestdiv() function, which
> > > > > > does
> > > > > > basically the same thing for different clock type.
> > > > >=20
> > > > > This patch seems to break the eMMC support on Olinuxino-Lime2-eMM=
C
> > > > > boards:
> > > > >=20
> > > > > EXT4-fs (mmcblk1p4): INFO: recovery required on readonly filesyst=
em
> > > > > EXT4-fs (mmcblk1p4): write access will be enabled during recovery
> > > > > sunxi-mmc 1c11000.mmc: data error, sending stop command
> > > > > sunxi-mmc 1c11000.mmc: send stop command failed
> > > >=20
> > > > I'm not familiar with A20. What is interesting is that emmc clocks
> > > > don't
> > > > have CLK_SET_RATE_PARENT flag set, so you shouldn't see any
> > > > difference.
> > > >=20
> > > > Can you post content of clk_summary with and without this patch?
> > >=20
> > > In both cases I booted from FEL with rootfs on sdcard and tried to mo=
unt
> > > partition from eMMC to /mnt. With your patch, last step it fails.
> > >=20
> > > pre-patch working:
> > > pll-ddr-other[768MHz] -> mmc2[512MHz]. (For some reason ahb-mmc2 is
> > > off?)
> > >=20
> > > post-patch not working:
> > > pll-periph[600MHz] ->  mmc2[500Mhz], (ahb-mmc2 is enabled)
> > >=20
> > > Also, attached the logs.
> >=20
> > Thanks. Just one more request. Can you enable debug messages in mmc
> > driver?
> > I'm interested in output of this line:
> >=20
> > dev_dbg(mmc_dev(mmc), "setting clk to %d, rounded %ld\n",
> >=20
> > 		clock, rate);
>=20
> 1c11000 is eMMC:
> [snip]
> [    1.961644] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.004091] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.020296] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.039917] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.047847] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.055053] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.065256] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.092351] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.168725] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded 4000=
00
> [    2.189403] sunxi-mmc 1c11000.mmc: setting clk to 52000000, rounded
> 52000000 [    2.203340] sunxi-mmc 1c11000.mmc: setting clk to 52000000,
> rounded 52000000 [    2.211412] sunxi-mmc 1c11000.mmc: setting clk to
> 52000000, rounded 52000000 [    4.967865] sunxi-mmc 1c11000.mmc: setting
> clk to 52000000, rounded 52000000 [    8.755345] sunxi-mmc 1c11000.mmc:
> setting clk to 52000000, rounded 52000000 [    9.082510] sunxi-mmc
> 1c11000.mmc: setting clk to 52000000, rounded 52000000
>=20
> Here I tried to mount partition from eMMC...
>=20
> [   72.167311] sunxi-mmc 1c11000.mmc: setting clk to 52000000, rounded
> 52000000 [   72.269629] sunxi-mmc 1c11000.mmc: data error, sending stop
> command [   73.268999] sunxi-mmc 1c11000.mmc: send stop command failed
> [/snip]
>=20
> And clock tree:
> [snip]
> pll-periph-base                3        3        0  1200000000          0=
  =20
>  0  50000 pll-periph                  6        6        0   600000000    =
 =20
>    0     0  50000 mmc2                     3        3        0    5000000=
0=20
>         0     0  50000 mmc2_sample           1        1        0  =20
> 50000000          0   120  50000 mmc2_output           1        1        =
0=20
>   50000000          0    60  50000 ahb                     18       18   =
 =20
>   0   300000000          0     0  50000 ahb-mmc2              1        1 =
 =20
>     0   300000000          0     0  50000 [/snip]
>=20
>=20
> And without patch:
> [snip]
> [    2.003341] sunxi-mmc 1c11000.mmc: XXX: setting clk to 400000, rounded
> 400000 [    2.019479] sunxi-mmc 1c11000.mmc: XXX: setting clk to 400000,
> rounded 400000 [    2.039144] sunxi-mmc 1c11000.mmc: XXX: setting clk to
> 400000, rounded 400000 [    2.047129] sunxi-mmc 1c11000.mmc: XXX: setting
> clk to 400000, rounded 400000 [    2.054324] sunxi-mmc 1c11000.mmc: XXX:
> setting clk to 400000, rounded 400000 [    2.064481] sunxi-mmc 1c11000.mm=
c:
> XXX: setting clk to 400000, rounded 400000 [    2.091624] sunxi-mmc
> 1c11000.mmc: XXX: setting clk to 400000, rounded 400000 [    2.168067]
> sunxi-mmc 1c11000.mmc: XXX: setting clk to 400000, rounded 400000 [  =20
> 2.188239] sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounded
> 51200000 [    2.202779] sunxi-mmc 1c11000.mmc: XXX: setting clk to
> 52000000, rounded 51200000 [    2.210817] sunxi-mmc 1c11000.mmc: XXX:
> setting clk to 52000000, rounded 51200000 [    5.103358] sunxi-mmc
> 1c11000.mmc: XXX: setting clk to 52000000, rounded 51200000 [    8.950237=
]
> sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounded 51200000 [  =
=20
> 9.376201] sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounded
> 51200000 [  113.618387] sunxi-mmc 1c11000.mmc: XXX: setting clk to
> 52000000, rounded 51200000 [  113.707979] EXT4-fs (mmcblk1p4): recovery
> complete
> [  113.728162] EXT4-fs (mmcblk1p4): mounted filesystem with ordered data
> mode. Opts: (null) [/snip]
>=20
> And clock tree:
> [snip]
> pll-ddr-base                   2        2        0   768000000          0=
  =20
>  0  50000 pll-ddr-other               1        1        0   768000000    =
 =20
>    0     0  50000 mmc2                     0        0        0    5120000=
0=20
>         0     0  50000 mmc2_sample           0        0        0  =20
> 51200000          0   120  50000 mmc2_output           0        0        =
0=20
>   51200000          0    72  50000 [/snip]
>=20

It seems to me that clock rate is set properly. It's even better than befor=
e=20
since there is no error between wanted and real clock. I bet that if you ca=
ll=20
clk_get_rate() directly behind clk_set_rate() in mmc driver, you'll get=20
correct value.

However, it seems that at some point some other peripheral changes it's par=
ent=20
clock rate, which inadvertely changes emmc2 clock rate too. The only possib=
le=20
clock which could interfere is sata. Can you disable driver in you kernel=
=20
config and try again?

Best regards,
Jernej

> > Just wondering what it should be.
> >=20
> > Best regards,
> > Jernej
> >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > $ git bisect log
> > > > > git bisect start
> > > > > # good: [3df407b2a5346db1c48809706ece7a8616c79e0b] mmc:
> > > > > dw_mmc-bluefield:
> > > > > simplify the probe() function git bisect good
> > > > > 3df407b2a5346db1c48809706ece7a8616c79e0b
> > > > > # bad: [00d59fde8532b2d42e80909d2e58678755e04da9] Merge tag
> > > > > 'mmc-v4.21'
> > > > > of
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc git bisect
> > > > > bad
> > > > > 00d59fde8532b2d42e80909d2e58678755e04da9
> > > > > # good: [01e421feec0817bb3141eaae4c517410d193d440] Merge branch
> > > > > 'fixes'
> > > > > into next git bisect good 01e421feec0817bb3141eaae4c517410d193d44=
0
> > > > > # bad: [1eefdec18eded41833401cfd64749643ff72e7da] Merge branch
> > > > > 'locking-core-for-linus' of
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip git bisect =
bad
> > > > > 1eefdec18eded41833401cfd64749643ff72e7da
> > > > > # good: [eaa76499711535fd64d747cc4ef0d78ab0fd41c6] Merge tag
> > > > > 'mtd/for-4.21'
> > > > > of git://git.infradead.org/linux-mtd git bisect good
> > > > > eaa76499711535fd64d747cc4ef0d78ab0fd41c6
> > > > > # good: [4e4390ad067a61ce4e7607bd0df31f19a4caa36a] Merge tag
> > > > > 'leds-for-4.21-rc1' of
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-=
led
> > > > > s
> > > > > git
> > > > > bisect good 4e4390ad067a61ce4e7607bd0df31f19a4caa36a
> > > > > # bad: [c2f1f3e0e17d94ab0c66d83e669492cb9e9a3698] Merge
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next gi=
t
> > > > > bisect
> > > > > bad c2f1f3e0e17d94ab0c66d83e669492cb9e9a3698
> > > > > # bad: [e4b99d415c3908581d4703203e1e805f043a3e71] Merge branch
> > > > > 'irq-core-for-linus' of
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip git bisect =
bad
> > > > > e4b99d415c3908581d4703203e1e805f043a3e71
> > > > > # bad: [ffe05540d18013db62c43627836a3638e9a2c7aa] Merge branches
> > > > > 'clk-renesas', 'clk-allwinner', 'clk-tegra', 'clk-meson' and
> > > > > 'clk-rockchip'
> > > > > into clk-next git bisect bad
> > > > > ffe05540d18013db62c43627836a3638e9a2c7aa
> > > > > # good: [1a501c8defe950571316d5ddd917bf44f5ed7bd4] Merge branches
> > > > > 'clk-managed-registration', 'clk-spdx', 'clk-remove-basic' and
> > > > > 'clk-ops-const' into clk-next git bisect good
> > > > > 1a501c8defe950571316d5ddd917bf44f5ed7bd4
> > > > > # good: [e74581b79ddd9b49b8c61e2791fc4dffc0245afb] Merge tag
> > > > > 'meson-clk-4.21-2' of https://github.com/BayLibre/clk-meson into
> > > > > clk-meson
> > > > > git bisect good e74581b79ddd9b49b8c61e2791fc4dffc0245afb
> > > > > # good: [60baf75e3f5b76043c25328ac0c5320aaef5ea41] Merge tag
> > > > > 'clk-renesas-for-v4.21-tag2' of
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs
> > > > > into
> > > > > clk-renesas git bisect good 60baf75e3f5b76043c25328ac0c5320aaef5e=
a41
> > > > > # bad: [a41f85b6017ee20952a60e4330bcae2527fe2c2a] Merge tag
> > > > > 'sunxi-clk-for-4.21' of
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
> > > > > clk-allwinner git bisect bad
> > > > > a41f85b6017ee20952a60e4330bcae2527fe2c2a
> > > > > # bad: [ee678706e46d0d185c27cc214ad97828e0643159] clk: sunxi-ng:
> > > > > a64:
> > > > > Fix
> > > > > gate bit of DSI DPHY git bisect bad
> > > > > ee678706e46d0d185c27cc214ad97828e0643159
> > > > > # bad: [65b6657672388b72822e0367f06d41c1e3ffb5bb] clk: sunxi-ng: =
Use
> > > > > u64
> > > > > for calculation of NM rate git bisect bad
> > > > > 65b6657672388b72822e0367f06d41c1e3ffb5bb
> > > > > # good: [db7548934603d9eda12649dff97ea5c29884405d] clk: sunxi-ng:
> > > > > sun50i:
> > > > > h6: Fix MMC clock mux width git bisect good
> > > > > db7548934603d9eda12649dff97ea5c29884405d
> > > > > # bad: [3f790433c3cb27ecaf2ca0e07ac25964e4fd9f15] clk: sunxi-ng:
> > > > > Adjust
> > > > > MP
> > > > > clock parent rate when allowed git bisect bad
> > > > > 3f790433c3cb27ecaf2ca0e07ac25964e4fd9f15
> > > > > # first bad commit: [3f790433c3cb27ecaf2ca0e07ac25964e4fd9f15] cl=
k:
> > > > > sunxi-ng: Adjust MP clock parent rate when allowed
> > > > >=20
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> > > > > > ---
> > > > > >=20
> > > > > >  drivers/clk/sunxi-ng/ccu_mp.c | 64
> > > > > >  +++++++++++++++++++++++++++++++++--
> > > > > >  1 file changed, 62 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c
> > > > > > b/drivers/clk/sunxi-ng/ccu_mp.c
> > > > > > index 5d0af4051737..0357349eb767 100644
> > > > > > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > > > > > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > > > > > @@ -40,6 +40,61 @@ static void ccu_mp_find_best(unsigned long
> > > > > > parent,
> > > > > > unsigned long rate,>
> > > > > >=20
> > > > > >  	*p =3D best_p;
> > > > > > =20
> > > > > >  }
> > > > > >=20
> > > > > > +static unsigned long ccu_mp_find_best_with_parent_adj(struct
> > > > > > clk_hw
> > > > > > *hw,
> > > > > > +
> > > >=20
> > > > unsigned long *parent,
> > > >=20
> > > > > > +
> > > >=20
> > > > unsigned long rate,
> > > >=20
> > > > > > +
> > > >=20
> > > > unsigned int max_m,
> > > >=20
> > > > > > +
> > > >=20
> > > > unsigned int max_p)
> > > >=20
> > > > > > +{
> > > > > > +	unsigned long parent_rate_saved;
> > > > > > +	unsigned long parent_rate, now;
> > > > > > +	unsigned long best_rate =3D 0;
> > > > > > +	unsigned int _m, _p, div;
> > > > > > +	unsigned long maxdiv;
> > > > > > +
> > > > > > +	parent_rate_saved =3D *parent;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The maximum divider we can use without overflowing
> > > > > > +	 * unsigned long in rate * m * p below
> > > > > > +	 */
> > > > > > +	maxdiv =3D max_m * max_p;
> > > > > > +	maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> > > > > > +
> > > > > > +	for (_p =3D 1; _p <=3D max_p; _p <<=3D 1) {
> > > > > > +		for (_m =3D 1; _m <=3D max_m; _m++) {
> > > > > > +			div =3D _m * _p;
> > > > > > +
> > > > > > +			if (div > maxdiv)
> > > > > > +				break;
> > > > > > +
> > > > > > +			if (rate * div =3D=3D parent_rate_saved) {
> > > > > > +				/*
> > > > > > +				 * It's the most ideal case if
> > > >=20
> > > > the requested
> > > >=20
> > > > > > +				 * rate can be divided from
> > > >=20
> > > > parent clock without
> > > >=20
> > > > > > +				 * needing to change parent
> >=20
> > rate,
> >=20
> > > > so return the
> > > >=20
> > > > > > +				 * divider immediately.
> > > > > > +				 */
> > > > > > +				*parent =3D parent_rate_saved;
> > > > > > +				return rate;
> > > > > > +			}
> > > > > > +
> > > > > > +			parent_rate =3D clk_hw_round_rate(hw, rate *
> > > >=20
> > > > div);
> > > >=20
> > > > > > +			now =3D parent_rate / div;
> > > > > > +
> > > > > > +			if (now <=3D rate && now > best_rate) {
> > > > > > +				best_rate =3D now;
> > > > > > +				*parent =3D parent_rate;
> > > > > > +
> > > > > > +				if (now =3D=3D rate)
> > > > > > +					return rate;
> > > > > > +			}
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	return best_rate;
> > > > > > +}
> > > > > > +
> > > > > >=20
> > > > > >  static unsigned long ccu_mp_round_rate(struct ccu_mux_internal
> > > > > >  *mux,
> > > > > > =20
> > > > > >  				       struct clk_hw *hw,
> > > > > >  				       unsigned long
> > > >=20
> > > > *parent_rate,
> > > >=20
> > > > > > @@ -56,8 +111,13 @@ static unsigned long ccu_mp_round_rate(stru=
ct
> > > > > > ccu_mux_internal *mux,>
> > > > > >=20
> > > > > >  	max_m =3D cmp->m.max ?: 1 << cmp->m.width;
> > > > > >  	max_p =3D cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
> > > > > >=20
> > > > > > -	ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
> > > > > > -	rate =3D *parent_rate / p / m;
> > > > > > +	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
> > > > > > +		ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m,
> > > >=20
> > > > &p);
> > > >=20
> > > > > > +		rate =3D *parent_rate / p / m;
> > > > > > +	} else {
> > > > > > +		rate =3D ccu_mp_find_best_with_parent_adj(hw,
> >=20
> > parent_rate,
> >=20
> > > > rate,
> > > >=20
> > > > > > +
> > > >=20
> > > > max_m, max_p);
> > > >=20
> > > > > > +	}
> > > > > >=20
> > > > > >  	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
> > > > > >  =09
> > > > > >  		rate /=3D cmp->fixed_post_div;




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
