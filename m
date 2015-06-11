From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/2] phy-sun4i-usb: Add full support for
 usb0 phy / OTG
Date: Thu, 11 Jun 2015 10:28:32 +0200
Message-ID: <557946B0.4060308@redhat.com>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com> <1433088626-8858-2-git-send-email-hdegoede@redhat.com> <55792122.20607@ti.com> <55793F41.7000304@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBNMN4WVQKGQEJJXUQVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55793F41.7000304-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: kishon-l0cyMroinI0@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11-06-15 09:56, Hans de Goede wrote:
> Hi,
>
> On 11-06-15 07:48, Kishon Vijay Abraham I wrote:
>> +Chanwoo
>>
>> Hi,
>>
>> On Sunday 31 May 2015 09:40 PM, Hans de Goede wrote:
>>> The usb0 phy is connected to an OTG controller, and as such needs some special
>>> handling:
>>>
>>> 1) It allows explicit control over the pullups, enable these on phy_init and
>>> disable them on phy_exit.
>>>
>>> 2) It has bits to signal id and vbus detect to the musb-core, add support for
>>> for monitoring id and vbus detect gpio-s for use in dual role mode, and set
>>> these bits to the correct values for operating in host only mode when no
>>> gpios are specified in the devicetree.
>>>
>>> 3) When in dual role mode the musb sunxi glue needs to know if the a host or
>>> device cable is plugged in, so when in dual role mode register an extcon.
>>>
>>> While updating the devicetree binding documentation also add documentation
>>> for the sofar undocumented usage of regulators for vbus for all 3 phys.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> Changes in v2:
>>> -Removed the sunxi specific phy functions, instead the id / vbus gpio polling
>>>   has been moved to the phy-sun4i-usb driver and their status is exported
>>>   through extcon for the sunxi-musb glue
>>> Changes in v3:
>>> -No changes
>>> Changes in v4:
>>> -Do not call regulator_disable in an unbalanced manner when an external vbus
>>>   is present
>>> ---
>>>   .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  18 +-
>>>   drivers/phy/Kconfig                                |   1 +
>>>   drivers/phy/phy-sun4i-usb.c                        | 273 ++++++++++++++++++++-
>>>   3 files changed, 281 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>> index 16528b9..557fa99 100644
>>> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
>>> @@ -23,6 +23,13 @@ Required properties:
>>>     * "usb1_reset"
>>>     * "usb2_reset" for sun4i, sun6i or sun7i
>>>
>>> +Optional properties:
>>> +- usb0_id_det-gpios : gpio phandle for reading the otg id pin value
>>> +- usb0_vbus_det-gpios : gpio phandle for detecting the presence of usb0 vbus
>>> +- usb0_vbus-supply : regulator phandle for controller usb0 vbus
>>> +- usb1_vbus-supply : regulator phandle for controller usb1 vbus
>>> +- usb2_vbus-supply : regulator phandle for controller usb2 vbus
>>> +
>>>   Example:
>>>       usbphy: phy@0x01c13400 {
>>>           #phy-cells = <1>;
>>> @@ -32,6 +39,13 @@ Example:
>>>           reg-names = "phy_ctrl", "pmu1", "pmu2";
>>>           clocks = <&usb_clk 8>;
>>>           clock-names = "usb_phy";
>>> -        resets = <&usb_clk 1>, <&usb_clk 2>;
>>> -        reset-names = "usb1_reset", "usb2_reset";
>>> +        resets = <&usb_clk 0>, <&usb_clk 1>, <&usb_clk 2>;
>>> +        reset-names = "usb0_reset", "usb1_reset", "usb2_reset";
>>> +        pinctrl-names = "default";
>>> +        pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
>>> +        usb0_id_det-gpios = <&pio 7 19 GPIO_ACTIVE_HIGH>; /* PH19 */
>>> +        usb0_vbus_det-gpios = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
>>> +        usb0_vbus-supply = <&reg_usb0_vbus>;
>>> +        usb1_vbus-supply = <&reg_usb1_vbus>;
>>> +        usb2_vbus-supply = <&reg_usb2_vbus>;
>>>       };
>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>> index a53bd5b..4614fba 100644
>>> --- a/drivers/phy/Kconfig
>>> +++ b/drivers/phy/Kconfig
>>> @@ -173,6 +173,7 @@ config PHY_SUN4I_USB
>>>       tristate "Allwinner sunxi SoC USB PHY driver"
>>>       depends on ARCH_SUNXI && HAS_IOMEM && OF
>>>       depends on RESET_CONTROLLER
>>> +    select EXTCON
>>
>> Avoid using 'select' on visible Kconfig symbols.
>
> Ok, I'll do a v5 changing this to a depends on.
>
>> Also please split the patch to make the reviewing a bit easier.
>
> There really is not much which can be split out, the iscr register
> updating is only done from the id / vbus det scanning, so the 2 are
> intertwined with each other.
>
> Also I must say I'm unhappy with the fact that you request this now,
> after this patch has been posted in its current form a long time
> ago already. The changes in v3 and v4 were very minimal, the
> patch has existed in this for since v2, so you've had a long long
> time to request changes like this already.
>
> In the mean time I've build a whole set of related changes (enabling
> the use of otg on newer versions of the sunxi soc), so sorry I'm
> not going to split this up now as that is going to be a big pain
> with all the extra patches which are sitting on top, and as said
> there really is not that much to split in the first place.
>
> I'll send out a v5 of this patch together with a resend of all the
> patches adding support for new models which sit on top of this one
> (and which I've already send before).

Correction: Since I need to rework the extcon bits for the new extcon
API in 4.2 anyways, I will split out the extcon bits, so you will
get 2 patches in v5, one adding the id / vbus det gpio scanning +
iscr register updating to reflect the detected status and one on
top adding extcon support so that the musb glue can respond
to id-pin changes.


Regards,

Hans
