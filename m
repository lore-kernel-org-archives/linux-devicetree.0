From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: consolidate display related bindings
Date: Wed, 4 Nov 2015 10:00:55 -0600
Message-ID: <CAL_JsqKfwxBRrej8eAomfO6RhyErsY7J76c3OdX75sd8eqGazA@mail.gmail.com>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
 <1443737554-10352-2-git-send-email-robh@kernel.org> <20151104144724.GA2553@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151104144724.GA2553@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 4, 2015 at 8:47 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Oct 01, 2015 at 05:12:27PM -0500, Rob Herring wrote:
>> This is a quite large renaming to consolidate display related bindings
>> into a single "display" directory from various scattered locations of
>> video, drm, gpu, fb, mipi, and panel. The prior location was somewhat
>> based on the Linux driver location, but bindings should be independent
>> of that.
>
> Sorry for being so late to comment on this. I hadn't seen the patches
> before and noticed only because various bindings that I chanced to look
> at had moved in linux-next.
>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Cc: Pawel Moll <pawel.moll@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
>> Cc: Kumar Gala <galak@codeaurora.org>
> [...]
>> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> similarity index 100%
>> rename from Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
>> rename to Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>
> That's not quite correct in my opinion. host1x is a top-level module
> that is the parent for a number of hardware blocks, only some of which
> are display-related. host1x itself has nothing to do with display at
> all, except perhaps for providing syncpoints for VBLANK counters. It's
> not a GPU either, though the GPU hardware blocks are children (at least
> on generations before Tegra124). Other children include hardware blocks
> that do video encoding and decoding, so aren't really related to display
> either.

It is no worse than before and "display" is somewhat more general than
"gpu" was. There's other things like i.MX IPU that similarly don't fit
well. I'm not looking to solve all those cases at this point. I
haven't even looked at bindings/media/ yet...

> I suppose Documentation/devicetree/bindings/bus might be a more adequate
> location for the host1x bindings, but then we'd need to split out the
> display related pieces, and possibly refer to the host1x document from
> them. The gr2d and gr3d could then be kept in the gpu subdirectory.
>
> Also the MIPI block is a calibration block that's used for both DSI and
> CSI lanes, so it's used for both video display and capture. I can't
> think of a good location for those.

For both cases, unless we have similar bindings living in multiple
places, the location is not so important IMO.

> Also I notice that this patch doesn't update the MAINTAINERS entries
> pointing at these documents, so maintainers will now no longer get Cc'ed
> on patches that modify the bindings. Do you plan on fixing that up your-
> self or do you expect maintainers to send patches, possibly after
> further cleanup of the bindings?

I'll update MAINTAINERS.

Rob
