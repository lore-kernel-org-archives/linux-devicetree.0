From: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Tue, 4 Apr 2017 09:28:33 +0200
Message-ID: <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc@st.com>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-2-git-send-email-ludovic.Barre@st.com>
 <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob

thanks for review
my comments below

br
Ludo

On 04/03/2017 06:57 PM, Rob Herring wrote:
> On Fri, Mar 31, 2017 at 07:02:03PM +0200, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>
>> This patch adds documentation of device tree bindings for the STM32
>> QSPI controller.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>> ---
>>   .../devicetree/bindings/mtd/stm32-quadspi.txt      | 45 ++++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>> new file mode 100644
>> index 0000000..95a8ebd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>> @@ -0,0 +1,45 @@
>> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
>> +
>> +Required properties:
>> +- compatible: should be "st,stm32f469-qspi"
>> +- reg: contains the register location and length.
>> +  (optional) the memory mapping address and length
> Why optional? Either the h/w has it or doesn't. If some chips don't,
> they should have a different compatible string.
in fact, the stm32 qspi controller can operate in any of the following 
modes:
-indirect mode: all the operations are performed using the qspi registers
with read/write.
-read memory-mapped mode: the external Flash memory is mapped to the
  microcontroller address space and is seen by the system as if it was
  an internal memory (use memcpy_fromio). this mode improve read throughput

if qspi_mm is defined the qspi controller use read memory-mapped mode
else the controller transfers in indirect mode.
>> +- reg-names: list of the names corresponding to the previous register
>> +  Should contain "qspi" to register location
>> +  (optional) "qspi_mm" if read in memory map mode (improve read throughput)
>> +- interrupts: should contain the interrupt for the device
>> +- clocks: the phandle of the clock needed by the QSPI controller
>> +- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
>> +
>> +Optional properties:
>> +- resets: must contain the phandle to the reset controller.
>> +
>> +A spi flash must be a child of the nor_flash node and could have some
>> +properties. Also see jedec,spi-nor.txt.
>> +
>> +Required properties:
>> +- reg: chip-Select number (QSPI controller may connect 2 nor flashes)
>> +- spi-max-frequency: max frequency of spi bus
>> +
>> +Optional property:
>> +- spi-rx-bus-width: the bus width (number of data wires)
> Just "see ../spi/spi-bus.txt" for the description
ok
>
>> +
>> +Example:
>> +
>> +qspi: qspi@a0001000 {
> spi@...
ok
>> +	compatible = "st,stm32f469-qspi";
>> +	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
>> +	reg-names = "qspi", "qspi_mm";
>> +	interrupts = <91>;
>> +	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
>> +	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_qspi0>;
>> +
>> +	flash@0 {
>> +		reg = <0>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-max-frequency = <108000000>;
>> +		...
>> +	};
>> +};
>> -- 
>> 2.7.4
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
