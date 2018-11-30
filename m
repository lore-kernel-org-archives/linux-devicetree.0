From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 09/15] clk: sunxi-ng: r40: Force LOSC parent
 to RTC LOSC output
Date: Fri, 30 Nov 2018 11:55:44 +0800
Message-ID: <CAGb2v64cER=qU2e_jnZemVfYbtQFNk+ev1MFBQDQu86f98X2dw@mail.gmail.com>
References: <20181128093013.24442-1-wens@csie.org> <20181128093013.24442-11-wens@csie.org>
 <154344054442.88331.8887745218976145062@swboyd.mtv.corp.google.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUHJQLQAKGQEZHKXUSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <154344054442.88331.8887745218976145062-n1Xw8LXHxjTHt/MElyovVYaSKrA+ACpX0E9HWUfgJXw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 5:29 AM Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Quoting Chen-Yu Tsai (2018-11-28 01:30:07)
> > On the R40, in addition to a mux between the RTC's own RC oscillator and
> > an external 32768 Hz crystal, which are muxed inside the RTC module, the
> > CCU also has its own RC oscillator, which runs at around 2 MHz, and can
> > be muxed with the LOSC output from the RTC. This muxed output is called
> > "SYS 32K" in the module clock diagram, but otherwise referred to as the
> > LOSC throughout the CCU documentation.
> >
> > The RC oscillator is not very accurate, even though it has an undocumented
> > calibration function. We really want a precise clock at 32768 Hz,
> > instead of something at around 32 KHz. This patch forces the SYS 32K
> > clock to use the RTC output as its parent, and doesn't bother
> > registering the internal oscillator nor a clock mux.
> >
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
>
> Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Merged with acks from Maxime and Stephen.
