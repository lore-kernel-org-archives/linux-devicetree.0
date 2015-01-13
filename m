From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: Add lradc node to sun8i-a23.dtsi
Date: Tue, 13 Jan 2015 13:32:41 +0100
Message-ID: <54B51069.3000506@redhat.com>
References: <1421146024-17957-1-git-send-email-hdegoede@redhat.com> <54B50B69.6000002@cogentembedded.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORB5NA2SSQKGQEO6QZV4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54B50B69.6000002-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 13-01-15 13:11, Sergei Shtylyov wrote:
> Hello.
>
> On 1/13/2015 1:47 PM, Hans de Goede wrote:
>
>> The A23 has the same lradc controller as previous Allwinner SoCs.
>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun8i-a23.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>
>> diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
>> index a31842d..c2ceafb 100644
>> --- a/arch/arm/boot/dts/sun8i-a23.dtsi
>> +++ b/arch/arm/boot/dts/sun8i-a23.dtsi
>> @@ -419,6 +419,13 @@
>>               interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>>           };
>>
>> +        lradc: lradc@01c22800 {
>> +            compatible = "allwinner,sun4i-a10-lradc-keys";
>
>     If this is a keyboard controller, its node name should probably be "keyboard", according to the ePAPR standard...

I'm not sure this qualifies as a keyboard controller, more over we
already have the same name in all other sun?i-a*.dtsi files, so if
we fix this it should be fixed by a follow up patch, and be fixed
everywhere.

Regards,

Hans
