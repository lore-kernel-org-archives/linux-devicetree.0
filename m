From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi working
Date: Tue, 15 Jul 2014 14:59:14 +0200
Message-ID: <53C525A2.8080609@kpanic.de>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de> <1405338655-18415-3-git-send-email-sassmann@kpanic.de> <20140714120051.GF6800@sirena.org.uk> <53C3C77F.7080208@kpanic.de> <20140714181338.GR6800@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140714181338.GR6800-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14.07.2014 20:13, Mark Brown wrote:
> On Mon, Jul 14, 2014 at 02:05:19PM +0200, Stefan Assmann wrote:
>> On 14.07.2014 14:00, Mark Brown wrote:
>
>>> No, you need to implement clocks using the clock API.  Please read the
>>> changelogs for the above commits...
>
>> Yes, that's what I expected. Got any pointers for me how to do this?
>> Never done that before, a little help would be appreciated.
>
> There should be plenty of examples in drivers/clk?

Looking at this more closely it seems to me that it's a regulator thing
after all. In the end it all boils down to a single register write.
twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER, 0x41, 0x8e);
This is a write to the CLK32KG_CFG_STATE [1] register to power on the
device.

I tried moving that to omap4xxx_dt_clk_init() but that won't work
because the twl core structures aren't initialized yet.

Any suggestions?

   Stefan

[1] http://www.cjemicros.f2s.com/public/datasheets/TWL6030_Register_Map.pdf page 196
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
