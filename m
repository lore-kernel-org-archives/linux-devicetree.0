From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: drm/panel: simple: Innolux TV123WAM
 is actually P120ZDG-BF1
Date: Mon, 29 Oct 2018 10:10:52 +0100
Message-ID: <5b059dbe-efb2-c379-beb6-216a6bcedcba@samsung.com>
References: <20181025222134.174583-1-dianders@chromium.org>
        <CGME20181025222234epcas5p49f58ac6ec1f0fa0ef1b5f35162b215a3@epcas5p4.samsung.com>
        <20181025222134.174583-5-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025222134.174583-5-dianders@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Sandeep Panda <spanda@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, ryandcase@chromium.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On 26.10.2018 00:21, Douglas Anderson wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>

Grats for good deduction.


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
