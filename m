From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] reset: Add i.MX7 SRC reset driver
Date: Mon, 13 Feb 2017 06:54:49 -0800
Message-ID: <CAHQ1cqFAvo1_n5Qcm+za5NL+vnY9xV7XuLH4yfKCn8rh_OGLzw@mail.gmail.com>
References: <20170206150836.10001-1-andrew.smirnov@gmail.com>
 <20170210154354.nlcj2gq6dun7bc43@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170210154354.nlcj2gq6dun7bc43@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 7:43 AM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Feb 06, 2017 at 07:08:36AM -0800, Andrey Smirnov wrote:
>> This driver exposes various reset faculties, impelented by System Reset
>> Controller IP block, as a reset driver. Currently only PCIE related
>> reset lines are implemented.
>>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Fabio Estevam <fabio.estevam@nxp.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  .../devicetree/bindings/reset/fsl,imx7-src.txt     |  47 +++++++
>>  drivers/reset/Kconfig                              |   8 ++
>>  drivers/reset/Makefile                             |   1 +
>>  drivers/reset/reset-imx7.c                         | 149 +++++++++++++++++++++
>>  include/dt-bindings/reset/imx7-reset.h             |  28 ++++
>>  5 files changed, 233 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>>  create mode 100644 drivers/reset/reset-imx7.c
>>  create mode 100644 include/dt-bindings/reset/imx7-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
>> new file mode 100644
>> index 0000000..19a77f9
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
>
> Doesn't match the example. This should be specific. I assume there's
> more than one i.MX7?
>
>> +- reg: should be register base and length as documented in the
>> +  datasheet
>> +- interrupts: Should contain SRC interrupt
>> +- #reset-cells: 1, see below
>> +
>> +example:
>> +
>> +src: src@30390000 {
>
> reset-controller@...

OK, will update in v2.

>
>> +     compatible = "fsl,imx7d-src", "syscon";
>> +     reg = <0x30390000 0x10000>;
>
> Really has 64KB of registers or that's just the block spacing. Assuming
> the actual size is smaller, you are eating up valuable lowmem space by
> mapping all 64KB.
>

There are definitely registers within first 8K of that window, and I
have no idea if there are any more undocumented registers going even
further, but IMHO you are very likely to be correct in your assumption
that this is mostly block spacing. I borrowed already existing "src"
node definition from i.MX7 device tree code and that is how it was
defined there. I'll shrink the example to be only 8K.

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
>> +     pcie: pcie@0x33800000 {
>
> Drop the 0x.

OK, will do in v2.

Thanks,
Andrey Smirnov
