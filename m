From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Date: Fri, 19 Jan 2018 15:24:46 -0600
Message-ID: <20180119212446.ze4m6sjmh6vfqgah@rob-hp-laptop>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 02:58:50AM +0200, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings, representing
> them as part of the DU is deprecated.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/renesas,du.txt     | 26 +++++++++-------------
>  1 file changed, 11 insertions(+), 15 deletions(-)

This is the easy part. :)

Reviewed-by: Rob Herring <robh@kernel.org>
