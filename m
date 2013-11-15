From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: ACPI vs DT at runtime
Date: Thu, 14 Nov 2013 17:44:10 -0800
Message-ID: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The more I start to see early UEFI/ACPI code, the more I am certain
that we want none of that crap in the kernel. It's making things
considerably messier, while we're already very busy trying to convert
everything over and enable DT -- we'll be preempting that effort just
to add even more boilerplate everywhere and total progress will be
hurt.

The server guys really want UEFI for their boot protocols,
installation managers, etc, etc. That's fine, let them do that, but
that doesn't mean we need to bring the same APIs all the way into the
kernel.

So, I'm strongly urging that whatever the server guys try to do, it
will in the end result in the ACPI data being translated into DT
equivalents, such that the kernel _only_ needs to handle data via DT.

Just like PowerPC scrapes the OpenFirmware client interface to build a
flat device tree, we should add a pre-boot stage that scrapes
ACPI/UEFI data and constructs an appropriate device-tree. We can still
bring over ACPI methods and represent those in the DT, but we should
_not_ have two native interfaces.

It might be done via having a skeleton/framework DT for the vendor
platform that is updated via UEFI/ACPI data, or it might be
constructed entirely out of tables coming from firmware. I don't care
about the methods for how it is done, but I do feel strongly that we
should _not_ introduce a second API for everything. I can't think of a
single good reason to do it.


[There, commence centithread]

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
