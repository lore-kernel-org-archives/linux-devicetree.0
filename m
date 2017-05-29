From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: sun8i: v3s: add backlight device
 node for Lichee Pi Zero LCD
Date: Mon, 29 May 2017 16:16:51 +0800
Message-ID: <CAGb2v66X2mAiEVnsj_aE8RV7DdRa_Pe41E-O-GOPe-+cjiw4PA@mail.gmail.com>
References: <20170524121320.4171-1-icenowy@aosc.io> <20170524121320.4171-3-icenowy@aosc.io>
 <20170529074117.x7pm2k2lbznl2n5j@flea.home>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBC5SV7EQKGQEIK5H6RQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170529074117.x7pm2k2lbznl2n5j-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 3:41 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Wed, May 24, 2017 at 08:13:20PM +0800, Icenowy Zheng wrote:
>> The 40-pin LCD connector on Lichee Pi Zero has backlight pins, which is
>> controlled by the PWM0 controller of the V3s SoC, and the controlling
>> part is on the board.
>>
>> Add the PWM and backlight device nodes in the device tree file, but
>> leave them disabled, as they can only be useful when the LCD is
>> attached. The LCD device tree overlay files can enable these controllers
>> and make use of them.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
>> index 387fc2aa546d..e0721bf725d1 100644
>> --- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
>> +++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
>> @@ -52,6 +52,14 @@
>>               serial0 = &uart0;
>>       };
>>
>> +     backlight: backlight {
>> +             compatible = "pwm-backlight";
>> +             pwms = <&pwm 0 50000 0>;
>> +             brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
>
> This is unlikely, the perceived brightness by the human eye is not
> linear, and is actually much closer to a logarithmic function, which
> means you should have use an exponential function here in order to
> appear that your brightness increase is linear.

I think the backlight is a functional part of the panel. It probably
belongs in the panel's overlay.

ChenYu
