From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC documentation
Date: Fri, 13 Oct 2017 17:28:59 +0800
Message-ID: <CAMz4kuKpnH8_LwjN_qr4sbyWh6_03U_a9FH60B_-Gy77CQZiOQ@mail.gmail.com>
References: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
 <20171013090726.y6mzuf7fdynnp2rj@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013090726.y6mzuf7fdynnp2rj@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 13 October 2017 at 17:07, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 11 Oct 2017, Baolin Wang wrote:
>
>> This patch adds the binding documentation for Spreadtrum SC27xx series
>> PMIC device.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
>> ---
>>  .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   23 ++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
>> new file mode 100644
>> index 0000000..333c818
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
>> @@ -0,0 +1,23 @@
>> +Spreadtrum SC27xx Power Management Integrated Circuit (PMIC)
>
> More info please.
>
> What does the ship do and what other devices are available.

OK. I will add more information in next version.

>
>> +Required properties:
>> +- compatible: Should be "sprd,sc2731".
>> +- reg: SPI chip select.
>
> Really?  Not an address?

Yes, it should be device address.

>
> What is the range?
>
>> +- spi-max-frequency: Typically set to 26000000.
>> +- interrupts: The interrupt line the device is connected to.
>> +- interrupt-controller: Marks the device node as an interrupt controller.
>> +- #interrupt-cells: The number of cells to describe an PMIC IRQ, should be 2.
>
> What if it's not 2?  Will it still work?

Must be 2, if not it can not work well. Will update in next version.

>
>> +- #address-cells: Child device offset number of cells, should be 1.
>
> Same.

OK.

>
>> +- #size-cells: Child device size number of cells, should be 0.
>
> Same.

OK.

>
>> +
>> +Example:
>> +pmic: pmic@0 {
>
> What other nodes are you referencing this one from?

This node should be under our ADI/SPI master device node, as one SPI
device. I will add the SPI master node in next version. Very
appreciated for your comments.

-- 
Baolin.wang
Best Regards
