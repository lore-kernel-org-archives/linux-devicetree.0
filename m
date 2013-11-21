From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 19:33:02 +0100
Message-ID: <201311211933.03106.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com> <20131121162944.F087FC406A3@trevor.secretlab.ca> <20131121175822.GA9590@quad.lixom.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131121175822.GA9590-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 21 November 2013, Olof Johansson wrote:
> On Thu, Nov 21, 2013 at 04:29:44PM +0000, Grant Likely wrote:
>
> > We are pushing a lot of boundaries and doing things on ACPI that have
> > never been done before. SPI, GPIOs, Clocks, Regulators, composite
> > devices, key-value properties. All brand new territory, and the Linux
> > world is driving a lot of it.
> 
> This is a bit of a surprise and a significant concern.
> 
> The whole point behind ACPI is that it's supposed to abstract away nearly
> all of that, and not expose clocks, regulators and other things to
> the kernel. If we're going to expose it, then we might as well go all
> the way and do it with DT.

I think you are talking about different things here: Grant's example was
about embedded x86 adding these so they can reuse the kernel infrastructure
we already have without changing their entire firmware, which I think is
fine, but he also said in the past that we wouldn't have that on PC-style
ARM servers. Other people are pushing for that though (for SoC-style
ARM servers I suppose), as Russell mentioned earlier.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
