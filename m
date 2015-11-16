From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: sun8i-h3-orangepi-plus:
 Enable USB host controllers
Date: Mon, 16 Nov 2015 09:11:20 +0100
Message-ID: <56498FA8.3050908@redhat.com>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
 <1447616777-24660-5-git-send-email-hdegoede@redhat.com>
 <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ@mail.gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBM47U2ZAKGQE3UE5K5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v669Cu6+G=P8yH-g5KbOsWTHBgnYUYf2fGt+jKXbqVAKfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 16-11-15 04:00, Chen-Yu Tsai wrote:
> Hi,
>
> On Mon, Nov 16, 2015 at 3:46 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>>
>> Enable the 3 pairs of USB host controllers used on the Orange Pi Plus.
>>
>> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> index e67df59..e05a409 100644
>> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
>> @@ -60,6 +60,18 @@
>>          };
>>   };
>>
>> +&ehci1 {
>> +       status = "okay";
>> +};
>> +
>> +&ehci2 {
>> +       status = "okay";
>> +};
>> +
>> +&ehci3 {
>> +       status = "okay";
>> +};
>> +
>>   &mmc0 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
>> @@ -70,8 +82,24 @@
>>          status = "okay";
>>   };
>>
>> +&ohci1 {
>> +       status = "okay";
>> +};
>
> This controller is connected to a FE1.1s USB 2.0 hub, giving us the
> four usable external USB ports. We shouldn't need to enable OHCI.

Right, my bad, I actually tested this on an orangepi pc, for which
we need to create a new dts of course, the orangepi pc does have
all 3 controllers routed directly to the outside.

>> +
>> +&ohci2 {
>> +       status = "okay";
>> +};
>
> According to the schematics, this port is never used. Please remove.

The same goes for ehci2 then, otherwise ack.

>
>> +&ohci3 {
>> +       status = "okay";
>> +};
>
> This is connected to the GL830 USB-SATA bridge. Again, OHCI isn't
> needed.

My bad again.

>> +
>>   &uart0 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&uart0_pins_a>;
>>          status = "okay";
>>   };
>> +
>> +&usbphy {
>> +       status = "okay";
>
> And what about power supplies / regulators?

On the orangepi pc none are needed. Jens can you test this
series (or my sunxi-wip kernel branch) on your orangepi plus ?

and send an updated version of this patch with the necessary changes?

I do not actually have an orangepi plus.

Regards,

Hans
