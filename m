From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to P5V0 regulator
Date: Mon, 2 Sep 2019 06:48:06 +0530
Message-ID: <CANAwSgRVkJXNckcNELKhj4R_Lex62WJn3K4ct1wkuocMjfWAAg@mail.gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com> <20190828202723.1145-2-linux.amoon@gmail.com>
 <CAFBinCBWq0LcdA1-a5W06zKp0RzGs5_=Mph6StGKXJ7npCgbfg@mail.gmail.com>
 <CANAwSgS+HGYXr290=EvdhKxh3TiBOqfbcuuF4cMAiBVX1ez9+Q@mail.gmail.com> <CAFBinCCLPa64_h0JE4Z_pMuUuhb=HKUXPti2pkUFAuEPO2fE6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCLPa64_h0JE4Z_pMuUuhb=HKUXPti2pkUFAuEPO2fE6Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Martin,

On Mon, 2 Sep 2019 at 03:23, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sun, Sep 1, 2019 at 3:58 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Hi Martin,
> >
> > Thanks for your review comments.
> >
> > Their have been some revision changes in S905 Odroid Schematics.
> > [0] https://dn.odroid.com/S905/Schematic/
> >
> > Well I have make my changes based on old odroid-c2_rev0.2_20151218.pdf
>
> [...]
> > >
> > > according to the schematics there's both:
> > > - VDDIO_AO3V3
> > > - VCC3V3 (which is turned on by VDDIO_AO3V3, see [0])
> > >
> >
> > From the schematics it seams same.
> >
> > VDDIO_AO3V3---DMG340LSQN4 (Q4)---VCC3V3
> yes, they are the same signal. the only difference is that VCC3V3 is
> turned on later in the power-up sequence
>
> > But this name change was done to link TFLASH_VDD_EN to TFLASH_VDD for eMMC
> >
> > VDDIO_AO3V3-----TFLASH_VDD using  TFLASH_VDD_EN gpio pin.
> >
> > Well I have tested this changes on eMMC module.
> I cannot see any of the TFLASH_* regulators being linked to eMMC (they
> are only linked to the SD card slot, I also checked
> odroid-c2_rev0.2_20151218.pdf and odroid-c2_rev0.2_20171114.pdf).
> which page of the odroid-c2_rev0.2_20151218.pdf schematics shows how
> TFLASH_VDD is linked to eMMC?
>
> please note that I don't have an Odroid-C2 board myself (so I cannot
> test any of this).
>
>
> Martin

Thanks I will double check again and re-post then with correction again.

Best Regards
-Anand
