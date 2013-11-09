From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCHv0] hwmon: Add support for GMT G751 Temp. Sensor and Thermal
 Watchdog
Date: Sat, 09 Nov 2013 08:55:36 -0800
Message-ID: <527E6908.2000703@roeck-us.net>
References: <87ob5uv5bv.fsf@natisbad.org> <527D9286.4080009@roeck-us.net> <87siv5bmcp.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87siv5bmcp.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/09/2013 07:56 AM, Arnaud Ebalard wrote:
> Hi,
>
> Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> writes:
>
>> On 11/08/2013 03:31 PM, Arnaud Ebalard wrote:
>>>
>>> This patch adds support for GMT G751 Temperature Sensor and Thermal
>>> Watchdog I2C chip. It has been tested via DT on a Netgear ReadyNAS
>>> 2120 (Marvell Armada XP based ARM device).
>>>
>>> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
>>
>> Arnaud,
>>
>> unless I am missing something, this is just an lm75 with a different
>> name.
>
> Sadly (for me), you are not: I compared the GMT G751 datasheet to an
> original (1996) National semiconductor LM75 datasheet and they are
> identical. I mean both the structure and full content (text, diagrams,
> etc) is the same. Lesson learned: next time I start a driver, I will ask
> if it ressembles an existing supported chip beforehand.
>

Hi Arnaud,

that is interesting; I thought it is Yet Another Clone, not really exactly
the same chip.

>> Please use the lm75 driver and add the g751 parameters to it.
>
> I will test if the driver does indeed work as expected to drive the G751
> and will send a patch to document compatibility w/ GMT G751 (Kconfig,
> i2c_device_id struct and lm75_detect function). While I am at it, if you
> see something in the patch I pushed which could be useful for current
> lm75 driver (doc, sysfs, of_ part for polarity, ...), just tell me.
>

Depends on what you need. The fault_queue and mode sysfs attributes are neither
necessary nor  acceptable - hwmon has well defined attributes, and new ones
are only added after discussion. If you _need_ to configure polarity,
interrupt mode, or fault queue depth in your application to anything but
the default, we might discuss adding those as devicetree properties.
However, you would have to make sure that it does not negatively affect
the other chips supported by the driver, and we should then discuss
if other properties should be supported as well. Overall, I strongly suspect
that the HW is happy with the default configuration. If so, we should just leave
it alone.

Power control (the shutdown attribute) should be handled through the PM
subsystem; see CONFIG_PM / CONFIG_PM_SLEEP in other drivers. If your hardware
can sleep (which may be somewhat unlikely for a NAS), you could add support
for it to the driver. That is the one improvement I could think of that
might make sense.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
