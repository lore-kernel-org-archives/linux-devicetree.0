From: George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>
Subject: Re: [PATCH] dts: cubox: Map gpio-keys and pps-gpio to gpio3 8
Date: Mon, 16 Mar 2015 15:33:49 -0600
Message-ID: <CAHKv19CYD59Ssf6LMyh8K12_5tGLq+yX=sNXWyvU0fPo3JN57g@mail.gmail.com>
References: <1426538201-7571-1-git-send-email-george.joseph@fairview5.com>
	<20150316205004.GO8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316205004.GO8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kern." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 2:50 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Mon, Mar 16, 2015 at 02:36:41PM -0600, George Joseph wrote:
>> The Cubox has a recessed button between the HDMI and RJ-45 connectors
>> that wasn't mapped in the device tree.  Since the button is normally
>> open and there's no external pull up/down, that pad (EIM_DA8) can be
>> used for almost anything so I've mapped it to gpio-keys BTN_0 and
>> pps-gpio.  Whichever driver claims it first wins.  If both drivers
>> are build as modules, you can even switch between them at run time
>> and the pinmux will adjust the pin configuration as required.
>> If neither driver claims the gpio, it's still available in the normal
>> gpio sysfs.
>
> I wonder why we want to have the PPS support in mainline, given that
> you would need to solder to the board to make use of that.  I can see
> the point of the gpio-keys going into mainline, but not the PPS bit.
> That's more like a local hack.
>

Well, it was just one less thing I'd have to patch locally for so I
took a chance. :)    I'll remove the pps bits and resubmit.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
