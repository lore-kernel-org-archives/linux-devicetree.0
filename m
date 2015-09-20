From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 5/5] ARM: dts: sun5i: Add backlight node
 to sun5i-q8-common.dtsi
Date: Sun, 20 Sep 2015 11:14:00 -0400
Message-ID: <55FECD38.9010503@redhat.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <1442752251-20744-6-git-send-email-hdegoede@redhat.com>
 <CAGb2v66Bg60p8T3dzF6ymo-rTEMK4yUVZsuaOjCXapPBQRn6eg@mail.gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQM27OXQKGQEVVKA5GI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v66Bg60p8T3dzF6ymo-rTEMK4yUVZsuaOjCXapPBQRn6eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 09/20/2015 10:46 AM, Chen-Yu Tsai wrote:
> On Sun, Sep 20, 2015 at 8:30 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> All A13 based q8 formfactor tablets use the same backlight setup, add
>> a backlight devicetree node for controlling the backlight on these devices.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun5i-q8-common.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun5i-q8-common.dtsi b/arch/arm/boot/dts/sun5i-q8-common.dtsi
>> index 0641d68..76a5204 100644
>> --- a/arch/arm/boot/dts/sun5i-q8-common.dtsi
>> +++ b/arch/arm/boot/dts/sun5i-q8-common.dtsi
>> @@ -41,11 +41,22 @@
>>    */
>>   #include "sunxi-q8-common.dtsi"
>>
>> +#include <dt-bindings/pwm/pwm.h>
>> +
>>   / {
>>          aliases {
>>                  serial0 = &uart1;
>>          };
>>
>> +       backlight: backlight {
>> +               compatible = "pwm-backlight";
>> +               pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
>> +               brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
>> +               default-brightness-level = <8>;
>> +               /* TODO: backlight uses axp gpio1 as enable pin */
>> +               /* TODO: backlight is powered by AXP209 DCDC1SW */
>
> There's no DCDC1SW on AXP209. The reference design shows the backlight
> regulator is powered directly from IPSOUT,

Ah, right, I'll do a v2 dropping this comment line.

 > but the PWM pullup is powered
> by LCD-VCC,  which itself is enabled by AXP209 GPIO0.
>
> Would that be the case, or maybe closer, given we don't have schematics?

gpio0 needs to be driven high to get the backlight to lite up, that
is pretty much all I know.

Regards,

Hans
