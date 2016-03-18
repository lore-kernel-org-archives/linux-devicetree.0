From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 1/4] dt-bindings: power: reset: add document for reboot-mode driver
Date: Fri, 18 Mar 2016 10:07:14 +0100
Message-ID: <3696428.Va8GqGlrHG@diego>
References: <1457439716-8084-1-git-send-email-andy.yan@rock-chips.com> <20160317155212.GA19171@rob-hp-laptop> <56EBBFB1.6000808@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56EBBFB1.6000808@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, john.stultz@linaro.org, arnd@arndb.de, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, olof@lixom.net, alexandre.belloni@free-electrons.com, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, edubezval@gmail.com, f.fainelli@gmail.com, will.deacon@arm.com, linux-rockchip@lists.infradead.org, wxt@rock-chips.com, matthias.bgg@gmail.com, linux@arm.linux.org.uk, lorenzo.pieralisi@arm.com, moritz.fischer@ettus.com, richard@nod.at, dwmw2@infradead.org, jwerner@google.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Freitag, 18. M=C3=A4rz 2016, 16:43:29 schrieb Andy Yan:
> On 2016=E5=B9=B403=E6=9C=8817=E6=97=A5 23:52, Rob Herring wrote:
> > On Tue, Mar 08, 2016 at 08:23:05PM +0800, Andy Yan wrote:
> >> add device tree bindings document for reboot-mode driver
> >>=20
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

[...]

> >> diff --git
> >> a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
=2Etxt
> >> b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
=2Etxt
> >> new file mode 100644
> >> index 0000000..d03cb52
> >> --- /dev/null
> >> +++
> >> b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
=2Etxt
> >> @@ -0,0 +1,34 @@
> >> +SYSCON reboot mode driver
> >> +
> >> +This driver get reboot mode magic value form reboot-mode driver
> >> +and stores it in a SYSCON mapped register. Then the bootloader
> >> +can read it and take different action according to the magic
> >> +value stored.
> >> +
> >> +This DT node should be represented as a sub-node of a "syscon",
> >> "simple-mfd" +node.
> >> +
> >> +Required properties:
> >> +- compatible: should be "syscon-reboot-mode"
> >> +- offset: offset in the register map for the storage register (in=
 bytes)
> >> +
> >> +Optional properity:
> >> +- mask: the mask bits of the mode magic value, default set to 0xf=
fffffff
> >> if missing.>=20
> > I can't see how this is used. I would drop it for now.
> >=20
> > With that change:
> >=20
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> The mask is suggested by Moritz Fischer in V2[0]. And I found Tegra d=
id
> indeed only use some bits of one register to store the reboot mode[1]=
=2E
>=20
> @Heiko: It seems that this patch series can land now, but the dts par=
ts
> belong to  two different branch(arm32 and arm64) . And these
> two parts both depends on one head file rockchip_boot-mode.h, So I ho=
pe
> some suggestions from you how to deal with it.

as this is a new driver with completely new binding, the split should b=
e easy.

Sebastian (sre@kernel.org) should take the driver + binding-txt parts a=
nd I=20
can then simply queue up the 32 and 64 bit devicetree additions in my=20
respective branches for 4.7.


Thanks for pushing that whole thing through, as it looks really nice no=
w.
Heiko


>     [0] https://lkml.org/lkml/2016/1/27/225
>     [1] drivers/soc/tegra/pmc.c  (tegra_pmc_restart_notify)
>=20
> >> +
> >> +The rest of the properties should follow the generic reboot-mode
> >> discription +found in reboot-mode.txt
> >> +
> >> +Example:
> >> +	pmu: pmu@20004000 {
> >> +		compatible =3D "rockchip,rk3066-pmu", "syscon", "simple-mfd";
> >> +		reg =3D <0x20004000 0x100>;
> >> +
> >> +		reboot-mode {
> >> +			compatible =3D "syscon-reboot-mode";
> >> +			offset =3D <0x40>;
> >> +			mode-normal =3D <BOOT_NORMAL>;
> >> +			mode-recovery =3D <BOOT_RECOVERY>;
> >> +			mode-bootloader =3D <BOOT_FASTBOOT>;
> >> +			mode-loader =3D <BOOT_BL_DOWNLOAD>;
> >> +		};
> >> +	};
