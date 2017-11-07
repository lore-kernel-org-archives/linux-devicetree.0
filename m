From: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Subject: Re: [PATCH 1/1] add rgb888 pins to a20 to enable parallel rgb LCD
Date: Tue, 7 Nov 2017 17:38:55 +0100
Message-ID: <65694f1d-e1cb-08e0-0883-f0087f5e09f5@micronovasrl.com>
References: <1510058999-6778-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171107130331.4wut5g6znzakkg4z@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107130331.4wut5g6znzakkg4z@flea>
Content-Language: it
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Board could be any with A20,
for example Olinuxino A20.
Or our Q027, S027 boards, but final dts still are not complete.

-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale € 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

Il 07/11/2017 14:03, Maxime Ripard ha scritto:
> On Tue, Nov 07, 2017 at 01:49:59PM +0100, Giulio Benetti wrote:
>> On sun7i-a20-* there's no way to enable PA00--PA27 as RGB888 LCD0 pins.
>>
>> Add lcd_rgb888_pins in sun7i-a20.dtsi.
>>
>> It can be used on sun7i-a20-olinuxino-lime.dts.
>> This patch gives possibility to set parallel lcd pins for RGB888.
>> To be used with tcon0 in your <target>.dts
> 
> My question was on which board do you want to use it right now. If the
> answer is none, then we won't merge that patch, we have too many
> pinctrl already to not add the unused ones.
> 
> Maxime
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
