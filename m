From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: mach-ux500|nomadik|u300: Align to common DT bindings
 for mmci
Date: Fri, 14 Mar 2014 08:27:17 +0100
Message-ID: <CAPDyKFrw092mbirDBffF6TraUoXDLh5movp_sf9PYERG88P-Qw@mail.gmail.com>
References: <1394713963-18300-1-git-send-email-ulf.hansson@linaro.org>
	<20140313174703.GO21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140313174703.GO21483-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13 March 2014 18:47, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Mar 13, 2014 at 01:32:43PM +0100, Ulf Hansson wrote:
>> As the first step in preparing the mmci driver for converting to the
>> mmc_of_parse API, let's align to the common names of DT bindings for
>> the mmc/sd highspeed modes.
>
> NAK.  These bindings have been documented as being there since March
> 14th 2012, and therefore need to be supported for ever by the driver.
> You can _augment_ the bindings with the generic ones, and change the
> DT files, but you can't remove the parsing of the old property names.

I was kind of expecting this response. :-)

So, since we made a mistake about adding these DT bindings we are now
unable to remove them, is there really no way back?

In this particular case, I am confident that it should be safe to
remove them, but I guess this is more matter of principle, right?

Kind regards
Ulf Hansson

>
> --
> FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
> improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
