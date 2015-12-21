From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH 0/5] ARM: dts: sunxi: Add backlight node
 to q8 tablets
Date: Mon, 21 Dec 2015 13:59:59 +0100
Message-ID: <5677F7CF.3050308@redhat.com>
References: <1442752251-20744-1-git-send-email-hdegoede@redhat.com>
 <fc4adcf5-4362-4d4c-b42e-729922c79f65@googlegroups.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBVXP36ZQKGQEMY6GWDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <fc4adcf5-4362-4d4c-b42e-729922c79f65-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Silvio Pellicano <8001010-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 21-12-15 11:56, Silvio Pellicano wrote:
>
>
>> Here is a slightly updated version of Chen-Yu's backlight
>> patches, also adding support for the backlight found on A13
>> based q8 tablets.
>>
>
> If i compile your dtsi with (obviously) pwm  support enable , backlight
> switch off after kernel start,
> if i disable pwm in menuconfig,it stay on, all seem correct (pwm on PB2 in
> original script.bin),
> but there is somewhere a bug in pwm or dtsi description of backlight.

No there is not, if you enable the pwm driver you must also enable
the backlight-pwm driver / add CONFIG_BACKLIGHT_PWM=y to your .config
(and make sure it stays that way after a "make oldconfig").

Regards,

Hans
