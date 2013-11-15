From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Fri, 15 Nov 2013 21:58:32 +0100
Message-ID: <201311152158.32644.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 15 November 2013, Olof Johansson wrote:
> So, I'm strongly urging that whatever the server guys try to do, it
> will in the end result in the ACPI data being translated into DT
> equivalents, such that the kernel only needs to handle data via DT.

I don't think that a translation layer is the answer, I see the problem
more in things that cannot be translated automatically. The parts that
are similar enough to allow translation could also just be handled by
a thin abstraction layer in the kernel, which I think we will see
on embedded x86 with DT-in-ACPI-syntax.

I think we can still treat ACPI on ARM64 as a beginner's mistake and
provide hand-written DT blobs for the few systems that start shipping
with that. The main reason for doing it in the first place was the
expected number of Windows RT servers, but WinRT isn't doing well
at the moment, so it's not unreasonable to assume it's going the same
way as WinRT tablets.

During the kernel summit, Grant (as one of the proponents of doing
ACPI on ARM) already mentioned that he only sees this as viable
on PC-like systems. My feeling is that when (if?) AMD or someone else
comes out with a server system where they basically replace the
x86 core with an ARM one but keep the system design, there won't
be much to describe in terms of internal components anyway, and also
no need to translate a lot of device information -- everything is
already a PCI device in that case and does not get handled through
the platform bus. However, until we see code or system-level specs
for such a system, I'd rather keep ACPI out of the ARM kernel so we
don't give people the wrong ideas.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
