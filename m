From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Fri, 04 Dec 2015 11:49:44 +0100
Message-ID: <3047121.2z9SCS5Au2@wuerfel>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com> <1728470.0OiiXMcl88@wuerfel> <5660FA2E.6040601@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5660FA2E.6040601@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, ml.yang@hisilicon.com, yanghongwei@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Friday 04 December 2015 10:27:58 xuejiancheng wrote:
> >=20
> >> +            sysctrl: system-controller@12020000 {
> >> +                    compatible =3D "hisilicon,sysctrl";
> >> +                    reg =3D <0x12020000 0x1000>;
> >> +                    reboot-offset =3D <0x4>;
> >> +            };
> >=20
> > Is this one identical to the one in hip04?
> >=20
> > If not, pick a new unique compatible string
>=20
> Yes. It's compatible with the one in hip04.

Ok, we should add a compatible string for that then, as the hip04 appar=
ently
has a slightly different layout from hip01.

Can you add a separate patch to clarify the existing hisilicon,sysctrl =
nodes?

It look like hi3620 accidentally uses the same string as hip04 already
but is actually a bit different.

Maybe split out the sysctrl binding from
Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt, as it ha=
s
you already have a couple of those, and it's not clear how they relate
to one another.

If we introduce a string for all hip04 compatible sysctrl devices, we s=
hould
document that and use it consistently, so hi3519 becomes

	compatible =3D "hisilicon,hi3519-sysctrl", "hisilicon,hip04-sysctrl", =
"hisilicon,sysctrl";

but I'd clarify in the binding documentation that "hisilicon,sysctrl" s=
hould
only be used for hip04 and hi3519 but not the others.

As this seems to be a standard part, we can also think about making a
high-level driver for in in drivers/soc rather than relying on the sysc=
on
driver which we tend to use more for one-off devices with random regist=
er
layouts.

> >> +
> >> +            crg: crg@12010000 {
> >> +                    compatible =3D "hisilicon,hi3519-crg";
> >=20
> >=20
> > what is a "crg"? Is there a standard name for these?
>=20
> The "crg" means Clock and Reset Generator. It's a block which supplie=
s clock
> and reset signals for other modules in the chip. I used "hi3519-clock=
"
> in last version patch. Rob Herring suggested that it's better to use =
"hi3519-crg"
> as the compatible string if it's a whole block.
>=20
> what about writing like this=EF=BC=9F
>=20
> crg: clock-reset-controller@12010000 {
>         compatible =3D "hisilicon,hi3519-crg";
>         }
>=20

Ok, that's better.

	Arnd
