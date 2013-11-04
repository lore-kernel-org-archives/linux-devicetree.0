From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Mon, 04 Nov 2013 13:31:07 +0100
Message-ID: <1563443.xGyilxtfIn@amdc1227>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <25161583.XICaeMWvPh@flatron> <2443024.JdDKnfkC18@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <2443024.JdDKnfkC18@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 04 of November 2013 10:28:49 Arnd Bergmann wrote:
> On Monday 04 November 2013 00:26:29 Tomasz Figa wrote:
> > 
> > Aha, one more thing. As it was mentioned on ARM Mini Summit, as a long 
> > term goal, we will eventually have to introduce another validation tool 
> > that checks device drivers against device tree bindings. We should keep 
> > this in mind when considering schema design.
> 
> Incidentally I have just had an idea for a new driver-level API that
> should let us do this much easier. I hope to find some time in the
> next few days to come up with draft kernel patches. If you don't hear
> back from me soon but want to work on validating the drivers against
> the bindings, please contact me again.

I'd prefer to focus on the schema language itself and tools for DTS
validation. However the former needs driver validation to be considered
as well and that's why I mentioned it.

> 
> The basic idea is to extend 'devres' to automatically register
> all the resources (registers, irq, dma, gpio, pinctrl, clk, regulator, ...)
> and simple properties before the ->probe() callback is even called,
> based on a per-driver data structure that describes them, and that
> can be easily parsed by an external tool.

That would be nice and may even be helpful for solving the
dependency/deferred probe hell (or at least optimizing probe deferring).

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
