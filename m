From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun6i-a31-app4-evb1.dts: Use sunxi-common-regulators.dtsi
Date: Fri, 09 May 2014 11:32:02 +0200
Message-ID: <536CA092.50300@free-electrons.com>
References: <1399624987-12381-1-git-send-email-hdegoede@redhat.com> <536C97FD.3070906@free-electrons.com> <536C9A53.2060302@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBFGBWKNQKGQEEXILVXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <536C9A53.2060302-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 09/05/2014 11:05, Hans de Goede wrote:
> Hi,
>
> On 05/09/2014 10:55 AM, Boris BREZILLON wrote:
>> On 09/05/2014 10:43, Hans de Goede wrote:
>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/sun6i-a31-app4-evb1.dts | 8 +-------
>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
>>> index 270ab97..2bbf886 100644
>>> --- a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
>>> +++ b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
>>> @@ -13,6 +13,7 @@
>>>  
>>>  /dts-v1/;
>>>  /include/ "sun6i-a31.dtsi"
>>> +/include/ "sunxi-common-regulators.dtsi"
>>>  
>>>  / {
>>>  	model = "Allwinner A31 APP4 EVB1 Evaluation Board";
>>> @@ -49,15 +50,8 @@
>>>  	};
>>>  
>>>  	reg_usb1_vbus: usb1-vbus {
>>> -		compatible = "regulator-fixed";
>>> -		pinctrl-names = "default";
>>>  		pinctrl-0 = <&usb1_vbus_pin_a>;
>>> -		regulator-name = "usb1-vbus";
>>> -		regulator-min-microvolt = <5000000>;
>>> -		regulator-max-microvolt = <5000000>;
>>> -		enable-active-high;
>>>  		gpio = <&pio 7 27 0>;
>>>  		status = "okay";
>>>  	};
>> I guess we could do the same for usb1_vbus_pin_a (keep the common
>> definition and change the allwinner,pins property).
> Hmm, what we do with other boards when the pin does not match the
> default is change the node name to something baord specific, ie
> usb1_vbus_pin_app4_evb1

Okay.
How did you decide which pins should be put in the default definitions
(the most used ones among available boards ?) ?
I'm not sure defining new pin states for each board is a good solution,
because you'll embed unneeded pin states in your DTB.
Anyway, this is your call :-).

> Which is why I did not remove the common bits from the pin,
> I did not notice you did not use a board specific name here.

Then I guess it should be fixed in the same series.
BTW, AFAIK the original patch adding support for the APP4 EVB1 board has
not been applied yet, so I think we can fix it send a v2 of this patch.

> Regards,
>
> Hans
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
