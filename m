From: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 12:48:58 -0400
Message-ID: <55085AFA.7070909@redhat.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <5507332B.5020504@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5507332B.5020504-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/16/2015 03:46 PM, Peter Hurley wrote:
> On 03/16/2015 02:35 PM, Hans de Goede wrote:
>> To be clear about my aarch64 remark, that relates to the behavior of aarch64 acpi using
>> machines, those will also output to both a serial tty and tty0 when the acpi equivalent
>> of stdout-path is present and points to a serial tty.
> 
> I already made comments addressing the unsuitability of the license for the
> aarch64 acpi console;

Yes, you did. However, I believe you might have outdated information.
Have you read the SPCR in the past few months, or are you looking at a
version prior to update that was made in October of 2014?

> the proposed SPCR table format is patented by Microsoft and
> licensed incompatibly with GPLv2.

Can you be specific about your concerns? The license has already been
changed once (I instigated the request that lead to that change to drop
several pages of terse terms that used to cover the first few pages). I
have found the Microsoft team extremely responsive and amenable to
resolving issues, so if you would do us the service of articulating what
the concern is, I'll reach back out and get that addressed. I have a
direct line into their server and legal teams to discuss this issue.

Jon.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
