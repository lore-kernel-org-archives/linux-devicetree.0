From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add bindings for Dongwoon DW9714 voice
 coil
Date: Mon, 21 Aug 2017 21:24:23 -0500
Message-ID: <20170822022423.dardux2ok3sisdxd@rob-hp-laptop>
References: <1502977376-22836-1-git-send-email-sakari.ailus@linux.intel.com>
 <1502977376-22836-2-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502977376-22836-2-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 17, 2017 at 04:42:54PM +0300, Sakari Ailus wrote:
> Dongwoon DW9714 is a voice coil lens driver.
> 
> Also add a vendor prefix for Dongwoon for one did not exist previously.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt | 9 +++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt           | 1 +
>  2 files changed, 10 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
