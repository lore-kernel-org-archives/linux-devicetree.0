From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/13] devicetree/bindings: display: Add bindings for
 two Mitsubishi panels
Date: Mon, 21 Nov 2016 10:49:51 -0600
Message-ID: <20161121164951.brssvqc4n5ydkm45@rob-hp-laptop>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479526093-7014-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 19, 2016 at 05:28:03AM +0200, Laurent Pinchart wrote:
> The AA104XD12 and AA121TD01 are LVDS display panels. Their bindings are
> modelled on the the LVS panel bindings.

s/LVS/LVDS/

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../display/panel/mitsubishi,aa104xd12.txt         | 47 ++++++++++++++++++++++
>  .../display/panel/mitsubishi,aa121td01.txt         | 47 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt

With that,

Acked-by: Rob Herring <robh@kernel.org>
