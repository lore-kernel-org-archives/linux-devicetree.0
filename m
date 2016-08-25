From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 25 Aug 2016 12:40:57 +0800
Message-ID: <CAGb2v66tFENk8QBw7D1+bwFN-zWaE2SGDrNyc-zdbJSRzENk4Q@mail.gmail.com>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz>
 <20160824193600.GS8103@lukather> <43951472083107@web23m.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <43951472083107@web23m.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 25, 2016 at 7:58 AM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
>
>
> 25.08.2016, 03:36, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
>> Hi,
>>
>> On Tue, Aug 23, 2016 at 02:44:51PM +0800, Icenowy Zheng wrote:
>>>  UART1 is connected to the bluetooth part of RTL8723BS WiFi/BT combo card
>>>  on iNet D978 Rev2 board.
>>>
>>>  Enable the UART1 to make it possible to use the modified hciattach by
>>>  Realtek to drive the BT part of RTL8723BS.
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>>
>> I guess you could fold that patch into the previous one.
>>
>>>  ---
>>>   arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>>  diff --git a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
>>>  index 78823d8..3ac22d4 100644
>>>  --- a/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
>>>  +++ b/arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts
>>>  @@ -48,6 +48,10 @@
>>>           model = "INet-D978 Rev 02";
>>>           compatible = "primux,inet-d978-rev2", "allwinner,sun8i-a33";
>>>
>>>  + aliases {
>>>  + serial1 = &uart1;
>>>  + };
>>>  +
>>
>> Is there any other UART in the system?
>
> serial0 is defined in sun8i-reference-design-tablet.dtsi, as r_uart.

If your board does not have r_uart pads, then the right thing to do
would be to disable it. You can then have uart1 as serial0.

AFAIK Linux requires a console, but that console can be simplefb.

ChenYu

>>
>> The alias is not supposed to be about the controller index, but the
>> index in the board, meaning that if you only have a single UART, that
>> would be serial0.
>>
>> Thanks!
>> Maxime
>>
>> --
>> Maxime Ripard, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
