From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v5 2/5] dma: mpc512x: add support for peripheral transfers
Date: Wed, 20 Nov 2013 10:49:08 +0400
Message-ID: <CAF0T0X6c9101zbp3kofjLOQDpFdutDJQ+ciHiCcRnCV_sxn4uQ@mail.gmail.com>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com>
	<1383290374-17484-3-git-send-email-a13xp0p0v88@gmail.com>
	<20131111201024.GR17929@book.gsilab.sittig.org>
	<CAF0T0X5mCEiS88YGGjSS6oGU5RaQ=2PEQFL533OjpQzmc398rA@mail.gmail.com>
	<20131114205810.GH17929@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131114205810.GH17929-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/11/15 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> As for the not yet addressed feedback:  From the top of my head I
> can think of the execute comment which contradicts the code
> (which suggests that at least one of them is wrong), and the data
> type mismatch in the config routine (where code just happens to
> work by coincidence).  And in bypassing I noticed that your
> recent submission has coding style issues (braces, indentation),
> which should no longer happen after several iterations as you
> should know how to prepare and check the next version.
I'll doublecheck this and return with improved code.

> Without feedback, reviewers
> may see several submissions which suffer from the same issues,
> and expect more to show up and thus feel that their feedback is
> getting ignored.  Which quickly becomes tiring.
Thanks for your patience and comprehensive replies.

Best regards,
Alexander.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
