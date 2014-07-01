From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dts: sun7i: Add board support for
 LinkSprite pcDuino V3
Date: Tue, 01 Jul 2014 09:12:32 +0200
Message-ID: <53B25F60.2050704@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com> <1404165479-23785-7-git-send-email-hdegoede@redhat.com> <CAGb2v65mDnuwveUiTKU2J3b3jbNzRLvPjS+wXNEj2MRtDN4Q2w@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB3N6ZGOQKGQER3PGRFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v65mDnuwveUiTKU2J3b3jbNzRLvPjS+wXNEj2MRtDN4Q2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 07/01/2014 04:22 AM, Chen-Yu Tsai wrote:
> On Tue, Jul 1, 2014 at 5:57 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> From: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
>>
>> The LinkSprite pcDuino V3 is an A20 based development board featuring
>> arduino compatible io headers, 1G RAM, 4G nand, sata, rtl8188cus usb wifi
>> and 100 Mbit ethernet using an ip101a phy:
>>
>> http://www.pcduino.com/pcduino-v3/
>>
>> Signed-off-by: Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>
>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Various cleanups, correct led pins]
>> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Add axp209, ir and gpio-keys nodes]
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> --
>>
>> Changes since v2:
>>  - update MMC entry to comply with upstream
>>  - unify the 4 patches into one
>>
>> Changes since v1:
>>  - fix cosmetic issues
>>  - fix i2c entry
>>  - remove unnecessary input bindings include
>>  - add MMC support
>> ---
>>  arch/arm/boot/dts/Makefile               |   3 +-
>>  arch/arm/boot/dts/sun7i-a20-pcduino3.dts | 173 +++++++++++++++++++++++++++++++
>>  2 files changed, 175 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/sun7i-a20-pcduino3.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index ed0de8b..fdc590e 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -380,7 +380,8 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>>         sun7i-a20-cubieboard2.dtb \
>>         sun7i-a20-cubietruck.dtb \
>>         sun7i-a20-i12-tvbox.dtb \
>> -       sun7i-a20-olinuxino-micro.dtb
>> +       sun7i-a20-olinuxino-micro.dtb \
>> +       sun7i-a20-pcduino3.dtb
> 
> You may need to rebase onto my sun8i ippo-q8h dts patch.
> 
>   https://patchwork.kernel.org/patch/4389951/
> 
> There's a likely conflict in the Makefile here.

Has that one already been accepted by Maxime ? I'm fine rebasing patches
on top of accepted stuff, but rebasing on pending stuff is not really
useful IMHO.

Regards,

Hans
