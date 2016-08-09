From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] Add nvd9128 as a simple panel
Date: Tue, 9 Aug 2016 18:58:29 -0500
Message-ID: <20160809235829.GA30321@rob-hp-laptop>
References: <20160804171525.GA15647@rob-hp-laptop>
 <1470390477-24892-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470390477-24892-1-git-send-email-fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 05, 2016 at 11:47:54AM +0200, Fabien Lahoudere wrote:
> Add New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  .../devicetree/bindings/display/panel/nvd,9128.txt |  7 ++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9128.txt
 
Please add acks from previous version when posting new versions.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
