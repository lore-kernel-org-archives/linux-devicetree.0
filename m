From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] MIPS: DTS: img: add device tree for Marduk board
Date: Tue, 18 Oct 2016 09:13:37 -0500
Message-ID: <20161018141337.3lardgah2qprqtdx@rob-hp-laptop>
References: <1476424555-22629-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1476424555-22629-2-git-send-email-rahul.bedarkar@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476424555-22629-2-git-send-email-rahul.bedarkar@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, James Hartley <james.hartley@imgtec.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2016 at 11:25:55AM +0530, Rahul Bedarkar wrote:
> Add support for Imagination Technologies' Marduk board which is based
> on Pistachio SoC. It is also known as Creator Ci40. Marduk is legacy
> name and will be there for decades.
> 
> Documentation for this board can be found on
> https://docs.creatordev.io/ci40/
> 
> This patch adds initial support for board with following peripherals:
> 
> * PWM based heartbeat LED
> * GPIO based buttons
> * SPI NOR flash on SPI1
> * UART0 and UART1
> * SD card
> * Ethernet
> * USB
> * PWM
> * ADC
> * I2C
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
> Changes in v2:
>   - Correct RAM size. It is 256MB instead of 128MB.
>   - Rename nodes pwm_leds -> leds and gpio_keys -> keys (Suggested by Rob Herring)
>   - Don't use '_' in node name for internal_dac_supply (Suggested by Rob Herring)
>   - Add part name in compatible string for spi-nor (Suggested by Rob Herring)
> ---
>  .../bindings/mips/img/pistachio-marduk.txt         |  10 ++
>  MAINTAINERS                                        |   6 +
>  arch/mips/boot/dts/img/Makefile                    |   9 ++
>  arch/mips/boot/dts/img/pistachio_marduk.dts        | 163 +++++++++++++++++++++
>  4 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
>  create mode 100644 arch/mips/boot/dts/img/Makefile
>  create mode 100644 arch/mips/boot/dts/img/pistachio_marduk.dts

Acked-by: Rob Herring <robh@kernel.org>
