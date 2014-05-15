From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 1/2] clk: of: helper for determining flags properties
Date: Wed, 14 May 2014 21:47:28 -0700
Message-ID: <20140515044728.19795.43070@quantum>
References: <1399982253-21079-1-git-send-email-gabriel.fernandez@linaro.org>
 <1399982253-21079-2-git-send-email-gabriel.fernandez@linaro.org>
 <20140513122054.GA2419@e106331-lin.cambridge.arm.com>
 <5372363B.4080608@gmail.com> <20140513204924.5943.24086@quantum>
 <CAG374jAgMbLvw8Qm2Eg6R9vVXL7gTv4Pqy7oE0hxw2zTPFHOOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAG374jAgMbLvw8Qm2Eg6R9vVXL7gTv4Pqy7oE0hxw2zTPFHOOw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Gabriel Fernandez (2014-05-14 00:53:58)
> Hi,
> 
> On 13 May 2014 22:49, Mike Turquette <mturquette@linaro.org> wrote:
> > Quoting Sebastian Hesselbarth (2014-05-13 08:11:55)
> >> On 05/13/2014 02:20 PM, Mark Rutland wrote:
> >> > On Tue, May 13, 2014 at 12:57:32PM +0100, Gabriel FERNANDEZ wrote:
> >> >> The patch provides a helper to get flags properties of
> >> >> a clock node.
> >> >>
> >> >> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> >> >> ---
> >> >>   drivers/clk/clk.c            | 11 +++++++++++
> >> >>   include/linux/clk-provider.h |  6 ++++++
> >> >>   2 files changed, 17 insertions(+)
> >> >>
> >> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> >> index 4d56220..cae8985 100644
> >> >> --- a/drivers/clk/clk.c
> >> >> +++ b/drivers/clk/clk.c
> >> >> @@ -2528,6 +2528,17 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
> >> >>   }
> >> >>   EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
> >> >>
> >> >> +unsigned long of_clk_get_flags(struct device_node *np)
> >> >> +{
> >> >> +    unsigned long flags = 0;
> >> >> +
> >> >> +    if (of_property_read_bool(np, "set-rate-parent"))
> >> >> +            flags |= CLK_SET_RATE_PARENT;
> >> >
> >> > NAK.
> >> >
> >> > This is _not_ a hardware property. This flag describes internals of the
> >> > Linux clock framework, and is thus not suitable for DT.
> >>
> >> Mark,
> >>
> >> while I agree above property is not a hardware property, it is at least
> >> some kind of use-case property. If not by DT, we will have to allow some
> >> way to describe master-slave relationships between clocks in a driver
> >> independent way.
> >
> > I agree with Mark.
> >
> > Generally this stuff belongs in a clock driver. Of course there are the
> > integration issues you pointed out. More on that below.
> >
> > As an aside, CLK_SET_RATE_PARENT is a headache, since propagation of the
> > operation up to the parent clock really should be the default behavior
> > for .set_rate (and in fact this is the case for the new-ish
> > .determine_rate op). Some history on those decisions can be found at [1]
> > and [2].
> >
> 
> 
> My issue is exactly the same as Marc, it's for solve some case with
> PCM and HDMI clocks.
> 
> >>
> >> > You've also failed to document the property.
> >> >
> >> > What are you trying to achieve here, and why do you think this is the
> >> > best way of achieving that?
> >>
> >> I cannot tell from the commit msgs, but consider clk-si5351 which is a
> >> driver for an external programmable clock with N PLLs and M outputs. Now
> >> connect a video clock consumer and an audio clock consumer to two
> >> different outputs and those to one PLL (as you want audio clock derived
> >> from video clock, typical HDMI scenario).
> >>
> >> Now, there should be a way to tell the generic driver which outputs are
> >> allowed to change the PLLs rate and which don't. Otherwise, the clock
> >> chip would be pretty useless as e.g. your audio clock consumer will
> >> overwrite the rate the video clock consumer has chosen.
> >
> > This is really a job for the "coordinated clock rate changes" that are
> > currently in development. These specify clock sub-tree snapshots of
> > parent and rate configurations that are predefined. These combinations
> > can be specified in DT. That helps a lot with clock configurations that
> > change per board, or for cases where many combinations of parents and
> > dividers can yield the same output rate, but only a subset of those were
> > validated by the silicon validation team or had proper timing closure so
> > we don't want to rely on the "walk up the tree" algorithm.
> >
> > Regards,
> > Mike
> 
> Ok i think this work will be the best solutions for my issue.
> 
> Where i can find some threads about that ?

Hi Gabriel,

Glad that it sounds interesting to you. There isn't a dedicated
discussion thread but I did outline some of the ideas earlier today on a
separate thread[1]. It's being actively worked on and maybe an RFC can
hit the list soon.

Regards,
Mike

[1] http://www.spinics.net/lists/arm-kernel/msg331462.html

> 
> Thanks a lot.
> 
> Best Regards.
> 
> Gabriel.
