From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 13:08:37 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1310241300590.1951@syhkavp.arg>
References: <20131023174458.GC5208@netboy> <1382553982.31058.10.camel@sakura.staff.proxad.net> <20131024095232.27BBCC4039D@trevor.secretlab.ca> <1382614439.6040.16.camel@sakura.staff.proxad.net> <1382615278.8522.72.camel@shinybook.infradead.org>
 <20131024122346.GD11296@ulmo.nvidia.com> <1382619655.6040.52.camel@sakura.staff.proxad.net> <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org> <1382621431.6040.66.camel@sakura.staff.proxad.net> <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
 <20131024141955.GB25061@ulmo.nvidia.com> <465e75de15f7d79c3b57a3b88024e739.squirrel@twosheds.infradead.org> <alpine.LFD.2.03.1310241143240.1951@syhkavp.arg> <93d9a5ce228d03c4a183b06b00bd0442.squirrel@twosheds.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <93d9a5ce228d03c4a183b06b00bd0442.squirrel-fWAbwA/6YHlc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Oct 2013, David Woodhouse wrote:

> 
> > So it is time IMHO that the description of how things *shall* work be
> > itself revised.
> 
> It *is* being revised, with an explicit explicit understanding that things
> will have to change and a defined process for how to cope with that.

Good.

Your previous emails seemed to imply that the lack of binding stability 
enforcement was the problem.

And you said: "our defined processes for coping are based on the 
assumption that it (mistakes) should be rare". I think this statement is 
wrong.  So if this is what's being revised then fine.



Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
