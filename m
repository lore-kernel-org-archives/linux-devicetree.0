From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH 2/6] ARM: dts: sun7i: Enable USB DRC on
 Bananapi
Date: Tue, 29 Sep 2015 10:26:37 +0200
Message-ID: <560A4B3D.4040007@redhat.com>
References: <1442928966-6418-1-git-send-email-hdegoede@redhat.com>
 <1442928966-6418-2-git-send-email-hdegoede@redhat.com>
 <20150929080453.GN7104@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150929080453.GN7104@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 29-09-15 10:04, Maxime Ripard wrote:
> On Tue, Sep 22, 2015 at 03:36:01PM +0200, Hans de Goede wrote:
>> Enable the otg/drc usb controller on the Bananapi.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Applied all the other patches but this one.

Thanks, seems you did not push this to your git.kernel.org repo though ?

> Since we dropped the patch adding the regulators support on the
> Bananapi until we figure out why the board crash, it doesn't compile
> anymore.

How about me doing a v2 of the regulators patch which removes the

&cpu0 {
         cpu-supply = <&reg_dcdc2>;
};

So that we do not get cpu voltage scaling, then the regulator
changes should be a NOP, everything should just keep the u-boot
set voltages, and we can enable oth support.

And then when we've figured out a safe way to enable cpu voltage
scaling we can do so with a follow up patch ?

Is that a plan ? If so say yes and I'll do a v2 of these patches :)

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
