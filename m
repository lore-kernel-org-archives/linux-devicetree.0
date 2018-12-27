From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: bridge: lvds-transmitter:
 cleanup example
Date: Thu, 27 Dec 2018 15:27:45 -0600
Message-ID: <20181227212745.GA32760@bogus>
References: <20181219130449.31641-1-peda@lysator.liu.se>
 <20181219130449.31641-3-peda@lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219130449.31641-3-peda@lysator.liu.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@lysator.liu.se>
Cc: linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Dec 2018 14:04:48 +0100, Peter Rosin wrote:
> From: Peter Rosin <peda@axentia.se>
> 
> Drop #address-cells and #size-cells from the root node in the
> example, they are unused.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
