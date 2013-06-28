From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 3/4] hwmon: Add a simple driver to read the MXS SoC temperature
Date: Fri, 28 Jun 2013 17:24:43 +0200
Message-ID: <51CDAABB.4020505@metafoo.de>
References: <1372236673-20725-1-git-send-email-alexandre.belloni@free-electrons.com> <1372236673-20725-4-git-send-email-alexandre.belloni@free-electrons.com> <20130626143927.GB31998@roeck-us.net> <20130627091732.GP5803@lukather> <20130627142758.GA5812@roeck-us.net> <51CC91E8.50605@free-electrons.com> <51CD9B19.90407@metafoo.de> <51CDA2BF.5050501@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CDA2BF.5050501-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, jimwall@q.com, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/28/2013 04:50 PM, Alexandre Belloni wrote:
> On 28/06/2013 16:18, Lars-Peter Clausen wrote:
>> On 06/27/2013 09:26 PM, Alexandre Belloni wrote:
>>>
>>> They are already registered as IIO_TEMP but only implement read_raw. Also,
>>>
>>> iio_hwmon_read_val() is using iio_read_channel_processed() and that will
>>> basically only read one of the 2 channels. As I documented, you actually
>>> need to read both channel 8 and channel 9 and then compute the value in
>>> Kelvins. I'm not sure how you want me to do that in the current framework.
>> What are these two channels actually measuring? Is the value of a single
>> channel meaningful on it's own? If not it might make sense to update the IIO
>> driver to just have one temperature channel.
> 
> It's not actually meaningful on its own. So, what you would do is expose
> one iio channel for two ADC channels and do the computation in read_raw
> ? or read_processed ? Then using iio-hwon to export it. ?
> 
> Regards,
> 

Yes, return channel9 - channel8 as the raw value for the temperature channel
and provide proper scale and offset values, so that
iio_read_channel_processed() will return the correct value.

- Lars
