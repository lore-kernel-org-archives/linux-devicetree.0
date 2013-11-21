From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 19:26:02 +0100
Message-ID: <201311211926.03228.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <201311181605.37300.arnd@arndb.de> <20131121161037.C528CC406A3@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131121161037.C528CC406A3-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 21 November 2013, Grant Likely wrote:
> This too should look transparent to device drivers. DT and ACPI have
> different mechanism for doing cross tree references, but the concept is
> the same. A driver calling something like "platform_get_my_gpio_resource()"
> should do the right thing with either an ACPI or DT backend. None of
> that should appear as custom device driver or architecture code. It
> should be generic code supporting the driver core.

I definitely agree with the approach, and I've already made some suggestions
for how to implement parts of this. The problem is that this will touch
dozens of subsystems and hundreds of device drivers. We have the experience
of having done it all before when introducing the DT interfaces and some of
the new subsystems, which is a big advantage for doing it again, but on the
other hand there are now more drivers than we had before, and we have to
be more careful so we don't break the existing code base.

> Regardless of the ACPI on ARM question, we need to do this anyway. There
> are Intel platforms that need it.

There is certainly some overhead, but my guess is that it's actually
less than half of the total work because they are trying to do something
completely different:

- Intel are doing this only for embedded systems, so they don't have to
  worry about subsystems that are only relevant to servers (e.g. fault
  isolation)
- Significant parts of the x86 architecture are completely standardized
  and don't need to be described in a complex matter (e.g. IOMMU)
+ A number of subsystems that Intel needs to handle on embedded systems
  should really not be described in detail on servers on any architecture
  but instead be handled in AML or SMBIOS (e.g. pinctrl or phy).
+ Some subsystems won't even be used on servers and don't need to be
  handled at all but are very relevant to embedded systems (e.g. v4l or
  dmaengine)

For the parts that do overlap (e.g. irqdomain or reset), we should
certainly work together across architectures. 

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
