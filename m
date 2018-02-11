From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Fix broken bananapi m2 devicetree/regulators
Date: Sun, 11 Feb 2018 12:30:31 +0100
Message-ID: <1518348631.1342.1.camel@gmail.com>
References: <20180209175236.21215-1-embed3d@gmail.com>
	 <160b60e2-6e50-0d63-e6ac-b67e10317e12@orpaltech.com>
	 <d3fcc9d2-f2e6-189c-529f-890f2afdd837@gmail.com>
	 <40887d4b-0fb0-239e-e5a9-1a87f82946c2@orpaltech.com>
	 <da8909da-4eea-0fdf-e104-4442f7986455@gmail.com>
	 <45fb86c9-2218-d00d-1952-6b79f9101049@orpaltech.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD257DPK24NRBWWSQDKAKGQEOXLW2JY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <45fb86c9-2218-d00d-1952-6b79f9101049-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sergey Suloev <ssuloev-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, den 11.02.2018, 10:55 +0300 schrieb Sergey Suloev:
> On 02/11/2018 01:07 AM, Philipp Rossak wrote:
> >=20
> >=20
> > On 10.02.2018 22:08, Sergey Suloev wrote:
> > > On 02/11/2018 12:01 AM, Philipp Rossak wrote:
> > > > Hey Sergey,
> > > >=20
> > > > Thanks for mentioning, but I think the problem has nothing to
> > > > do=C2=A0
> > > > with those patches. I tested them with the v4.15.0 Kernel since
> > > > this=C2=A0
> > > > is the last stable release and we are right now in the merging
> > > > window.
> > > >=20
> > > > I tested the latest mainline, without those patches and the
> > > > kernel=C2=A0
> > > > is not booting (I can't see any uart output).
> > > >=20
> > > > Thanks,
> > > > Philipp
> > > >=20
> > > > On 10.02.2018 14:56, Sergey Suloev wrote:
> > > > > On 02/09/2018 08:52 PM, Philipp Rossak wrote:
> > > > > > This patchseries fixes the bananapi m1 devicetree, to be
> > > > > > able to=C2=A0
> > > > > > boot again.
> > > > > > The first two patches update/improve the devicetree and the
> > > > > > last=C2=A0
> > > > > > patch adds
> > > > > > all missing regulators.
> > > > > >=20
> > > > > > Regards,
> > > > > > Philipp
> > > > > >=20
> > > > > > Philipp Rossak (3):
> > > > > > =C2=A0=C2=A0 arm: dts: sun6i: a31s: bpi-m2: update mmc supply n=
odes
> > > > > > =C2=A0=C2=A0 arm: dts: sun6i: a31s: bpi-m2: improve pmic proper=
ties
> > > > > > =C2=A0=C2=A0 arm: dts: sun6i: a31s: fix: bpi-m2: add missing
> > > > > > regulators
> > > > > >=20
> > > > > > =C2=A0 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 70=C2=
=A0
> > > > > > +++++++++++++++++++++++-
> > > > > > =C2=A0 1 file changed, 67 insertions(+), 3 deletions(-)
> > > > > >=20
> > > > >=20
> > > > > patches are not working
> > > > >=20
> > > > > Thanks
> > > > >=20
> > >=20
> > > same problem, but after applying the patches my device is till
> > > hanging.
> > >=20
> > >=20
> >=20
> > Can you please share a bootlog? Here is mine [1]. As you can see
> > I'm=C2=A0
> > able to boot.
> > I build it with this branch [2]. For testing you should replace
> > the=C2=A0
> > dtb and the uImage/zImage
> >=20
> > Philipp
> >=20
> >=20
> > [1]: https://pastebin.com/mVjv3LDf
> > [2]:=C2=A0
> > https://github.com/embed-3d/linux/tree/testing/bpi-m2-regulator-tes
> > t-2
>=20
> My dmesg is very similar to yours unless it hangs on the last line
> [1].=C2=A0
> For this test I used kernel from tag v4.15 with no additional
> patching.
>=20
> [1] https://pastebin.com/3a6bk5Dk
>=20
>=20

For me it looks like you have a different kernel and also an different
dtb that you patch! And you are applying also a fixup script.
These patches should be applied on top of linux mainline.=20

fixup script:
Applying kernel provided DT fixup script (sun6i-a31s-fixup.scr)


Linux versions:
4.15.0-00003-g1bbe5edde691   vs   4.15.0-sunxi-dirty

In addition to that you are also booting into fb/hdmi.

If you use my branch (uImage and dtb) and replace the current boot.cmd
with this (to get the boot.scr you need to use mkimage) it should work:

setenv bootargs console=3DttyS0,115200 root=3D/dev/mmcblk0p2 rw rootwait
panic=3D10
load mmc 0:1 0x43000000 ${fdtfile} || load mmc 0:1 0x43000000
boot/${fdtfile}
load mmc 0:1 0x42000000 uImage || load mmc 0:1 0x42000000 boot/uImage
bootm 0x42000000 - 0x43000000

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
