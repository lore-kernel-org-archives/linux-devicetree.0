From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Mon, 10 Jun 2019 14:15:28 +0200
Message-ID: <4056907.DrFocau5Ix@debian64>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com> <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?utf-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday, June 10, 2019 12:09:56 PM CEST Sricharan R wrote:
> Hi Christian,
> 
> On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> > On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
> >>
> >> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> >> CP01 evaluation board.
> >>
> >> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> >> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> >>
> >> +       clocks {
> >> +               sleep_clk: sleep_clk {
> >> +                       compatible = "fixed-clock";
> >> +                       clock-frequency = <32000>;
> >> +                       #clock-cells = <0>;
> >> +               };
> >> +
> > Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> > on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> > From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> > declares them at 32000 Hz. Since you probably have access to the BOM and
> > datasheets. Can you please confirm what's the real clock frequency for
> > the IPQ6018.
> > (And maybe also for the sleep_clk of the IPQ4018 as well?).
> > 
> 
> What exactly is the issue that you faced ?
> Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.

We need just a confirmation.

Then again, Currently the qcom-ipq4019.dtsi is using 32768 Hz.

|		sleep_clk: sleep_clk {
|			compatible = "fixed-clock";
|			clock-frequency = <32768>;
|			#clock-cells = <0>;
|		};

<https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom-ipq4019.dtsi#L144>

Which makes sense, because all previous Qualcomm Atheros MIPS and the
future IPQ8072 SoCs have been either using or deriving a 32768 Hz clock.

For example: The AR9344 derives the clock from the 25MHz/40MHz external
oscillator. This is explained in "8.16.9 Derived RTC Clock (DERIVED_RTC_CLK)".
Which mentions that the "32KHz" clock interval is 30.5 usec / 30.48 usec
depending whenever the external reference crystal has 40MHz or 25MHz.
(1/30.5usec = 32.7868852 kilohertz!). The QCA9558 datasheet says the same
in "10.19.11 Derived RTC Clock". 

For IPQ8072: I point to the post by Sven Eckelmann on the OpenWrt ML:
<http://lists.infradead.org/pipermail/openwrt-devel/2019-May/017131.html>
"I was only able to verify for IPQ8072 that it had a 32.768 KHz
sleep clock." 

So this is pretty much "why there is an issue", it's confusing.
Is possible can you please look if there are (fixed) divisors values
listed in the documentation or the registers and bits that the values
are stored in? Because then we could just calculate it. 

Regards,
Christian
