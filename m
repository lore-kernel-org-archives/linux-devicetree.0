From: jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org
Subject: Re: [PATCH v4 1/1] iio:pressure: initial zpa2326 barometer support
Date: Tue, 13 Sep 2016 09:52:31 +0100
Message-ID: <0ebc56794afc97cf31782ccb6225446f@jic23.retrosnub.co.uk>
References: <cover.1473432897.git.gregor.boirie@parrot.com>
 <68c225245eb4f4972f5acaa56bdbf9d25971f0f7.1473432897.git.gregor.boirie@parrot.com>
 <d6122349-5e8c-6708-b5af-a38f9e8bb898@kernel.org>
 <57D7B0F1.6030607@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57D7B0F1.6030607-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vlad Dogaru <ddvlad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ludovic Tancerel <ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Crestez Dan Leonard <leonard.crestez-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13.09.2016 08:55, Gregor Boirie wrote:
> Hi,
> 
> On 09/10/2016 05:37 PM, Jonathan Cameron wrote:
>> On 09/09/16 16:01, Gregor Boirie wrote:
>>> Introduce driver for Murata ZPA2326 pressure and temperature sensor:
>>> http://www.murata.com/en-us/products/productdetail?partno=ZPA2326-0311A-R
>>> 
>>> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>> This looks pretty good to me now.  A few minor bits and bobs inline.
>> 
>> I almost took it as is, but would like to have it sit on the list
>> in it's current form for a few more days anyway so might as well get
>> these few corners tidied up!
> [...]
>> 
>> +/*
>> + * Debugfs stuff
>> + *
>> + * We want to prevent debugfs hooks from altering configuration while 
>> chip
>> + * sampling is ongoing to preserve data consistency. Moreover, a few 
>> registers,
>> + * when read, change hardware state, e.g. interrupt acknowlege on 
>> read. This is
>> + * why debugfs read and write hooks acquire exclusive access to 
>> register space.
>> + *
>> + * Also note this is mostly unusable with power management enabled 
>> systems since
>> + * registers content is lost during power off -> on transitions.
>> + */
>> It would be nice perhaps to tighten up the range of addresses that
>> we are protecting.  Thus allow reading of any addresses that are not
>> 'fragile'.  Only supported limited debug access is hardly a big
>> issue however ;)
> Quite frankly, I wonder if this debugfs stuff should not be thrown
> away given that
> regmap already provides a way to access registers over debugfs (with
> very limited
> protection...).
> What do you think ?
> 
> [...]
Agreed. Bin it.
> 
> Regards,
> Grégor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
