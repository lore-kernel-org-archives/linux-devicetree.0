From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH v2] ARM: socfpga: dts: Add adxl34x
Date: Sun, 22 Mar 2015 22:03:51 -0500
Message-ID: <550F8297.80809@opensource.altera.com>
References: <1419462712-14151-1-git-send-email-walter@vanguardiasur.com.ar>
	<20150105092153.GJ13070@pengutronix.de>
	<CABxpGwCbFF+pJ0H_sMjqk6c9awdRuxi6j0CL_d3mH5z4Qht+ng@mail.gmail.com>
 <CABxpGwAFdLET+fg3WvMWqXdzsPQHv3hKx9cFwk9RQE9w6+rEbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxpGwAFdLET+fg3WvMWqXdzsPQHv3hKx9cFwk9RQE9w6+rEbg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Walter Lozano <walter@vanguardiasur.com.ar>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux@arm.linux.org.uk, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Walter,

On 3/19/15 4:27 PM, Walter Lozano wrote:
> Hi Dinh,
> 
> On Mon, Mar 16, 2015 at 10:10 AM, Walter Lozano
> <walter@vanguardiasur.com.ar> wrote:
>> On Mon, Jan 5, 2015 at 6:21 AM, Steffen Trumtrar
>> <s.trumtrar@pengutronix.de> wrote:
>>> Hi!
>>>
>>> On Wed, Dec 24, 2014 at 08:11:52PM -0300, Walter Lozano wrote:
>>>> This patch adds the DTS bindings for the adxl34x digital
>>>> accelerometer.
>>>>
>>>> Signed-off-by: Walter Lozano <walter@vanguardiasur.com.ar>
>>>> ---
>>>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |   16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>>> index 16ea6f5..d343e03 100644
>>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>>> @@ -60,6 +60,22 @@
>>>>       rxc-skew-ps = <2000>;
>>>>  };
>>>>
>>>> +&gpio2 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&i2c1 {
>>>> +     status = "okay";
>>>> +
>>>> +     accel1: accelerometer@53 {
>>>> +             compatible = "adxl34x";

Shouldn't this be "adi,adxl34x"? At least that's what the documentation
says.

>>>> +             reg = <0x53>;
>>>> +
>>>> +             interrupt-parent = <&portc>;
>>>> +             interrupts = <3 2>;
>>>> +     };
>>>> +};
>>>> +
>>>>  &mmc0 {
>>>>       vmmc-supply = <&regulator_3_3v>;
>>>>       vqmmc-supply = <&regulator_3_3v>;
>>>
>>> I just gave it a short spin. I get some interrupts and the position property
>>> changes, so it seems to work:
>>>
>>>         Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>>>
>>
>> Ping?
>> How should this continue?
> 
> Any news about this patch? It has been acked by Pavel Machek and
> Steffen Trumtrar a while ago.
>

Sorry, since I wasn't CC on the original patch and somehow my filter
didn't catch it, I didn't see this patch until now.

Dinh
