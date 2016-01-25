From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 5/6] mfd: dt-bindings: add device tree bindings for Hi3519 sysctrl
Date: Mon, 25 Jan 2016 15:45:38 +0100
Message-ID: <2693576.UgmARKQTGm@wuerfel>
References: <1452219400-32478-1-git-send-email-xuejiancheng@huawei.com> <5675031.hi9rRCqFXs@wuerfel> <20160125142609.GR3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160125142609.GR3368@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: xuejiancheng <xuejiancheng@huawei.com>, mturquette@baylibre.com, sboyd@codeaurora.org, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Monday 25 January 2016 14:26:09 Lee Jones wrote:
> On Tue, 12 Jan 2016, Arnd Bergmann wrote:
>=20
> > On Tuesday 12 January 2016 17:28:05 xuejiancheng wrote:
> > > >>>>>
> > > >>>> Not yet.
> > > >>>> Arnd Bergmann and Rob Herring all suggested adding a specifi=
c compatible string
> > > >>>> with the SOC name. This binding is just used for describing =
the compatible string now.
> > > >>>> When more functions on hi3519 SOC are added later, the speci=
fic driver will be also
> > > >>>> needed.
> > > >>>
> > > >>> Save this binding until it has more functionality.  We here "=
I'll add
> > > >>> to this later" all too often.
> > > >>>
> > > >>
> > > >> In the hi3519.dtsi file, there is a system-controller device n=
ode described like below:
> > > >> sysctrl: system-controller@12010000 {
> > > >>      compatible =3D "hisilicon,hi3519-sysctrl", "syscon";
> > > >>      reg =3D <0x12010000 0x1000>;
> > > >> };
> > > >> Do you mean that I should remove "hisilicon,hi3519-sysctrl" an=
d just use "syscon" as the
> > > >> compatible string?=E3=80=80
> > > >=20
> > > > Where is this compatible string _used_?
> > > >=20
> > > >> If I want to add "hisilicon,hi3519-sysctrl" for hi3519. where =
should I put this binding?
> > > >> Could you give some suggestions?  Thank you very much!
> > > >=20
> > > > If you're not using the compatible i.e. the device doesn't have=
 its
> > > > own driver yet, then there is no need to supply the binding at =
all, is
> > > > there?
> > > >=20
> > >=20
> > > OK. Thank you.
> > >=20
> >=20
> > Sorry for stepping in late here. I still think that every syscon de=
vice should
> > come with a specific compatible string, so we have the option of cr=
eating a
> > driver later on, and I'd like to see a binding document that lists =
those strings
> > (which I believe exists here).
> >=20
> > It's really hard to add compatible strings later on, anything else =
we can
> > work around by keying off that string and adding a workaround in th=
e kernel.
>=20
> Why is it more difficult (or any different) to add a compatible strin=
g
> later (when it is used) over now (when it is not used)?

There are many reasons why it can be hard to change a DT binary or sour=
ce
file later on. Sometimes the dtb is shipped with the firmware, sometime=
s
someone has a slightly different platform that is not yet upstreamed,
and they need to know about the change when forward-porting to a newer
kernel.

Either way, you always want to be able to run a newer kernel on an olde=
r
dtb file without loss of functionality, so all "compatible" strings sho=
uld
generally be as specific as possible (with fallbacks to more generic
strings). We do this even for devices that we think are identical, e.g.
when multiple SoC vendors integrate the same IP block, but in this case=
,
we already *know* that they are incompatible, so we should never have
the same string as the most specific ID.

	Arnd
