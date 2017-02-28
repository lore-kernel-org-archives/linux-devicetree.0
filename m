From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v4] reset: Add i.MX7 SRC reset driver
Date: Tue, 28 Feb 2017 11:46:00 -0800
Message-ID: <CAHQ1cqG4VSr=E1U4CpruYtvzXK0xcJTow0VwurP1S4_Hi-TJzg@mail.gmail.com>
References: <20170221161331.17012-1-andrew.smirnov@gmail.com>
 <1488292707.2288.53.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488292707.2288.53.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 6:38 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Tue, 2017-02-21 at 08:13 -0800, Andrey Smirnov wrote:
>> Add reset controller driver exposing various reset faculties,
>> implemented by System Reset Controller IP block.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>
>> Changes since v3 (see [v3]):
>>
>>       - Convert code IMX7_RESET_PCIEPHY to change G_RST and BTNRST
>>           simultaneously to make all resets be representable as
>>           signal->bit in signal->offset register
>>
>>       - Convert assert/deassert subroutines to be special cases of a
>>           common reset subroutine
>>
>> Changes since v2 (see [v2]):
>>
>>       - Fix typos
>>
>>       - Kconfig/Makefile chagnes account for alphabetical sorting of
>>           those files
>>
>>       - Remove redundant includes
>>
>>       - Make use of regmap_attach_dev and avoid storing refernce to
>>           struct *dev in private data
>>
>>       - Change code and headers to expose almost all of the reset
>>           related bits in SRC IP block
>>
>> Changes since v1 (see [v1]):
>>
>>       - Various small DT bindings description fixes as per feedback
>>           from Rob Herring
>>
>>
>> [v1] https://lkml.org/lkml/2017/2/6/554
>> [v2] https://lkml.org/lkml/2017/2/13/488
>> [v3] https://lkml.org/lkml/2017/2/20/344
>>
>>
>>  .../devicetree/bindings/reset/fsl,imx7-src.txt     |  47 ++++++
>>  drivers/reset/Kconfig                              |   8 ++
>>  drivers/reset/Makefile                             |   2 +
>>  drivers/reset/reset-imx7.c                         | 158 +++++++++++++++++++++
>>  include/dt-bindings/reset/imx7-reset.h             |  62 ++++++++
>>  5 files changed, 277 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>>  create mode 100644 drivers/reset/reset-imx7.c
>>  create mode 100644 include/dt-bindings/reset/imx7-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>> new file mode 100644
>> index 0000000..5e1afc3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>> @@ -0,0 +1,47 @@
>> +Freescale i.MX7 System Reset Controller
>> +======================================
>> +
>> +Please also refer to reset.txt in this directory for common reset
>> +controller binding usage.
>> +
>> +Required properties:
>> +- compatible: Should be "fsl,imx7-src", "syscon"
>> +- reg: should be register base and length as documented in the
>> +  datasheet
>> +- interrupts: Should contain SRC interrupt
>> +- #reset-cells: 1, see below
>> +
>> +example:
>> +
>> +src: reset-controller@30390000 {
>> +     compatible = "fsl,imx7d-src", "syscon";
>> +     reg = <0x30390000 0x2000>;
>> +     interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>> +     #reset-cells = <1>;
>> +};
>> +
>> +
>> +Specifying reset lines connected to IP modules
>> +==============================================
>> +
>> +The system reset controller can be used to reset various set of
>> +peripherals. Device nodes that need access to reset lines should
>> +specify them as a reset phandle in their corresponding node as
>> +specified in reset.txt.
>> +
>> +Example:
>> +
>> +     pcie: pcie@33800000 {
>> +
>> +             ...
>> +
>> +             resets = <&src IMX7_RESET_PCIEPHY>,
>> +                      <&src IMX7_RESET_PCIE_CTRL_APPS_EN>;
>> +             reset-names = "pciephy", "apps";
>> +
>> +             ...
>> +        };
>> +
>> +
>> +For list of all valid reset indicies see
>> +<dt-bindings/reset/imx7-reset.h>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 172dc96..bea1800 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -27,6 +27,14 @@ config RESET_BERLIN
>>       help
>>         This enables the reset controller driver for Marvell Berlin SoCs.
>>
>> +config RESET_IMX7
>> +     bool "i.MX7 Reset Driver"
>> +     depends on SOC_IMX7D || COMPILE_TEST
>> +     select MFD_SYSCON
>> +     default SOC_IMX7D
>
> Can we make this
>
> config RESET_IMX7
>         bool "i.MX7 Reset Driver" if COMPILE_TEST
>         default SOC_IMX7D
>         select MFD_SYSCON
>
> instead?
>
> If you agree, I can fix it up while applying.

Sure, I have no problem with that change.

Thanks,
Andrey
