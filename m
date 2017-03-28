From: Helmut Klein <hgkr.klein@gmail.com>
Subject: Re: [PATCH v2, 2/3] tty/serial: meson_uart: add documentation for the
 dt-bindings
Date: Tue, 28 Mar 2017 20:20:43 +0200
Message-ID: <c233fb1c-7ae5-cfdf-938d-6e9dfa7bbcca@gmail.com>
References: <20170328092545.4644-1-hgkr.klein@gmail.com>
 <20170328092545.4644-3-hgkr.klein@gmail.com>
 <20170328100551.GA24221@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170328100551.GA24221@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hallo Mark,

i will add your text to the patch.

Helmut

On 28.03.2017 12:05, Mark Rutland wrote:
> On Tue, Mar 28, 2017 at 11:25:44AM +0200, Helmut Klein wrote:
>> Add the documentation for the device tree binding of meson_uart
>>
>> Signed-off-by: Helmut Klein <hgkr.klein@gmail.com>
>> ---
>>  .../bindings/serial/amlogic,meson_uart.txt         | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson_uart.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson_uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson_uart.txt
>> new file mode 100644
>> index 000000000000..6f94ba25760d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson_uart.txt
>> @@ -0,0 +1,25 @@
>> +* Amlogic Meson UART, used in multiple SoCs (e.g. S905, s905X, ...)
>> +
>> +Required properties:
>> +- compatible	: "amlogic,meson-uart"
>> +- reg		: offset and length of the register set for the device.
>> +- interrupts	: device interrupt
>> +- clocks	: the baud rate clock for the UART and optionally the core clock for the none AO uarts
>> +e.g.
>> +uart_A: serial@84c0 {
>> +	compatible = "amlogic,meson-uart";
>> +	reg = <0x0 0x84c0 0x0 0x14>;
>> +	pinctrl-0 = <&uart_a_pins &uart_a_cts_rts_pins>;
>> +	interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>> +	clocks = <&xtal>, <&clkc CLKID_UART0>;
>> +	clock-names = "xtal", "core";
>
> Please define these explicitly above, e.g.
>
> - clocks: a list of phandle + clock-specifier pairs, one for each entry
>           in clock names.
> - clock-names: contains:
>   * "xtal" for the baud rate clock
>   * "core" for the non-AO UARTs (optional)
>
> Thanks,
> Mark.
>
