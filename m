From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] Support for Fujitsu MB86S7X SoCs
Date: Wed, 1 Apr 2015 17:50:29 -0700
Message-ID: <20150402005029.GH8137@localhost>
References: <CAKR0VNJdCEEoM8mqFrc-teQ-q=DopGisos16+uKt=ky2mRjF8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKR0VNJdCEEoM8mqFrc-teQ-q=DopGisos16+uKt=ky2mRjF8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jaswinder Singh <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Wed, Mar 18, 2015 at 02:44:30PM +0900, Vincent Yang wrote:
> Hi Arnd and Olof,
> 
> Please consider pulling in these patches for series of Fujitsu SoC
> based around variations of 2xCA7+2xCA15 big.LITTLE architecture.
> 
> The MHU driver is already queued in Mailbox tree.
> 
> Thanks,
> 
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.linaro.org/landing-teams/working/fujitsu/integration.git
> s7x-arch-pull
> 
> for you to fetch changes up to 9cf417fee0bbea9296791fa9a15ab289307bb26a:
> 
>   ARM: MB86S7x: Add configs (2015-03-17 11:22:40 +0530)

Please use signed tags when you send pull requests (and ideally, please get
your GPG key signed by people at the next Linaro Connect or other event where
you will get in contact with other kernel developers).

I started looking at this patch set, and it's adding global include file
contents for things that should only exist under the drivers/soc/ directory,
i.e. internal driver defines, etc -- it shouldn't be exposed to the kernel as
a whole.

I'll find the individual patches where they were posted and comment on those
directly.

As far as applying the code -- initial platforms like these usually go in
through different branches so applying them directly makes sense for us. Once
you're up and rolling as a maintainer you'll get a hang of what we want to see
grouped in the different branches and pull requests will be easier to handle.


Thanks,

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
