From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun7i: Add OOB irq support to
 boards with broadcom sdio wifi
Date: Sun, 08 Mar 2015 20:19:33 +0100
Message-ID: <54FCA0C5.6000400@redhat.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com> <1425754884-7875-6-git-send-email-hdegoede@redhat.com> <20150308172501.GG5085@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBS6B6KTQKGQENQADQPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150308172501.GG5085@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08-03-15 18:25, Maxime Ripard wrote:
> On Sat, Mar 07, 2015 at 08:01:23PM +0100, Hans de Goede wrote:
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun7i-a20-cubietruck.dts | 11 +++++++++++
>>   arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts  | 11 +++++++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
>> index 0c219a4..8111b0c 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
>> @@ -167,12 +167,23 @@
>>   };
>>
>>   &mmc3 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>
> Aside from Chen-Yu's comments, that should be in the DTSI.
>
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&mmc3_pins_a>;
>>   	vmmc-supply = <&reg_vmmc3>;
>>   	bus-width = <4>;
>>   	non-removable;
>>   	status = "okay";
>> +
>> +	brcmf: bcrmf@1 {
>> +		reg = <1>;
>> +		compatible = "brcm,bcm4329-fmac";
>> +		interrupt-parent = <&pio>;
>> +		interrupts = <10 8>; /* PH10 / EINT10 */
>
> And you can use interrupts-extented here (not that I really care much,
> both solutions works for me).

What is interrupts-extended / does interrupts-extended do ?

Ah, found it, Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
says:

The "interrupts-extended" property is a special form for use when a node needs
to reference multiple interrupt parents. Each entry in this property contains
both the parent phandle and the interrupt specifier. "interrupts-extended"
should only be used when a device has multiple interrupt parents.

   Example:
         interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;

So since we do not need multiple interrupt parents here, "interrupts = "
seems to be the better syntax to use, I'll do a new version fixing
ChenYu's comments and moving the #foo-cells to the dtsi.

Thanks for merging the other patches, and for the review.

Regards,

Hans
