From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6 1/3] ARM:dt-bindings Intel FPGA Video and Image
 Processing Suite
Date: Thu, 17 Aug 2017 10:22:24 -0500
Message-ID: <20170817152147.d4bqny5wmrexh3bu@rob-hp-laptop>
References: <1502434187-6407-1-git-send-email-hean.loong.ong@intel.com>
 <1502434187-6407-2-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502434187-6407-2-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Hean-Loong, Ong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ong@rob-hp-laptop
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 02:49:45PM +0800, Hean-Loong, Ong wrote:
> From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

"dt-bindings: display: ..." for the subject. With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> Device tree binding for Intel FPGA Video and Image
> Processing Suite. The binding involved would be generated
> from the Altera (Intel) Qsys system. The bindings would
> set the max width, max height, buts per pixel and memory
> port width. The device tree binding only supports the Intel
> Arria10 devkit and its variants. Vendor name retained as
> altr.
> 
> Signed-off-by: Ong, Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
> V6:
> Fix comments for description

A completely useless version history. You should describe the diff 
between versions.

> 
> V5:
> *Fix comments on description
> *remove bindings for bits per symbol as it has only one value which is 8
> 
> V4:
> *Fix comments on description
> 
> V3:
> *Fix comments on description
> 
> V2:
> *Fix comments on description
> 
> V1:
> *Fix comments on description
> ---
> ---
>  .../devicetree/bindings/display/altr,vip-fb2.txt   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
