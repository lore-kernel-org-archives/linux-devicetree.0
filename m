From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 09/14] DEVICETREE: Add bindings for PIC32 usart driver
Date: Fri, 11 Dec 2015 09:16:30 -0700
Message-ID: <566AF6DE.9030803@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-10-git-send-email-joshua.henderson@microchip.com>
 <20151122215622.GA32221@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151122215622.GA32221@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On 11/22/2015 02:56 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:21PM -0700, Joshua Henderson wrote:
>> From: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>
>> Document the devicetree bindings for the USART peripheral found on
>> Microchip PIC32 class devices.
>>
>> Signed-off-by: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  .../bindings/serial/microchip,pic32-usart.txt      |   29 ++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>> new file mode 100644
>> index 0000000..c87321c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/microchip,pic32-usart.txt
>> @@ -0,0 +1,29 @@
>> +* Microchip Universal Synchronous Asynchronous Receiver/Transmitter (USART)
>> +
>> +Required properties:
>> +- compatible: Should be "microchip,pic32-usart"
> 
> Again, should be more specific.
> 

Ack.  In addition, will replace all instances of USART with UART.

>> +- reg: Should contain registers location and length
>> +- interrupts: Should contain interrupt
>> +- pinctrl: Should contain pinctrl for TX/RX/RTS/CTS
>> +
>> +Optional properties:
>> +- microchip,uart-has-rtscts : Indicate the uart has hardware flow control
>> +- rts-gpios: RTS pin for USP-based UART if microchip,uart-has-rtscts
>> +- cts-gpios: CTS pin for USP-based UART if microchip,uart-has-rtscts
> 
> This appears to just be copied for Sirf UART.
> 
> Doesn't *-gpios being present imply having h/w 
> flow-control (i.e. microchip,uart-has-rtscts)?
> 
> Rob

Agreed.  microchip,uart-has-rtscts will be dropped and it turns out we don't really need the rtc-gpios property.

Josh

> 
>> +
>> +Example:
>> +	usart0: serial@1f822000 {
>> +		compatible = "microchip,pic32-usart";
>> +		reg = <0x1f822000 0x50>;
>> +		interrupts = <UART1_FAULT DEFAULT_INT_PRI IRQ_TYPE_NONE>,
>> +			     <UART1_RECEIVE_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>,
>> +			     <UART1_TRANSFER_DONE DEFAULT_INT_PRI IRQ_TYPE_NONE>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <
>> +			&pinctrl_uart1
>> +			&pinctrl_uart1_cts
>> +			&pinctrl_uart1_rts>;
>> +		microchip,uart-has-rtscts;
>> +		cts-gpios = <&pioB 15 0>;
>> +		rts-gpios = <&pioD 1 0>;
>> +	};
>> -- 
>> 1.7.9.5
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
