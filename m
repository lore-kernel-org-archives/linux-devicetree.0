From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2 RESEND] power: reset: Add syscon reboot/poweroff
 device nodes for APM X-Gene platform
Date: Sun, 26 Jul 2015 20:37:42 +0200
Message-ID: <20150726183742.GA24272@localhost>
References: <1433272747-27114-1-git-send-email-ttnguyen@apm.com>
 <20150714084004.GA14593@localhost>
 <CAPw-ZT=d2=dh-Hjugo9BStCuhTp82MMapUa1EGrD01EoTOG-nA@mail.gmail.com>
 <CAOesGMhKRxUtr6XXsZgCJVUFTFL3eHySP8y-SmEzi=R53MxLRw@mail.gmail.com>
 <CAPw-ZTnk8cZyFyMnBMUYXuxs9=2ydqxOzm+dYsg-=9_Suq+q7A@mail.gmail.com>
 <CAOesGMimzcUDW4e1etxZNerEusWmEtT_um8XZoT0MkFpCnTf5w@mail.gmail.com>
 <CADaLNDmPqb73UrOaVphkywZh8mfd4sPdA6i25USLt53sZ3hFuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADaLNDmPqb73UrOaVphkywZh8mfd4sPdA6i25USLt53sZ3hFuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Tai Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 25, 2015 at 11:34:42AM -0700, Duc Dang wrote:
> Hi Olof,
> 
> We are debating whether we should setup a company server (where we can
> have full control about storage, user permissions, backup, ...) or
> just use github.com to host our X-Gene kernel tree.
> 
> Github seems already provide everything we need for a public source
> tree. Per your experience, what is your (and probably other
> maintainers) reference in git hosting server? Is there any
> inconvenience or difficulty for the maintainers to pull/merge code
> from Github versus from a company server?

Hosting on github is fine with us in general. We do prefer to get
signed pull requests in particular when they come from other sources
than kernel.org, mostly because there's another third party involved in
hosting the repo and by using signed tags there's less room for anyone
to do bad stuff with the repository without someone noticing.

If you host on github, please still use native git pull requests and not the
ones that github provides via the web interface.

Note however, that given the total volume of patches there's no strong need for
you to have a public repo just to send code to us -- we're happy applying
patches at the volumes we're currently looking at. I can imagine other reasons
for why you would like to have a public repo though.


Thanks,

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
