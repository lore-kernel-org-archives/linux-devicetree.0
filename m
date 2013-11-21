From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 18:16:08 +0000
Message-ID: <20131121181608.1DDDCC406A3@trevor.secretlab.ca>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail. com> <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <5289A356. 4060004@jonmasters.org> <20131118150052.GC24408@sirena.org.uk> < 20131118191336.GB5886@quad.lixom.net> <20131119091216.GA4412@netboy> < 20131119184827.GD20967@quad.lixom.net> <20131120064056.GB5272@netboy>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120064056.GB5272@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Nov 2013 07:40:57 +0100, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Nov 19, 2013 at 10:48:27AM -0800, Olof Johansson wrote:
> > 
> > This is just a tangent and a distraction anyway: You should know by
> > now that we've decided to keep backwards compatibility going forward,
> > so any argument about why we did it differently before is leading nowhere.
> 
> Yes, I know it is tangent, but the tone in which you address people
> (like Jon Masters) who complain about DT quality is really not fair.
> 
> When DT for arm was first proposed, I argued against it in vain.
> Since then, I have really, truly tried my best to keep on top of the
> DT discussions on the arm list, because everyone working on the arm
> platform will have to know DT intimately, whether they want to or not.
> 
> Now, I never saw any proclamation or discussion about "DT is in flux"
> on the arm list. If I had, I surely would have complained, and loudly.
> AFAICT, this decision was made in rather private circles, but you talk
> as if this was abundantly clear. *It was not.*
> 
> Or if it was announced in some way, just show me where. Otherwise,
> please stop the "we were upfront about this from day one" excuses.

No, I cannot point at any one place where it was stated outright. My
memory is not that good. There were lots of times the stability of DT
bindings was discussed, and I certainly have told people on the mailing
list to keep their dtb updated while we are figuring out things like
clock bindings and adding functionality. I'm sorry that it wasn't more
clear. As has already been said in this thread, when the DT migration
started, we didn't know how it should all look and work. It took time to
figure out what was sane and what was not.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
