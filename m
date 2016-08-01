From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] ehci-platform: add the max clock number to 4
Date: Mon, 1 Aug 2016 09:27:12 +0200
Message-ID: <01a348da-3b26-68a6-9d9f-c37d81b4fd64@redhat.com>
References: <20160731112536.4625-1-icenowy@aosc.xyz>
 <20160731112536.4625-3-icenowy@aosc.xyz> <2477355.hXm3xYUusy@wuerfel>
 <414101470035152@web9j.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <414101470035152@web9j.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Reinder de Haan <patchesrdh@mveas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Tony Prisk <linux@prisktech.co.nz>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 01-08-16 09:05, Icenowy Zheng wrote:
> 			clocks = <&ccu CLK_A64_BUS_OHCI1>,
> 				 <&ccu CLK_A64_BUS_EHCI1>,
> 				 <&ccu CLK_A64_USB_OHCI0>,
> 				 <&ccu CLK_A64_USB_OHCI1>;
>
> On A64, EHCI requires the matched OHCI to work.

Ah, so just like on the H3 (where this also is needed
and not documented).

> And OHCI1 clock requires OHCI0 clock to work.

Hmm, that one is new, can you double check this ?

Regards,

Hans


>
> (But from the SoC's user manual we cannot get any infomation
> about the relationship between OHCI1 clock and OHCI0 clock,
> and in the manual OHCI0 clock is called OTG-OHCI)
>
> 01.08.2016, 15:01, "Arnd Bergmann" <arnd@arndb.de>:
>> On Sunday, July 31, 2016 7:25:36 PM CEST Icenowy Zheng wrote:
>>>  Allwinner A64 EHCI requires 4 clocks to be enabled.
>>>
>>>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>>
>> Can you say what those four clocks are?
>>
>> Are you sure that it's not just a case of a clock being
>> incorrectly described in the clk driver, i.e. you reference
>> one clock along with its parent here?
>>
>>         Arnd
