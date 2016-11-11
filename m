From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8] mtd: nand: add tango NAND flash controller support
Date: Fri, 11 Nov 2016 18:14:51 +0100
Message-ID: <20161111181451.00b5ebfa@bbrezillon>
References: <580F5AD2.9020909@sigmadesigns.com>
        <580F5B37.5090100@sigmadesigns.com>
        <580F8407.5070706@sigmadesigns.com>
        <20161106235812.0bcbbdc5@bbrezillon>
        <5825EB70.4070406@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5825EB70.4070406-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Fri, 11 Nov 2016 17:01:52 +0100
Mason <slash.tmp-GANU6spQydw@public.gmane.org> wrote:

> On 06/11/2016 23:58, Boris Brezillon wrote:
> 
> > Applied after fixing a few coding style issues to make checkpatch happy.  
> 
> First of all, I want to thank you for all the help you provided
> along the way.
> 
> I have to admit that I'm a bit frustrated by some of the changes you made
> to the patch.
> 
> Specifically, changing
> 
> from:  if (ptr_expr == NULL)
>   to:  if (!ptr_expr)
> 
> I dislike the second form, because it "hides" what is being tested.
> I've even seen people use !count to mean count == 0, and I find that
> very unintuitive.

I just fixed checkpatch --strict complaints.

> 
> I also have a hard time discerning a '!' after a '('
> 
> 
> The other change is the chip->options initialization. I thought
> you said on IRC I could keep my preferred formatting.

Hm, I said that you could use one flag per line, and I kept that. I
just moved the 'or' operator which is, IMO, better placed at the end of
the line, and I aligned the following flags with the first one to make
checkpatch happy.

> 
> 
> In the end, these are tiny issues in the grand scheme of things,
> but it was important for me to point them out.

Some maintainers don't care much, but I think enforcing these rules is
what brings consistency in the kernel code, that's why I try to make
checkpatch happy when I submit new code and ask developers to do so
when they submit code to the NAND subsystem.

I know you often disagree with the Linux coding style rules, but you're
a contributor to this project, and as such, you should commit to
the defined rules (and this includes the coding style rules).
And it appears that, instead of complying to these rules when you're
asked to, you keep arguing endlessly that your own coding style is
better. You'd better spend time on things that really matters.

Note that most of the time, when the contribution is looking good, but
a few coding style issue remain, I'm fixing those issues myself because
I know how annoying it can be to ask someone to post a new version to
fix such minor things.
But since you complain about that, next time I'll ask you to make
"checkpatch --strict" happy  before accepting your patch.

On a side note, as I already told you privately, you seem to be a smart
guy (the evolution of the tango NAND driver shows that you're able
to understand how things work, and take comments/reviews into account).
But you have the bad habit of consistently arguing when you're asked to
change something (and especially on minor things that are easy to fix).
This is really the kind of behavior that can upset maintainers (me
included). So please, try to work on that.

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
