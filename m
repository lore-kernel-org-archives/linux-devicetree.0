From: Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party
 drivers
Date: Tue, 13 Sep 2016 16:55:59 +0200
Message-ID: <57D8137F.8040508@laposte.net>
References: <57BDAF2E.10502@laposte.net>
 <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
 <57D69FB1.2020801@laposte.net> <20160912123809.GB13741@leverpostej>
 <57D6AA54.6000208@laposte.net> <20160912135549.GA14165@leverpostej>
 <57D6D2A9.3010006@laposte.net> <20160912165637.GF14165@leverpostej>
 <57D7CF17.2050905@laposte.net> <20160913131208.GA23336@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160913131208.GA23336@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 09/13/2016 03:12 PM, Mark Rutland wrote:
>> Exactly, that is why I was thinking it would take less "review" time.
>> Indeed, if there is no driver, why would it matter what those bindings
>> are?
> 
> If you believe that the bindings don't matter, then there is absolutely
> no reason for them to exist in the first place.
> 
> If those binding matter to *anyone*, then those collating the bindings
> have some responsibility of stewardship, and that includes
> review/maintenance/etc.

The thing is that right now it seems the "responsibility of stewardship"
lies only within "Linux", whereas DT is proposed as open for everybody,
Bootloaders, FreeBSD, etc.

In that case, shouldn't the "responsibility" be shared?
Alternatively, maybe 'borders' could be created, in order to enable the
allocation of responsibility of different sections to different parties,
right?
Obviously, moving properties/nodes from one 'section' to another crossing
responsibility 'borders' would require agreements.

Shouldn't that be something good to think about?

Best regards,

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
