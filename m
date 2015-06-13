From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/20] ARM: dts: Add USB and OTG related
 nodes and enable on various boards
Date: Sat, 13 Jun 2015 15:30:50 +0200
Message-ID: <557C308A.4010104@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com> <20150608100358.GW23777@lukather> <55783B2C.3080207@redhat.com> <557ADE40.70200@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBD7B6CVQKGQEELJOXBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <557ADE40.70200-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 12-06-15 15:27, Hans de Goede wrote:
> Hi,
>
> On 10-06-15 15:27, Hans de Goede wrote:
>> Hi,
>>
>> On 08-06-15 12:03, Maxime Ripard wrote:
>>> Hi Hans,
>>>
>>> On Fri, Jun 05, 2015 at 09:02:03PM +0200, Hans de Goede wrote:
>>>> Hi Maxime,
>>>>
>>>> Here is a patch-set with all the otg / sun8i-usb-host related dts patches
>>>> I've accumulated.
>>>>
>>>> These are intended for 4.3, and go hand in hand with the outstanding
>>>> musb-sunxi / phy-sun4i-usb patches, which I expect to be merged as is
>>>> for 4.3 .
>>>
>>> I'm fine with these patches. Do you have a branch somewhere that I can
>>> pull (without the one that you wanted me to drop, obviously)?
>>
>> I've just created a branch with just these patches directly on top
>> of sunxi/for-next for you:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commits/otg-dts-for-maxime
>
> Please ignore this for now. There have been some changes to the extcon
> framework, making it more integrated with devicetree, this means I need
> to add an extcon property to the musb nodes in devicetree:
>
> --- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
> +++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
> @@ -12,6 +12,7 @@ Required properties:
>    - phys            : phy specifier for the otg phy
>    - phy-names       : must be "usb"
>    - dr_mode         : Dual-Role mode must be "host" or "otg"
> + - extcon          : extcon specifier for the otg phy
>
>   Example:
>
> @@ -23,5 +24,6 @@ Example:
>                  interrupt-names = "mc";
>                  phys = <&usbphy 0>;
>                  phy-names = "usb";
> +         extcon = <&usbphy 0>;
>                  status = "disabled";
>          };
>
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -773,6 +773,7 @@
>                          interrupt-names = "mc";
>                          phys = <&usbphy 0>;
>                          phy-names = "usb";
> +                 extcon = <&usbphy 0>;
>                          allwinner,sram = <&otg_sram 1>;
>                          status = "disabled";
>                  };
>
> I'll push a new version of the patches to otg-dts-for-maxime
> with the extcon property added for you and ping you when it is
> ready.

Done, https://github.com/jwrdegoede/linux-sunxi/commits/otg-dts-for-maxime
now contains the necessary changes and is ready for merging for 4.3.

Regards,

Hans
