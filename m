From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: mach-ux500|nomadik|u300: Align to common DT bindings
 for mmci
Date: Fri, 14 Mar 2014 11:58:53 +0100
Message-ID: <CACRpkdZzObyJQmbAvovcor9NXeVnhEFO82jtxLZOdm48TPnudQ@mail.gmail.com>
References: <1394713963-18300-1-git-send-email-ulf.hansson@linaro.org>
	<20140313174703.GO21483@n2100.arm.linux.org.uk>
	<CAPDyKFrw092mbirDBffF6TraUoXDLh5movp_sf9PYERG88P-Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFrw092mbirDBffF6TraUoXDLh5movp_sf9PYERG88P-Qw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 8:27 AM, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 13 March 2014 18:47, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>> On Thu, Mar 13, 2014 at 01:32:43PM +0100, Ulf Hansson wrote:
>>> As the first step in preparing the mmci driver for converting to the
>>> mmc_of_parse API, let's align to the common names of DT bindings for
>>> the mmc/sd highspeed modes.
>>
>> NAK.  These bindings have been documented as being there since March
>> 14th 2012, and therefore need to be supported for ever by the driver.
>> You can _augment_ the bindings with the generic ones, and change the
>> DT files, but you can't remove the parsing of the old property names.
>
> I was kind of expecting this response. :-)
>
> So, since we made a mistake about adding these DT bindings we are now
> unable to remove them, is there really no way back?
>
> In this particular case, I am confident that it should be safe to
> remove them, but I guess this is more matter of principle, right?

I can guarantee that there are no deployed U300, Nomadik or
Ux500 systems out there with DTBs deployed in them, and
for certain no products. At one point that was the criterion...
All setups actually use the appended device tree.

In worst case I guess mmc-cap-sd-highspeed and
mmc-cap-mmc-highspeed could be put as aliases into the
generic parser?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
