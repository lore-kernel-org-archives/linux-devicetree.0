From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Date: Tue, 28 Jun 2016 15:21:19 -0700
Message-ID: <146715247912.89261.8162176265913264908@resonance>
References: <cover.1467135898.git.moinejf@free.fr>
 <a55dc5d1a9f02dc4d71d5c21064bffebe5a7b149.1467135898.git.moinejf@free.fr>
 <20160628204502.GG5550@lukather>
Reply-To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCYKZMUQ7QBBBYXQZO5QKGQE45PTXAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160628204502.GG5550@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2016-06-28 13:45:02)
> What's the point of this, if we're not using (or exposing for that
> matter) any of it?
> 
> I'm sorry, but the whole point of the initial serie was to rework and
> simplify things, precisely because dealing with the clk_factors code
> was just too difficult nowadays. And this doesn't solve anything on
> that aspect.
> 
> We came with an approach that have all the maintainers involved
> agreeing on it, I don't see why we should start over. There's some
> useful features there (like tracing). But it's something that can be
> added, and should be done differently anyway.

Yes, let's not delay Maxime's work any longer. Stephen and I have
requested these changes to the sunxi clock drivers for a long time and
now we have them. I intend to merge Maxime's v3 once it addresses the
last round of review questions.

Regards,
Mike

> 
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
