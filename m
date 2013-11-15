From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: UEFI Clock
Date: Thu, 14 Nov 2013 18:23:59 -0800
Message-ID: <CAOesGMhWoR+8GbiubpSBPqLQ=vQunvUz1Nz+Xgg3gSHrrFNdXA@mail.gmail.com>
References: <CAPw-ZTnPecp+VYfn5yukrpFNk5sCr5LVDNFty0sLhY=NNhNkXg@mail.gmail.com>
	<CAOesGMifEvRJuYXB6XtJ==OLmdqXezdF0uv5Gr0s9Wqw7ytg_w@mail.gmail.com>
	<5815991615939825395@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5815991615939825395@unknownmsgid>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[switched to correct devicetree list, even though this is all ACPI discussion]

On Thu, Nov 14, 2013 at 6:19 PM, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org> wrote:
> Hi,
>
> For the acpi, is that part of the acpi framework? If so, can you point
> me to the location of the code for reference?

Please don't top post replies when someone else has taken the time to
post a reply in-line. It's bad form for kernel mailing lists.

Sorry for being vague in my initial email -- I did mean to say that
most power management such as moving devices to standby modes is done
through ACPI calls on x86, I believe -- I.e. D0-D2,D3hot/D3cold is
handled through ACPI. I don't know if there's more fine-grained
runtime clock control done today.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
