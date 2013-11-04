From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Mon, 4 Nov 2013 15:17:25 -0600
Message-ID: <1383599845.10624.3.camel@linux-builds1>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383575773-7296-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2013-11-04 at 16:36 +0200, Pantelis Antoniou wrote:
> Enable the generation of symbol & fixup information for
> usage with dynamic DT loading.
> 
> Passing the -@ option generates a __symbols__ node at the
> root node of the resulting blob for any node labels used.
> 
> When using the /plugin/ tag all unresolved label references
> be tracked in the __fixups__ node, while all local phandle
> references will the tracked in the __local_fixups__ node.
> 
> This is sufficient to implement a dynamic DT object loader.
> 
> Changes since v1:
> 
> * Forward ported to 1.4 version
> * Added manual entries for the -@ option
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> ---

Can I ask what repo/branch this is based on? It did not apply cleanly
for me on 1.4.

I would like to test it along with the FPGA manager.

Thanks,
Dinh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
