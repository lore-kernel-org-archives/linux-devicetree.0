From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Date: Tue, 26 Feb 2019 10:07:34 +0000
Message-ID: <VI1PR04MB422296935D82A351A6A1DD92807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
 <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Sorry for the long email, I want to describe things more clear to help the review.

First, i want to share some backgrounds on how this patch series comes from,
it mainly consists of three reasons:

1. New architecture to save a lot duplicated codes
We want to write a more generic <soc>-ss-<subsys>.dtsi shared by imx8qxp, imx8qm,
imx8dx, imx8dm according to HW characteristic then we'd better decouple the dependency
of Clock ID definitions from device tree due to the SS and device availability difference among them.
[00/14] arm64: dts: imx8: architecture improvement and adding imx8qm support
https://patchwork.kernel.org/cover/10824537/

2. Power domain requirements
Both SCU and LPCG clock access requires it's associated power domain enabled, CCF
already supports it and device tree seems to be the best place to describe it.
e.g. arch/arm64/boot/dts/exynos/exynos5433.dtsi
cmu_aud: clock-controller@114c0000 {
        compatible = "samsung,exynos5433-cmu-aud";
        #clock-cells = <1>;
		....
        power-domains = <&pd_aud>;
};

Furthermore, if the power domain is off (e.g. during system suspend) the clock state
Within this domain will be lost and we have to restored it after power domain is re-enabled.
We'd like to use common driver suspend/resume to handle it.
(In the future, we might support Runtime state save&restore as well in order to shut
down the whole SS if not used, that also need power domain info from DT).

3. Partition support
IMX SCU firmware supports Resource Partition service which allows each device resource
to be partitioned into different ownership groupings that are associated with different
execution environments including multiple operating systems executing on different
cores, TrustZone, and hypervisor.

That means we can't register all the clocks in Linux as some of them may not belong
to us and can't access. (we can check all the clocks via SCU RPC call before register, 
but that also needs a branch of time. However, LPCG not easy to check as it does not provide
resource id). Putting clocks of device in DT allows the dynamically configuration of it according
to the real partition requirements.
E.g. Remove some clock/device nodes once not belong to Linux OS partition or not exist in
hardware on this SoC SS.

And please see below for my replies to other of your questions:

> From: Stephen Boyd [mailto:sboyd@kernel.org]
> Sent: Tuesday, February 26, 2019 3:46 AM
> Quoting Aisheng Dong (2019-02-21 10:03:47)
> > MX8QM and MX8QXP LPCG Clocks are mostly the same except they may
> > reside in different subsystems across CPUs and also vary a bit on the
> availability.
> >
> > Same as SCU clock, we want to move the clock definition into device
> > tree which can fully decouple the dependency of Clock ID definition
> > from device tree. And no frequent changes required in clock driver any
> > more to handle the difference.
> >
> > We can use the existence of clock nodes in device tree to address the
> > device and clock availability differences across different SoCs.
> 
> This sounds similar to what TI folks are doing with their new firmware.
> It leads to problems where we don't know what in the clk tree needs to be
> registered, 

AFAICT we know what clocks need to be registered according to the device availability
in each SS (Subsystem) in HW definition.
Am I missed something?

> debugfs is not super helpful in that case, 

Debugfs functions the same as defining clocks in driver.
Every cock defined in driver can be defined in device tree according to HW configuration
and displayed with debugfs. So I'm not quite get the point of the concern.
Can you help clarify a bit more?

> and late init only turns off
> clks that are found during probe (so nothing then?).

Same as above.

BTW, we did not support turn off clocks for LPCG during late init.
Probably won't support in the future as LPCG is the next level gates of SCU clocks.
Gating off LPCG clocks while SCU clocks disabled already looks not so meaningful, right?
And gate off such type LPCG is quite expensive as LPCG needs enable its power domain
to access and chip reset already ensures the LPCG clocks are off and the later LPCG
enable/disable also can sync the HW state.

For the parent SCU clocks, we also still don't have the plan to support late gate off because
SCU clock might be shared with M-Core OS or Secure SW (e.g. ATF, OPTee) and A core can't
Gate off those "unused" ones it believes. Currently what we're doing is ensure gate off
power&clocks after using in bootloader before hand over to kernel.

> 
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > index 965cfa4..a317844 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > @@ -11,6 +11,20 @@ enabled by these control bits, it might still not
> > be running based  on the base resource.
> >
> >  Required properties:
> > +- compatible:          Should be one of:
> > +                         "fsl,imx8qxp-lpcg"
> > +                         "fsl,imx8qm-lpcg" followed by
> "fsl,imx8qxp-lpcg".
> > +- reg:                 Address and length of the register set.
> > +- #clock-cells:                Should be 1. One LPCG supports multiple
> clocks.
> > +- clocks:              Input parent clocks phandle array for each clock.
> > +- bit-offset:          An integer array indicating the bit offset for each
> clock.
> > +- hw-autogate:         Boolean array indicating whether supports HW
> autogate for
> > +                       each clock.
> 
> This looks like one clk per node style of bindings which is a direction we don't
> want DT bindings to go in. It leads to a bunch of time parsing DT to generate
> clks and in general doesn't represent the clock controller hardware that is
> there. Basically, anything with 'bit-offset'
> in the binding is not going to be acceptable.
> 

It's one LPCG per node which represents a couple of clock output gates controlled by
this LPCG for one specific module.
For MX8QM/QXP platforms, there're separate LPCGs for each device resource.
LPCGs are independent with each other with separate io space, behaving separate module
clock controllers and they are distributed in different SS (subsystems).
Describing it separately in device tree is more comply with real hardware although
it sacrifices a bit parsing time.

Regards
Dong Aisheng

> > +- clock-output-names:  Shall be the corresponding names of the outputs.
> > +                       NOTE this property must be specified in the
> same order
> > +                       as the clock bit-offset and hw-autogate property.
> > +
> > +Legacy binding (DEPRECATED):
> >  - compatible:  Should be one of:
> >                   "fsl,imx8qxp-lpcg-adma",
