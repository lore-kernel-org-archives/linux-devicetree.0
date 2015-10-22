From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Thu, 22 Oct 2015 09:49:18 +0200
Message-ID: <562894FE.3040702@gmail.com>
References: <1445444007-4260-1-git-send-email-jenskuske@gmail.com>
 <5627E515.6050505@redhat.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBAFKUKYQKGQEC64BUGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5627E515.6050505-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "Reinder E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, zhao_steven-Y9sIeH5OGRo@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 21/10/15 21:18, Hans de Goede wrote:
> 
> Great to see that you've started working on this again. Last weekend I
> ended up working on this too together with Reinder E.N. de Haan <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> (added to the Cc).
> 
> We took a slightly different approach for the gates clocks, see:
> 
> https://github.com/jwrdegoede/linux-sunxi/commits/sunxi-wip
> 
> And specifically:
> 
> https://github.com/jwrdegoede/linux-sunxi/commit/80a1afe319d5d1a0c426d42e75d37f0c64e8ea0b
> 
> Combined with:
> 
> https://github.com/jwrdegoede/linux-sunxi/commit/d508da5feb5048f6674d6b24b58ac9058fb9d877
> 
> This deals with the per gate parents the same way the rockchip
> clock code does, and it seems to be quite a bit less code then your solution.
> 
> So now we've two solutions to chose from :) Since you seem to be back to
> working on this I'll refrain from doing any further work, at least
> without coordinating. Maxime, can you let us know which solution for the
> gates clock parents is best, or tell us if you think both solutions are
> no good :)

I'd actually prefer your solution. I duplicated the simple-gates code
when trying a different approach and never revisited that decision.

> 
> (I wanted to get in touch with you about the work done this weekend,
> but your posting of this v3 has sorta pre-empted that).
> 
> Other then the slightly different solution for the gates, the code in my tree
> is a straight forward port of your v2.
> 
> Thanks for your work on this!
> 
> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> I'm teaching a kernel driver course at my local hackerspace in the netherlands:
> 
> https://revspace.nl/KernelDriverProgrammingCourse2015
> 
> Which is where our work on this this weekend originated. The next planned
> course day is November 1st and I expect Reinder to be working on the H3
> again then. I think the plan was to tackle USB next. Reinder can you confirm
> this ?  If you (Jens) want to work on USB before then, that is fine, but please
> coordinate their is plenty to do, so no need for us to be doing (more) double
> work.
> 

I don't plan to work on USB soon, my next step would have been Ethernet
and finishing the basic u-boot support. You know my u-boot H3 wip tree I
hope? Before we duplicate our work there too...
https://github.com/jemk/u-boot-sunxi/tree/sunxi/h3

Jens
