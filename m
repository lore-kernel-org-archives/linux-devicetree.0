From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2.1] dt-bindings: Add Renesas R-Car FCP DT bindings
Date: Wed, 11 May 2016 08:05:18 -0500
Message-ID: <20160511130518.GA1383@rob-hp-laptop>
References: <1461620198-13428-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1462970190-588-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462970190-588-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 03:36:30PM +0300, Laurent Pinchart wrote:
> The FCP is a companion module of video processing modules in the Renesas
> R-Car Gen3 SoCs. It provides data compression and decompression, data
> caching, and conversion of AXI transactions in order to reduce the
> memory bandwidth.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/renesas,fcp.txt      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt

Acked-by: Rob Herring <robh@kernel.org>
