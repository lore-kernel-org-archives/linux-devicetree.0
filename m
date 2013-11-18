From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 11:25:52 -0800
Message-ID: <20131118192552.GD5886@quad.lixom.net>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <5289A356.4060004@jonmasters.org>
 <5289A4F3.5040203@jonmasters.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5289A4F3.5040203-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 12:26:11AM -0500, Jon Masters wrote:
> On 11/18/2013 12:19 AM, Jon Masters wrote:
> 
> > It's going to be a messy thing to even attempt. Look, I wish we had a
> > time machine and could have done this whole thing years ago, but I'm not
> > sure it would have gone differently. ACPI is something a lot of people
> > emotionally hate. In the Enterprise space myself and others *need* it
> > (along with UEFI) to have a scalable solution that doesn't result in an
> > onslaught of customer support calls, which a non-standards body backed
> > moving target of DTB will do. And besides all of the big boys are going
> > to be using ACPI whether it's liked much or not.
> 
> A while ago I mentioned producing a series of requirements that
> articulates what Red Hat thinks an ARMv8 server looks like. Suffice it
> to say that such requirements do in fact exist, and will be made
> available in the not too distant future as part of another doc.

It's nice that there's an unpublished document with a RedHat logo on it
somewhere that mandates what we, the kernel project, is going to do.

I thought both RedHat and you personally knew that we don't do things
that way in the kernel, Jon. Published or not.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
