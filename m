From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv1] Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 18 Nov 2013 20:24:39 +0100
Message-ID: <87ob5hldhk.fsf@natisbad.org>
References: <87txfdcjqg.fsf@natisbad.org>
	<20131118152012.GA3759@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118152012.GA3759-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org> (Mark
	Rutland's message of "Mon, 18 Nov 2013 15:20:12 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, Kent Yoder <key-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rob.herring@calxeda.com" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "grant.likely@linaro.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc@vger.kernel.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "rtc-linux@googlegroups.com" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

>> +static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg, u8 buf[],
>> +                                 unsigned len)
>> +{
>> +       struct i2c_msg msgs[2] = {
>> +               {
>> +                       .addr = client->addr,
>> +                       .flags = 0,
>> +                       .len = sizeof(u8),
>> +                       .buf = buf
>> +               },
>> +               {
>> +                       .addr = client->addr,
>> +                       .flags = I2C_M_RD,
>> +                       .len = len,
>> +                       .buf = buf
>> +               }
>> +       };
>> +       int ret;
>> +
>> +       BUG_ON(reg > ISL12057_REG_SR);
>> +       BUG_ON(reg + len > ISL12057_REG_SR + 1);
>> +
>> +       ret = i2c_transfer(client->adapter, msgs, 2);
>> +       if (ret != 2)
>> +               return ret;
>
> This might return 1.
>
> Given that in isl12057_rtc_read_time you check if the return value is
> negative (also indirectly via isl12057_i2c_validate_client), I think it
> would make sense to always either return a negative error code or 0.

Good catch. Will fix that and spend some more time on return paths, and
then send a v2.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
