From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 10/10] dt-bindings: Add DSIv2 documentation
Date: Wed, 2 Dec 2015 00:20:01 -0800
Message-ID: <20151202082001.GC4139@codeaurora.org>
References: <1444827544-25656-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-11-git-send-email-architt@codeaurora.org>
 <CAL_JsqJufZvsGyxZ40+kPcAVr5mXqCi+Qej_8X6=GRxT9j+5+w@mail.gmail.com>
 <564C981F.3040907@codeaurora.org>
 <CAL_JsqJ7PovZsz0=b90bUChKtNra1pXxEjU_DiYAn7JUgShm5Q@mail.gmail.com>
 <5652AE71.4060609@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5652AE71.4060609@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/23, Archit Taneja wrote:
> 
> 
> On 11/21/2015 1:29 AM, Rob Herring wrote:
> >+Stephen
> >
> >On Wed, Nov 18, 2015 at 9:24 AM, Archit Taneja <architt@codeaurora.org> wrote:
> >>Hi Rob,
> >>
> >>On 11/18/2015 6:48 PM, Rob Herring wrote:
> >>>
> >>>+dt list
> >>>
> >>>On Wed, Nov 18, 2015 at 4:55 AM, Archit Taneja <architt@codeaurora.org>
> >>>wrote:
> >>>>
> >>>>Add additional property info needed for DSIv2 DT.
> >>>
> >>>
> >>>Please use get_maintainers.pl.
> >>
> >>
> >>Sorry about that, missed out doing that posting this time.
> >>
> >>>
> >>>>Signed-off-by: Archit Taneja <architt@codeaurora.org>
> >>>>---
> >>>>   Documentation/devicetree/bindings/display/msm/dsi.txt | 10 +++++++++-
> >>>>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>>>
> >>>>diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>>>b/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>>>index f344b9e..ca65a34 100644
> >>>>--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>>>+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>>>@@ -13,18 +13,25 @@ Required properties:
> >>>>   - power-domains: Should be <&mmcc MDSS_GDSC>.
> >>>>   - clocks: device clocks
> >>>>     See Documentation/devicetree/bindings/clocks/clock-bindings.txt for
> >>>>details.
> >>>>-- clock-names: the following clocks are required:
> >>>>+- clock-names: these vary based on the DSI version. For DSI6G:
> >>>>     * "bus_clk"
> >>>>     * "byte_clk"
> >>>>+  * "byte_clk_src
> >>>
> >>>
> >>>This sounds like the parent of byte_clk. Is that really a clock within
> >>>the block?
> >>
> >>
> >>byte_clk_src isn't in the block, but byte_clk_src's parent is one of
> >>the PLLs in this block. We take this clock so that we can re-parent
> >>it to an appropriate PLL. The decision of what PLL to choose needs to
> >>be done by the DSI block's driver.
> >
> >Seems like abuse to me. The list of clocks should match what are
> >inputs to the block, not what the driver happens to need. Without a
> >full understanding of the clock tree here, I don't have a suggestion.
> >Maybe Stephen does.
> 
> We don't need specify byte_clk_src (and other xyz_clk_src clocks) via
> DT. There is a static link set up between byte_clk and byte_clk_src by
> our clock driver that never changes. We can retrieve it in the driver
> itself using clk_get_parent(byte_clk). This way we stick to only
> input clocks.
> 
> Stephen, does that sound okay?
> 

I guess so. From the DT perspective it's "correct" so sure.

It would be nice if we could use assigned-clock-parents though.
As far as I can recall that's hard because the clock tree looks
like a cyclic graph when we take a clock provider level view. The
display block consumes the byte_clk and provides the source of it
too. So if we used assigned parents we would need to wait for
both clocks to be registered with the framework before we can
reconfigure the parent of byte_clk_src to be the PLL that the
display clock outputs. Unfortunately, of_clk_set_defaults() is
called during device driver probe, which in the display driver
case would be before the PLL is registered.

My only thought there would be to make of_clk_set_defaults() wait
until both clocks are registered before it does any parent
setting. But only in the case where the assigned parents contains
a clock that is provided by the node being processed. I suppose
the simplest thing to do would be to skip it during the device
driver probe and handle it when the clk provider is registered.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
