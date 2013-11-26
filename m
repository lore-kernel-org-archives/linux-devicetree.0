From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] clk: exynos: Fix typos in DT bindings documentation
Date: Tue, 26 Nov 2013 13:13:15 +0100
Message-ID: <1538452.UuDUTCGYER@amdc1227>
References: <1384775172-3373-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <1566145.0GyXC9vG8j@avalon>
 <CAK9yfHxL8DnN8BE94-L3_MK+dBO0exEq7YAamXRHQ7Abo3jYyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAK9yfHxL8DnN8BE94-L3_MK+dBO0exEq7YAamXRHQ7Abo3jYyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 of November 2013 11:23:49 Sachin Kamat wrote:
> +CC Mike and removed a few from the list.
> 
> Hi Laurent,
> 
> On 26 November 2013 05:52, Laurent Pinchart
> <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> > Hi Sachin,
> >
> > On Monday 18 November 2013 17:17:39 Sachin Kamat wrote:
> >> On 18 November 2013 17:16, Laurent Pinchart wrote:
> >> > s/comptible/compatible/
> >> >
> >> > Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> >>
> >> Good catch.
> >>
> >> Reviewed-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Have you queued up the patch for v3.14 ?
> 
> No, I haven't. This should either go through DT tree or else Tomasz Figa can
> pick this up and send it to Mike as per the new workflow for 3.14.
> 
> 

Well, since this is purely a fix for the documentation, without any
dependencies on clk tree, I see no reason to send it in any other way than
through DT tree directly.

As for clk-samsung tree, I'm currently in process of preparing a tree on
kernel.org so I should start picking up Samsung clock patches soon.

By the way, the patch adding me to MAINTAINERS file has not been merged
yet. Mike, are there any issues?

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
