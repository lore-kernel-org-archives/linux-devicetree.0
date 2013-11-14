From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH RFC v5 2/5] dma: mpc512x: add support for peripheral
 transfers
Date: Thu, 14 Nov 2013 21:58:10 +0100
Message-ID: <20131114205810.GH17929@book.gsilab.sittig.org>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com>
 <1383290374-17484-3-git-send-email-a13xp0p0v88@gmail.com>
 <20131111201024.GR17929@book.gsilab.sittig.org>
 <CAF0T0X5mCEiS88YGGjSS6oGU5RaQ=2PEQFL533OjpQzmc398rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF0T0X5mCEiS88YGGjSS6oGU5RaQ=2PEQFL533OjpQzmc398rA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 16:23 +0400, Alexander Popov wrote:
> 
> 2013/11/12 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> > 
> > It would be nice to get a response to the feedback that you
> > are given.  It may be appropriate not to obey to the
> > feedback, but at least it should get considered.
> 
> Yes, I see. My implicit response by RFCv5 was not efficient,
> sorry.  Now should I write a detailed answer in the thread with
> your feedback for improving readability of the discussion?

Don't you have a checklist of which feedback you got and which of
it you did address and which you didn't?  Reviewers don't usually
do the tracking for those who do the submissions.

I think that you may list "pending issues" or "non-issues" either
with new submissions or at the previous version's feedback,
whatever is more appropriate.  Maybe "pending" is useful with the
new announcement, while "won't, need not" is better kept with the
reviews.

As for the not yet addressed feedback:  From the top of my head I
can think of the execute comment which contradicts the code
(which suggests that at least one of them is wrong), and the data
type mismatch in the config routine (where code just happens to
work by coincidence).  And in bypassing I noticed that your
recent submission has coding style issues (braces, indentation),
which should no longer happen after several iterations as you
should know how to prepare and check the next version.

Again:  It may be OK to not follow the advice (especially if you
get multiple responses of differrent direction, or when you are
more familiar with the subject than an observer).  But you should
state when you don't agree and why.  Without feedback, reviewers
may see several submissions which suffer from the same issues,
and expect more to show up and thus feel that their feedback is
getting ignored.  Which quickly becomes tiring.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
