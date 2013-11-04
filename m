From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Mon, 04 Nov 2013 09:37:07 -0700
Message-ID: <5277CD33.6030003@wwwdotorg.org>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org> <1432962.yW4lKnaQJE@flatron> <25161583.XICaeMWvPh@flatron> <2443024.JdDKnfkC18@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2443024.JdDKnfkC18@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/04/2013 02:28 AM, Arnd Bergmann wrote:
> On Monday 04 November 2013 00:26:29 Tomasz Figa wrote:
>>
>> Aha, one more thing. As it was mentioned on ARM Mini Summit, as a long 
>> term goal, we will eventually have to introduce another validation tool 
>> that checks device drivers against device tree bindings. We should keep 
>> this in mind when considering schema design.
> 
> Incidentally I have just had an idea for a new driver-level API that
> should let us do this much easier. I hope to find some time in the
> next few days to come up with draft kernel patches. If you don't hear
> back from me soon but want to work on validating the drivers against
> the bindings, please contact me again.
> 
> The basic idea is to extend 'devres' to automatically register
> all the resources (registers, irq, dma, gpio, pinctrl, clk, regulator, ...)
> and simple properties before the ->probe() callback is even called,
> based on a per-driver data structure that describes them, and that
> can be easily parsed by an external tool.

I had suggested that while talking to someone at the kernel summit,
basically each driver supplies functions like:

1) ACPI -> platform data or resources converter
2) DT -> platform or resources data converter
3) anything else -> platform or resources data converter
4) probe()

One of (1)..(3) (depending on device instantiation source) is called to
translate the data source to platform data or resources, before probe
(and could indeed handle much of deferred probe I suppose).

(4) is called to actually initialize the device, and always has complete
pre-parsed platform data/resources available, and does no DT/ACPI/...
parsing.

I forget who I was talking to, but it was asserted something like this
had been proposed before, and wasn't accepted. Unfortunately, I don't
entirely recall why...

It may have been due to the fact I proposed (1) and (2) above being
separate, rather than identical, due to using some unified API to read
data from ACPI and DT. That wasn't the most interesting aspect of the
proposal though. Still, I think conceptually there could be other data
sources in the future, so we may need to allow different types of
conversion function at some point, even if the ACPI and DT
implementations can end up being the same.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
