From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Migrate PXA27x platforms to clock framework
Date: Tue, 30 Sep 2014 12:52:57 -0700
Message-ID: <20140930195257.19023.57219@quantum>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr>
 <1465795.XsPpj3dZHX@wuerfel> <87d2bq43pc.fsf@free.fr>
 <201408241408.19861.arnd@arndb.de> <20140903184956.11368.47800@quantum>
 <874mw2xoau.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <874mw2xoau.fsf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Robert Jarzmik (2014-09-20 09:13:45)
> Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
> 
> > Quoting Arnd Bergmann (2014-08-24 05:08:19)
> >> On Sunday 24 August 2014, Robert Jarzmik wrote:
> >> > > By default, I'd expect Haojian to pick up the patches and send
> >> > > us a pull request. He sent an Ack, but also didn't make it clear
> >> > > that we should pick them up.
> >> > I was thinking that they would go through the clk maintainers, hence Haojian's
> >> > ack. If they should go through arm-soc, they would need Mike's ack.
> >
> > Robert,
> >
> > I'm happy to take the patches but they will need to be rebased onto
> > clk-next and refactored to take into account Tomeu's api split[0].
> 
> Hi Mike,
> 
> I have had a look at clk-next and Tomeu's split.
> My current understanding is that Tomeu's patches don't apply on your clk-next,
> as I get conflicts.
> 
> So either I rebase my patches on top of Tomeu's tree (as this is what will drive
> most of the rebase work AFAIU), or I wait for Tomeu's tree to be merged into
> your clk-next. Is there any chance Tomeu's work ends up in your clk-next tree
> soon ?

Hi Robert,

Tomeu's stuff won't go into 3.18. I should have circled back to these
patches when that become apparent, but it got lost in the paperwork.

I can take these patches without you rebasing onto his work. Since we
have -rc7 I think there is time and these patches shouldn't wait for
another merge window. I've applied them to clk-next from a stable branch
with these six patches based on -rc1.

Hi Arnd,

I do not believe you'll need the stable branch (I tested merging it with
linux-next and there were no issues), but I've put one up anyways:

https://git.linaro.org/people/mike.turquette/linux.git clk-pxa27x

Regards,
Mike

> 
> Cheers.
> 
> -- 
> Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
