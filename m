From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
Date: Mon, 23 Sep 2019 22:49:37 +0200
Message-ID: <CAFBinCAHD+D=a2mHeHMGq12MvoksHBr308jSrdcH+UYsUmwd8w@mail.gmail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com> <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Mon, Sep 23, 2019 at 12:06 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> > registers. This series:
> > - adds support for this DDR clock controller (patches 0 and 1)
> > - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
>
> Have you been able to validate somehow that DDR rate calculated by CCF
> is the actual rate that gets to the audio clocks ?
no, I haven't been able to validate this (yet)

> While I understand the interest for completeness, I suspect the having
> the DDR clock as an audio parent was just for debugging purpose. IOW,
> I'm not sure if adding this parent is useful to an actual audio use
> case. As far as audio would be concerned, I think we are better of
> without this parent.
there at least three other (potential) consumers of the ddr_pll clocks
on the 32-bit SoCs:
- CPU clock mux [0]
- clk81 mux [1]
- USB PHY [2]

I have not validated any of these either

> > - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
> >
>
> Could you please separate the driver and DT series in the future ? Those
> take different paths and are meant for different maintainers.
sure - so far Kevin has been doing a great job of still tracking these
but I'm happy to split this into two patchsets


Martin


[0] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L441
[1] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L452
[2] https://github.com/endlessm/u-boot-meson/blob/f1ee03e3f7547d03e1478cc1fc967a9e5a121d92/arch/arm/cpu/aml_meson/m8/firmware/usb_boot/platform.c#L22
