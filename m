From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [RFC] MIPS: BCM63XX: add Device Tree clock definitions
Date: Wed, 14 Nov 2012 13:11:06 +0100
Message-ID: <CAOiHx=m=OxDiXKozQG1_iUBDhWj3iJDd9b8LHP_6mPL=FOyGPQ@mail.gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
 <1352638249-29298-10-git-send-email-jonas.gorski@gmail.com> <50A1D452.2020904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A1D452.2020904@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Maxime Bizon <mbizon@freebox.fr>, Florian Fainelli <florian@openwrt.org>, Kevin Cernekee <cernekee@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13 November 2012 06:02, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/11/2012 05:50 AM, Jonas Gorski wrote:
>> Add definitions for the clocks found and used in all supported SoCs.
>
>> diff --git a/arch/mips/bcm63xx/dts/bcm6328.dtsi b/arch/mips/bcm63xx/dts/bcm6328.dtsi
>
>> +                     clocks {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             periph: pll {
>> +                                     compatible = "brcm,bcm63xx-clock";
>> +                                     #clock-cells = <0>;
>> +                                     clock-frequency = <50000000>;
>> +                                     clock-output-names = "periph";
>> +                             };
>
> Here too, it seems like some reg properties would be required.

This is more or less a dummy clock with no real backing for it, but
some of the drivers expect this clock to be present (even just to get
the frequency).


Jonas
