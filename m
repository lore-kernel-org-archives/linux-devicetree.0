From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/10] dt-bindings: fsi: Add optional property
 no-scan-on-init
Date: Mon, 12 Feb 2018 08:36:54 -0600
Message-ID: <20180212143654.xh3vrhvvj62mdtog@rob-hp-laptop>
References: <20180212051549.8575-1-joel@jms.id.au>
 <20180212051549.8575-10-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180212051549.8575-10-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Brad Bishop <bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org>, Edward James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 03:45:48PM +1030, Joel Stanley wrote:
> From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> 
> Add an optional FSI master property 'no-scan-on-init.  This
> can be specified to indicate that a master should not be
> automatically scanned at init time.  This is required in cases
> where a scan could interfere with another FSI master on the same
> bus.
> 
> Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> Acked-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Please add acks/reviews when posting new versions.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
