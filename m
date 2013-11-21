From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 18:19:00 +0000
Message-ID: <20131121181900.GA24619@srcf.ucam.org>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <20131115175241.GB27174@quad.lixom.net>
 <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
 <20131121162944.F087FC406A3@trevor.secretlab.ca>
 <20131121175822.GA9590@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131121175822.GA9590-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 09:58:22AM -0800, Olof Johansson wrote:
> On Thu, Nov 21, 2013 at 04:29:44PM +0000, Grant Likely wrote:
> > We are pushing a lot of boundaries and doing things on ACPI that have
> > never been done before. SPI, GPIOs, Clocks, Regulators, composite
> > devices, key-value properties. All brand new territory, and the Linux
> > world is driving a lot of it.
> 
> This is a bit of a surprise and a significant concern.
> 
> The whole point behind ACPI is that it's supposed to abstract away nearly
> all of that, and _not_ expose clocks, regulators and other things to
> the kernel. If we're going to expose it, then we might as well go all
> the way and do it with DT.

ACPI is able to ignore most of this because ACPI has (traditionally) 
been aimed at well-defined platforms. ACPI 5 adds some amount of support 
for GPIOs, but beyond that there's nothing in the spec that lets you 
expose this data.

This is, obviously, a problem. The current solution is to add DT values 
to ACPI, allowing us to continue using ACPI for device discovery and 
allowing vendors to provide platform-specific ACPI methods. There's an 
argument that in that case you might as well just use DT for device 
discovery as well and skip ACPI entirely. I'm having trouble coming up 
with strong counterarguments.

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
