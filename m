From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/2] clk: Support for DT assigned clock parents and rates
Date: Mon, 24 Mar 2014 14:57:29 -0700
Message-ID: <20140324215729.32624.19272@quantum>
References: <1393870533-20845-1-git-send-email-s.nawrocki@samsung.com>
 <53187C13.3040202@st.com> <532AE239.9000800@samsung.com>
 <20140321014551.21989.57253@quantum> <532C4816.2080102@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <532C4816.2080102-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Maxime Coquelin (2014-03-21 07:09:26)
> Hi Mike,
> 
> On 03/21/2014 02:45 AM, Mike Turquette wrote:
> > Quoting Sylwester Nawrocki (2014-03-20 05:42:33)
> >> Hi Maxime,
> >>
> >> On 06/03/14 14:45, Maxime Coquelin wrote:
> >>> Hi Sylwester,
> >>>
> >>>        I like the principle of your implementation, but I have two questions:
> >>>        1 - How can we manage PM with this solution, as the parent/rate will be
> >>> set only once at probe time?
> >>>        2 - How to set the parent of a parent clock (which can be shared with
> >>> other devices)? Same question about the parent rates.
> >>
> >> Thanks for your feedback and apologies for late reply.
> >>
> >> IIUC your first concern is about a situation when clocks need to be
> >> reconfigured upon each resume from system sleep or runtime PM resume ?
> >> As I mentioned in v1 of the RFC I was considering having individual
> >> drivers calling explicitly the clocks set up routine. Presumably this
> >> would allow to resolve the power management related issue.
> >> One example I'm aware the approach as in this RFC wouldn't work is
> >> when a device in a SoC belongs to a power domain, which needs to be
> >> first switched on before we can start setting up and the clocks'
> >> configuration get lost after the power domain switch off.
> >
> > I like Sylwester's approach of handling this one-time setup in the
> > driver core.
> >
> > Any kind of fine grained power management should not be hidden by DT,
> > and by definition that logic belongs in the device driver. It can still
> > be nicely abstracted away by runtime pm[1].
> >
> > Regards,
> > Mike
> >
> > [1] Message-ID: <20140320114238.GQ7528-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
> How can I access this reference?

I was trying to provide a reference to this thread which is tangentially
related to this topic:

http://www.spinics.net/lists/arm-kernel/msg317016.html

But it hadn't hit any of the mail archives at the time of my writing so
I just copied Russell's Message-ID from his email. If you have a copy of
that email then you can search on Message-ID's for that and you will
find it. :-)

Regards,
Mike

> 
> Thanks,
> Maxime
> 
> >
> >>
> >> OTOH I suspect devices for which one-time clocks setup is sufficient
> >> will be quite common. And for these there would need to be a single
> >> call to the setup routine in probe() I guess, since it wouldn't be
> >> possible to figure out just from the DT data when the actual call
> >> should be made.
> >>
> >> For a global clocks configuration, I thought about specifying that
> >> in the clocks controller node, and then to have the setup routine
> >> called e.g. from of_clk_init(). I think that could work well enough,
> >> together with the patch [1], adding clock dependencies handling.
> >> But then the clock frequency set up function would need to be
> >> modified to respect the clock parent relationships, similarly as
> >> in patch series [2]. A just noticed [2] recently, after posting
> >> this RFC (adding Tero at Cc).
> >>
> >> --
> >> Regards,
> >> Sylwester
> >>
> >> [1] http://www.spinics.net/lists/arm-kernel/msg310507.html
> >> [2] http://www.spinics.net/lists/linux-omap/msg103069.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
