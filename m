From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: sun6i: Protect CPU clock
Date: Mon, 24 Feb 2014 21:30:05 -0300
Message-ID: <530BE40D.8080506@elopez.com.ar>
References: <1393258967-4843-1-git-send-email-maxime.ripard@free-electrons.com> <1393258967-4843-2-git-send-email-maxime.ripard@free-electrons.com> <20140224163034.GN21483@n2100.arm.linux.org.uk> <530BD804.5090806@elopez.com.ar> <20140225000154.GR21483@n2100.arm.linux.org.uk>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD73XIMS3EHBBHGIV6MAKGQETRZUA6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140225000154.GR21483-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjw-KKrjLPT3xs0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

El 24/02/14 21:01, Russell King - ARM Linux escribi=F3:
> Hi Emilio.
>
> On Mon, Feb 24, 2014 at 08:38:44PM -0300, Emilio L=F3pez wrote:
>> Why is this so? Can't a clock be left enabled while nobody has a
>> reference to it? I have looked around in Documentation/ (rather quickly
>> I must say) and have not found any explicit mention that it is required
>> to keep a reference to the clock while it's enabled. I'd appreciate it
>> if you could explain this a bit more verbosely or point me to the
>> relevant documents.
>
> First up, if you have a requirement that a clock be enabled, then is it
> not unreasonable to ensure that the clock is referenced?

I was under the impression that the reference count was orthogonal to=20
the clock status, but after getting that clarified, I can see your point.

> Secondly, what if we have code which scans the clocks in the system,
> shutting down those leaf clocks which appear to be unreferenced?

Indeed, that would break things.

> Thirdly, the API (as I designed it) says so:
>
> /**
>   * clk_put      - "free" the clock source
>   * @clk: clock source
>   *
>   * Note: drivers must ensure that all clk_enable calls made on this
>   * clock source are balanced by clk_disable calls prior to calling
>   * this function.
>   *
>   * clk_put should not be called from within interrupt context.
>   */
> void clk_put(struct clk *clk);
>
> which has been there since the API was first created - it's part of the
> contract between drivers using the API and implementers creating somethin=
g
> which conforms to the API - which today means CCF.

That's enough of a reason on its own :) I should have checked clk.h

> The intention here is that while there are any users holding a clk_get()
> reference on a clock, the clock is assumed to be required for some
> device, and the struct clk may not be kfree'd, nor may its state be
> changed in an unpredictable way to those drivers holding a reference
> to it.

I understand now, thanks for the insight. I'll talk with Maxime and get=20
this sorted out.

As a side note, should drivers/base/power/clock_ops.c be fixed too? I=20
have added Rafael to Cc.

Cheers,

Emilio

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
