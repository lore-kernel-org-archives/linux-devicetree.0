From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Documentation: dt: misc: Add Aspeed ast2400/2500
 LPC Control bindings
Date: Fri, 27 Jan 2017 15:23:55 -0600
Message-ID: <20170127212355.e35q5gvxk2ds4c5z@rob-hp-laptop>
References: <20170124040533.9144-1-cyrilbur@gmail.com>
 <20170124040533.9144-2-cyrilbur@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124040533.9144-2-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 03:05:33PM +1100, Cyril Bur wrote:
> Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> V2:
> 	s/ASpeed/Aspeed/
> 	Removed incorrect compatible property from the example
> 	Dropped: "This does not have to be the case, provided the reg
> 	  property can give the full address of the mbox registers."
> 	  from the "Device Node" section
> 
>  .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
