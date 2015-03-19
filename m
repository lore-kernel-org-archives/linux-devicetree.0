From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Thu, 19 Mar 2015 07:46:17 -0400
Message-ID: <550AB709.6010107@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <5507332B.5020504@hurleysoftware.com> <55085AFA.7070909@redhat.com> <550868AF.8050201@hurleysoftware.com> <5508C327.9020108@redhat.com> <550976EE.4020500@hurleysoftware.com> <550A003C.4040100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550A003C.4040100-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/18/2015 06:46 PM, Jon Masters wrote:
> Just a sidenote, that this is a data structure, not code. There are
> plenty of other specifications and standards that the kernel uses that
> are licensed under a variety of terms. The specific issue seems to be
> the potential for conflict over the patent language in that document as
> possibly pertaining to implementations, not the specific license of the
> document per se. I'll ping a few and get a conversation going.

Strictly speaking, only the patent claim(s) are relevant.

Either,
a. your code infringes on the claim(s), in which case, the specific license
   from Microsoft is required, or
b. your code does not infringe, in which case, no license is necessary.

In case (a), all of my previous email applies; ie., the terms of the license
should be GPL v2 compatible.

In case (b), there is no actual problem. Yes, the patent notice in the
specification is a barrier, and it would be helpful to your cause if
Microsoft cited the patent numbers, but you could also just explain these
in your cover letter at submission time.

Regards,
Peter Hurley



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
