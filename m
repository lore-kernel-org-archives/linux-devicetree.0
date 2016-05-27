From: Rob Herring <robh@kernel.org>
Subject: Re: [STLinux Kernel] [PATCH 02/11] drivers: clk: st: Add clock
 propagation for audio clocks
Date: Fri, 27 May 2016 10:41:59 -0500
Message-ID: <20160527154159.GA17818@rob-hp-laptop>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
 <1463560892-7209-3-git-send-email-gabriel.fernandez@linaro.org>
 <20160525172409.GA27913@rob-hp-laptop>
 <CAG374jDTCJfZB+PuAnggjXhbcd3NjJqrESpe_EnMniCAeoph9A@mail.gmail.com>
 <CAL_JsqLOG4P0H+HkQ3mJhfibatuV2T51KqOn-+U+LK8WUx7QgA@mail.gmail.com>
 <5746F486.602@st.com>
 <CAL_JsqLeD8uTmMYLFZ5Sh9=JV5s1xthvruXL-W=c=zcVS=G-ZA@mail.gmail.com>
 <5747F5E8.5030300@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5747F5E8.5030300@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: loic pallardy <loic.pallardy@st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "kernel@stlinux.com" <kernel@stlinux.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-clk <linux-clk@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Olivier Bideau <olivier.bideau@st.com>, Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Vincent ABRIOU <vincent.abriou@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Srinivas Kandagatla <srinivas.kandagatla@gm>
List-Id: devicetree@vger.kernel.org

On Fri, May 27, 2016 at 09:23:20AM +0200, loic pallardy wrote:
> 
> 
> On 05/26/2016 03:20 PM, Rob Herring wrote:
> >On Thu, May 26, 2016 at 8:05 AM, loic pallardy <loic.pallardy@st.com> wrote:
> >>
> >>
> >>On 05/26/2016 02:46 PM, Rob Herring wrote:
> >>>
> >>>On Thu, May 26, 2016 at 4:49 AM, Gabriel Fernandez
> >>><gabriel.fernandez@linaro.org> wrote:
> >>>>
> >>>>On 25 May 2016 at 19:24, Rob Herring <robh@kernel.org> wrote:
> >>>>>
> >>>>>
> >>>>>On Wed, May 18, 2016 at 10:41:23AM +0200, Gabriel Fernandez wrote:
> >>>>>>
> >>>>>>This patch allows fine tuning of the quads FS for audio clocks
> >>>>>>accuracy.
> >>>>>>

> >>>
> >>>That is no different and suffers the same point I raised. It requires
> >>>updating the DT for any clock configuration change or enhancement.
> >>>
> >>Agree with you, DT update is needed as soon as a clock configuration should
> >>be changed. This is due to STiH clock driver design based on DT description
> >>of SoC clock tree.
> >>
> >>This clock driver was accepted 2 years ago. At the time being there was
> >>discussion about clock tree description location: driver or DT.
> >>Bad choice was done for this driver...
> >>
> >>If we decide to redesign STiH clock driver using in-driver clock tree
> >>description, this will modify STiH clock DT nodes description and so break
> >>DT backward compatibility.
> >>
> >>What's from your pov the best option?
> >
> >You can break it once or every time you need a clock change. I'd go
> >with the former. Maybe more specific compatible strings throughout
> >alone would be enough rather than a flag day changing the binding.
> 
> So if I understand you correctly, main issue is d0 and d2 signification.
> d0 and d2 are indeed location of the flexgen in the SoC. But that's right
> flexgen are dedicated to clocks generation for features (system, audio,
> video).
> What about "st,flexgen-audio" and "st,flexgen-video"?

It is not so much the name of these 2, but whether there are other cases 
for different clock nodes that could need the same thing. If so, update 
them all now rather than 1 by 1.

Rob
