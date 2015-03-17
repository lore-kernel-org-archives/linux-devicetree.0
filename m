From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 14:43:59 +0100
Message-ID: <55082F9F.90909@redhat.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <55075AFD.7000001@hurleysoftware.com> <5507E3E3.5000001@redhat.com> <CAL_Jsq+dA3RDbakrkeMY07czs13bFFKCyETEXTzWxf+h1umBPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+dA3RDbakrkeMY07czs13bFFKCyETEXTzWxf+h1umBPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 17-03-15 14:30, Rob Herring wrote:
> On Tue, Mar 17, 2015 at 3:20 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

<snip>

>> TBH I do not understand why we're even arguing here, AFAICT the behavior
>> change
>> is an unwanted side-effect of your patch, so the solution is to rewrite the
>> patch
>> so that we get the same end result (not turning off bootconsole-s too early)
>> without
>> the unwanted side-effect, and you agreed to work on that ?
>
> I intend to revert this if we don't have a fix soon.
>
> I think we just need a flag saying we've enabled the earlycon from
> stdout-path or not and then add the preferred console based on that. I
> assume with "earlycon" only on the command-line, getting console only
> on stdout-path is okay.

Yes, if a user explicitly specifies something like "earlycon" on the
commandline then not automatically getting console output on tty0 is
fine AFAICT. The use case important for me / distros is when no
console= (or related) arguments are present on the cmdline at all,
then the desired behavior is to have console output on tty0 as well
as on any serial console specified with stdout-path.

Thanks & Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
