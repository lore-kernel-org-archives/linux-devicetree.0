From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v3 02/28] clk: sunxi-ng: Adjust MP clock
 parent rate when allowed
Date: Mon, 21 Jan 2019 13:34:33 +0000
Message-ID: <20190121133433.lryqz7ivrj5cxu3g@plaes.org>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
 <11550554.k1qAFTnke5@jernej-laptop>
 <20190117072402.ognqxsxewjg3kyyg@plaes.org>
 <3212171.R3YZLKKLtu@jernej-laptop>
 <20190121083729.7qsmj7drxvmnjoye@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDB4J47M7YERB24US7RAKGQEZHSTYYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190121083729.7qsmj7drxvmnjoye-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 08:37:29AM +0000, Priit Laes wrote:
> On Fri, Jan 18, 2019 at 10:51:10PM +0100, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 17. januar 2019 ob 08:24:02 CET je Priit Laes napisal=
(a):
> > > On Wed, Jan 16, 2019 at 06:00:32PM +0100, Jernej =C5=A0krabec wrote:
> > > > Dne sreda, 16. januar 2019 ob 13:09:58 CET je Priit Laes napisal(a)=
:
> > > > > On Thu, Jan 10, 2019 at 06:10:59PM +0100, Jernej =C5=A0krabec wro=
te:
> > > > > > Dne =C4=8Detrtek, 10. januar 2019 ob 10:15:48 CET je Priit Laes=
 napisal(a):
> > > > > > > On Sun, Nov 04, 2018 at 07:26:39PM +0100, Jernej Skrabec wrot=
e:
> > > > > > > > Currently MP clocks don't consider adjusting parent rate ev=
en if
> > > > > > > > they
> > > > > > > > are allowed to do so. Such behaviour considerably lowers am=
ount of
> > > > > > > > possible rates, which is very inconvenient when such clock =
is used
> > > > > > > > for
> > > > > > > > pixel clock, for example.
> > > > > > > >=20
> > > > > > > > In order to improve the situation, adjusting parent rate is
> > > > > > > > considered
> > > > > > > > when allowed.
> > > > > > > >=20
> > > > > > > > This code is inspired by clk_divider_bestdiv() function, wh=
ich
> > > > > > > > does
> > > > > > > > basically the same thing for different clock type.
> > > > > > >=20
> > > > > > > This patch seems to break the eMMC support on Olinuxino-Lime2=
-eMMC
> > > > > > > boards:
> > > > > > >=20
> > > > > > > EXT4-fs (mmcblk1p4): INFO: recovery required on readonly file=
system
> > > > > > > EXT4-fs (mmcblk1p4): write access will be enabled during reco=
very
> > > > > > > sunxi-mmc 1c11000.mmc: data error, sending stop command
> > > > > > > sunxi-mmc 1c11000.mmc: send stop command failed
> > > > > >=20
> > > > > > I'm not familiar with A20. What is interesting is that emmc clo=
cks
> > > > > > don't
> > > > > > have CLK_SET_RATE_PARENT flag set, so you shouldn't see any
> > > > > > difference.
> > > > > >=20
> > > > > > Can you post content of clk_summary with and without this patch=
?
> > > > >=20
> > > > > In both cases I booted from FEL with rootfs on sdcard and tried t=
o mount
> > > > > partition from eMMC to /mnt. With your patch, last step it fails.
> > > > >=20
> > > > > pre-patch working:
> > > > > pll-ddr-other[768MHz] -> mmc2[512MHz]. (For some reason ahb-mmc2 =
is
> > > > > off?)
> > > > >=20
> > > > > post-patch not working:
> > > > > pll-periph[600MHz] ->  mmc2[500Mhz], (ahb-mmc2 is enabled)
> > > > >=20
> > > > > Also, attached the logs.
> > > >=20
> > > > Thanks. Just one more request. Can you enable debug messages in mmc
> > > > driver?
> > > > I'm interested in output of this line:
> > > >=20
> > > > dev_dbg(mmc_dev(mmc), "setting clk to %d, rounded %ld\n",
> > > >=20
> > > > 		clock, rate);
> > >=20
> > > 1c11000 is eMMC:
> > > [snip]
> > > [    1.961644] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.004091] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.020296] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.039917] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.047847] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.055053] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.065256] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.092351] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.168725] sunxi-mmc 1c11000.mmc: setting clk to 400000, rounded =
400000
> > > [    2.189403] sunxi-mmc 1c11000.mmc: setting clk to 52000000, rounde=
d
> > > 52000000 [    2.203340] sunxi-mmc 1c11000.mmc: setting clk to 5200000=
0,
> > > rounded 52000000 [    2.211412] sunxi-mmc 1c11000.mmc: setting clk to
> > > 52000000, rounded 52000000 [    4.967865] sunxi-mmc 1c11000.mmc: sett=
ing
> > > clk to 52000000, rounded 52000000 [    8.755345] sunxi-mmc 1c11000.mm=
c:
> > > setting clk to 52000000, rounded 52000000 [    9.082510] sunxi-mmc
> > > 1c11000.mmc: setting clk to 52000000, rounded 52000000
> > >=20
> > > Here I tried to mount partition from eMMC...
> > >=20
> > > [   72.167311] sunxi-mmc 1c11000.mmc: setting clk to 52000000, rounde=
d
> > > 52000000 [   72.269629] sunxi-mmc 1c11000.mmc: data error, sending st=
op
> > > command [   73.268999] sunxi-mmc 1c11000.mmc: send stop command faile=
d
> > > [/snip]
> > >=20
> > > And clock tree:
> > > [snip]
> > > pll-periph-base                3        3        0  1200000000       =
   0  =20
> > >  0  50000 pll-periph                  6        6        0   600000000=
     =20
> > >    0     0  50000 mmc2                     3        3        0    500=
00000=20
> > >         0     0  50000 mmc2_sample           1        1        0  =20
> > > 50000000          0   120  50000 mmc2_output           1        1    =
    0=20
> > >   50000000          0    60  50000 ahb                     18       1=
8    =20
> > >   0   300000000          0     0  50000 ahb-mmc2              1      =
  1  =20
> > >     0   300000000          0     0  50000 [/snip]
> > >=20
> > >=20
> > > And without patch:
> > > [snip]
> > > [    2.003341] sunxi-mmc 1c11000.mmc: XXX: setting clk to 400000, rou=
nded
> > > 400000 [    2.019479] sunxi-mmc 1c11000.mmc: XXX: setting clk to 4000=
00,
> > > rounded 400000 [    2.039144] sunxi-mmc 1c11000.mmc: XXX: setting clk=
 to
> > > 400000, rounded 400000 [    2.047129] sunxi-mmc 1c11000.mmc: XXX: set=
ting
> > > clk to 400000, rounded 400000 [    2.054324] sunxi-mmc 1c11000.mmc: X=
XX:
> > > setting clk to 400000, rounded 400000 [    2.064481] sunxi-mmc 1c1100=
0.mmc:
> > > XXX: setting clk to 400000, rounded 400000 [    2.091624] sunxi-mmc
> > > 1c11000.mmc: XXX: setting clk to 400000, rounded 400000 [    2.168067=
]
> > > sunxi-mmc 1c11000.mmc: XXX: setting clk to 400000, rounded 400000 [  =
=20
> > > 2.188239] sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounde=
d
> > > 51200000 [    2.202779] sunxi-mmc 1c11000.mmc: XXX: setting clk to
> > > 52000000, rounded 51200000 [    2.210817] sunxi-mmc 1c11000.mmc: XXX:
> > > setting clk to 52000000, rounded 51200000 [    5.103358] sunxi-mmc
> > > 1c11000.mmc: XXX: setting clk to 52000000, rounded 51200000 [    8.95=
0237]
> > > sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounded 51200000=
 [  =20
> > > 9.376201] sunxi-mmc 1c11000.mmc: XXX: setting clk to 52000000, rounde=
d
> > > 51200000 [  113.618387] sunxi-mmc 1c11000.mmc: XXX: setting clk to
> > > 52000000, rounded 51200000 [  113.707979] EXT4-fs (mmcblk1p4): recove=
ry
> > > complete
> > > [  113.728162] EXT4-fs (mmcblk1p4): mounted filesystem with ordered d=
ata
> > > mode. Opts: (null) [/snip]
> > >=20
> > > And clock tree:
> > > [snip]
> > > pll-ddr-base                   2        2        0   768000000       =
   0  =20
> > >  0  50000 pll-ddr-other               1        1        0   768000000=
     =20
> > >    0     0  50000 mmc2                     0        0        0    512=
00000=20
> > >         0     0  50000 mmc2_sample           0        0        0  =20
> > > 51200000          0   120  50000 mmc2_output           0        0    =
    0=20
> > >   51200000          0    72  50000 [/snip]
> > >=20
> >=20
> > It seems to me that clock rate is set properly. It's even better than b=
efore=20
> > since there is no error between wanted and real clock. I bet that if yo=
u call=20
> > clk_get_rate() directly behind clk_set_rate() in mmc driver, you'll get=
=20
> > correct value.
> >=20
> > However, it seems that at some point some other peripheral changes it's=
 parent=20
> > clock rate, which inadvertely changes emmc2 clock rate too. The only po=
ssible=20
> > clock which could interfere is sata. Can you disable driver in you kern=
el=20
> > config and try again?
>=20
> OK, tried following things in succession, but SATA disabling does not wor=
k:
>=20
> a) Marked all ahci stuff in devicetree as disabled
> b) Disable CONFIG_AHCI_SUNXI in kernel
> c) Even disabled SATA stuff in u-boot

But it works, when I allow mmc2 clock to set parent rate:

pll-periph-base                3        3        0   312000000          0  =
   0  50000
   mbus                        1        1        0    78000000          0  =
   0  50000
   pll-periph-sata             1        1        0    26000000          0  =
   0  50000
      sata                     1        1        0    26000000          0  =
   0  50000
   pll-periph                  5        5        0   156000000          0  =
   0  50000
      mmc2                     0        0        0    52000000          0  =
   0  50000
         mmc2_sample           0        0        0    52000000          0  =
 120  50000
         mmc2_output           0        0        0    52000000          0  =
 120  50000
      mmc0                     0        0        0    39000000          0  =
   0  50000
         mmc0_sample           0        0        0    39000000          0  =
  90  50000
         mmc0_output           0        0        0    39000000          0  =
  90  50000


Now, what I don't understand is why the `enable count` does not increase :(

---
diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/cc=
u-sun4i-a10.c
index 129ebd2588fd..605e13b4ef90 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
@@ -498,7 +498,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(mmc2_clk, "mmc2", mod=
0_default_parents, 0x090,
                                  16, 2,        /* P */
                                  24, 2,        /* mux */
                                  BIT(31),      /* gate */
-                                 0);
+                                 CLK_SET_RATE_PARENT);
=20
 /* MMC output and sample clocks are not present on A10 */
 static SUNXI_CCU_PHASE(mmc2_output_clk, "mmc2_output", "mmc2",


>=20
> >=20
> > Best regards,
> > Jernej
>=20
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
