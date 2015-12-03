From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 10/10] dt-bindings: Add DSIv2 documentation
Date: Wed, 2 Dec 2015 23:16:23 -0800
Message-ID: <20151203071623.GB14699@codeaurora.org>
References: <1444827544-25656-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-11-git-send-email-architt@codeaurora.org>
 <CAL_JsqJufZvsGyxZ40+kPcAVr5mXqCi+Qej_8X6=GRxT9j+5+w@mail.gmail.com>
 <564C981F.3040907@codeaurora.org>
 <CAL_JsqJ7PovZsz0=b90bUChKtNra1pXxEjU_DiYAn7JUgShm5Q@mail.gmail.com>
 <5652AE71.4060609@codeaurora.org>
 <20151202082001.GC4139@codeaurora.org>
 <565EC05D.8070009@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565EC05D.8070009@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/02, Archit Taneja wrote:
> On 12/02/2015 01:50 PM, Stephen Boyd wrote:
> >
> >My only thought there would be to make of_clk_set_defaults() wait
> >until both clocks are registered before it does any parent
> >setting. But only in the case where the assigned parents contains
> >a clock that is provided by the node being processed. I suppose
> >the simplest thing to do would be to skip it during the device
> >driver probe and handle it when the clk provider is registered.
> >
> 
> The assigned-clock-parents stuff you mentioned is needed to set a
> default link between the one of the DSI PLLs and the RCG, right? I
> just wanted to make clear if we were still discussing the same
> issue.

Yes.

> 
> From what I understand, we don't need the assigned-clock-parents stuff
> to establish a link between byte_clk_src(RCG clock) and
> byte_clk(branch clock). That's a fixed link set up by the clock
> structs provided in the gcc driver and doesn't need to be specially
> assigned, and just a
> clk_get_parent in the driver does the job there.

There's only one parent of the byte_clk and that's byte_clk_src.
So yes, there's no need to describe that in DT and
clk_get_parent() works fine.

> 
> About assigning a parent to the RCG, wouldn't that be xo by default, and
> changed by the drm/msm driver to one of the PLLs when the need arrives?
> I didn't get why we need to establish that beforehand in DT?
> 

Yes, it would be XO out of reset, but we have no idea what the
bootloader is doing. I thought the problem was that byte_clk_src
is not actually an input to the DSI device. The proposal was to
have DT specify byte_clk_src and byte_clk in the clocks array so
that byte_clk_src could be reparented to the PLL and the byte_clk
could be enabled/disabled. If we use DT to do the parent
configuring then the DSI node doesn't have the byte_clk_src in
its clocks array and thus DT is reflecting reality.

If we want to dynamically switch the parent of byte_clk_src to be
different PLLs at runtime, then yes we'll need to get the parent
of the byte_clk (which is byte_clk_src) and set the PLL as the
parent. Or we'll need to make clk_set_parent() on the byte_clk
transparently set the grand-parent to be the PLL. In that case we
may need to introduce some sort of flag like
CLK_SET_PARENT_GRANDPARENT to add this type of behavior.

I don't have a huge problem with

	clk_set_parent(clk_get_parent(byte_clk), PLL)

except that this fails the abstraction test. It leaks information
about the clock tree into a driver that shouldn't need to know
that on this particular SoC there's a clock in between the PLL
and the byte_clk. Future designs may not have the intermediate
clock and then we'll need to update the driver to handle the
difference, when we could have added the flag and things would
work the same.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
