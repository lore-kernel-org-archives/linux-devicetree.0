From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
Date: Wed, 16 Jan 2019 10:21:30 +1100
Message-ID: <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
References: <20190109164343.164205-1-tmaimon77@gmail.com> <20190109164343.164205-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109164343.164205-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, linux-iio@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jan 2019 at 03:44, Tomer Maimon <tmaimon77@gmail.com> wrote:

> +Required Node in the NPCM7xx BMC:
> +An additional register is present in the NPCM7xx SOC which is
> +assumed to be in the same device tree, with and marked as
> +compatible with "nuvoton,npcm750-rst".

Is there a reason you don't include a phandle to the reset node?

I think doing that would make more sense.

> +adc: adc@f000c000 {
> +       compatible = "nuvoton,npcm750-adc";
> +       reg = <0xf000c000 0x8>;
> +       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +       clocks = <&clk NPCM7XX_CLK_ADC>;
> +};

> +
> +rst: rst@f0801000 {
> +       compatible = "nuvoton,npcm750-rst", "syscon",
> +       "simple-mfd";
> +       reg = <0xf0801000 0x6C>;
> +};
