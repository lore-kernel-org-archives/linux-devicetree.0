From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] mfd: tc3589x: detect the precise version
Date: Fri, 18 Oct 2013 11:36:54 +0200
Message-ID: <CACRpkdZ1oZuJWA+S4hY0VDYaGi19Rcn=xSYYUDak7xc+iXB4fA@mail.gmail.com>
References: <1381871640-22262-1-git-send-email-linus.walleij@linaro.org>
	<20131016092310.GD19112@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016092310.GD19112@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 16, 2013 at 11:23 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 15 Oct 2013, Linus Walleij wrote:

>>  static const struct i2c_device_id tc3589x_id[] = {
>> -     { "tc3589x", 24 },
>> +     { "tc35890", TC3589X_TC35890 },
>> +     { "tc35892", TC3589X_TC35892 },
>> +     { "tc35893", TC3589X_TC35893 },
>> +     { "tc35894", TC3589X_TC35894 },
>> +     { "tc35895", TC3589X_TC35895 },
>> +     { "tc35896", TC3589X_TC35896 },
>> +     { "tc3589x", TC3589X_UNKNOWN },
>>       { }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, tc3589x_id);
>
> This is an awful lot of code for what we're trying to achieve.

I am not only trying to achive setting the number of GPIOs right,
I want the system to be aware of exactly which version of the chip
it is dealing with because they all have subtle differences, and
people will run into this in the future when adding more features.
http://www.toshiba-components.com/mobile/data/General_Presentation_IO_Expander_www_Jan_2012.pdf
See table on p.14 for example.

>   1. I guess that other OSes will need to capture the same
>   information, so wouldn't it be prudant to do so via a DT property?
>   That way it's just a one or two liner.

This patch is not about Device Tree. It is about probing from
the device name.

>   2. As we're only using .driver_data for num_gpio at this time, just
>   place them in tc3589x_id as you have done for tc3589x.

This doesn't scale to the other pecularities that differ and I
then just push the problem onto the next person dealing with
this chip.

>   3. Again, as all of this extra code is only used for pulling out
>   num_gpio, group the devices by num_gpio:
>
>> +     switch (id->driver_data) {
>> +     case TC3589X_TC35893:
>> +     case TC3589X_TC35895:
>> +     case TC3589X_TC35896:
>> +             tc3589x->num_gpio = 20;
>> +             break;
>> +     case TC3589X_TC35890:
>> +     case TC3589X_TC35892:
>> +     case TC3589X_TC35894:
>> +     case TC3589X_UNKNOWN:
>> +     default:
>> +             tc3589x->num_gpio = 24;
>> +             break;
>> +     }

This I can do. The switch tree can then be extended as need
be in the future.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
