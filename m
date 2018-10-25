From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: drm/panel: simple: Innolux TV123WAM is
 actually P120ZDG-BF1
Date: Thu, 25 Oct 2018 14:49:37 -0500
Message-ID: <20181025194937.GA11705@bogus>
References: <20181022204639.8558-1-dianders@chromium.org>
 <20181022204639.8558-6-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181022204639.8558-6-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Sandeep Panda <spanda@codeaurora.org>, linux-arm-msm@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsanka@codeaurora.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 22 Oct 2018 13:46:39 -0700, Douglas Anderson wrote:
> As far as I can tell the bindings that were added in commit
> 9c04400f7ea6 ("dt-bindings: drm/panel: Document Innolux TV123WAM panel
> bindings") weren't actually for Innolux TV123WAM but were actually for
> Innolux P120ZDG-BF1.
> 
> As far as I can tell the Innolux TV123WAM isn't a real panel and but
> it's a mosh between the TI TV123WAM and the Innolux P120ZDG-BF1.
> Let's unmosh.
> 
> Here's my evidence:
> 
> * Searching for TV123WAM on the Internet turns up a TI panel.  While
>   it's possible that an Innolux panel has the same model number as the
>   TI Panel, it seems a little doubtful.  Looking up the datasheet from
>   the TI Panel shows that it's 1920 x 1280 and 259.2 mm x 172.8 mm.
> 
> * As far as I know, the patch adding the Innolux Panel was supposed to
>   be for the board that's sitting in front of me as I type this
>   (support for that board is not yet upstream).  On the back of that
>   panel I see Innolux P120ZDZ-EZ1 rev B1.
> 
> * Someone pointed me at a datasheet that's supposed to be for the
>   panel in front of me (sorry, I can't share the datasheet).  That
>   datasheet has the string "p120zdg-bf1"
> 
> * If I search for "P120ZDG-BF1" on the Internet I get hits for panels
>   that are 2160x1440.  They don't have datasheets, but the fact that
>   the resolution matches is a good sign.
> 
> While we doing the rename, also mention that no-hpd can be used with
> this panel.  See the previous patch in this series ("drm/panel:
> simple: Add "no-hpd" delay for Innolux TV123WAM").
> 
> Fixes: 9c04400f7ea6 ("dt-bindings: drm/panel: Document Innolux TV123WAM panel bindings")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> ---
> 
>  .../{innolux,tv123wam.txt => innolux,p120zdg-bf1.txt}     | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/display/panel/{innolux,tv123wam.txt => innolux,p120zdg-bf1.txt} (70%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
