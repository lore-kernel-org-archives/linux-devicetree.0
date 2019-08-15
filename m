From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Date: Thu, 15 Aug 2019 16:15:59 +0200
Message-ID: <20190815141559.GB2437@ravnborg.org>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Eric Anholt <eric@anholt.net>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renes>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio

> it appears that Rob has been busy converting the dt-bindings relevant to this
> series, and his changes are now found in linux-next. Most notably
> Documentation/devicetree/bindings/display/panel/panel-lvds.txt has now become
> Documentation/devicetree/bindings/display/panel/lvds.yaml
> 
> You have already taken patch:
> https://patchwork.kernel.org/patch/11072749/
> 
> as such the patch I am sending you is still related to:
> Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> 
> Patch "dt-bindings: display: Add bindings for Advantech IDK-2121WR" is still
> assuming the format is .txt, as I am not too sure about what the protocol is in
> this case? Shall we take this patch and convert it later to .yaml or shall I
> convert it to .yaml straight away?
> 
> Please, let me know what's the best course of action.

It is preferred that all new display and panel bindings uses the new
meta-schema format.
And that the writers uses the available tools to verify the bindings
submission.
This is one way to avoid simple mistakes in examples.

	Sam
