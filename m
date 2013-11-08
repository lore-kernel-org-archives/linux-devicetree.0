From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Fri, 8 Nov 2013 09:03:54 +0200
Message-ID: <A8EFD62E-39F7-4FBC-B8B7-2D6EA4902195@antoniou-consulting.com>
References: <1383575773-7296-1-git-send-email-panto@antoniou-consulting.com> <CADhT+wdJfrRMDjm+jb_+_uuy8sPRd1B0F5mNVgOL2DmyHTMrYw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADhT+wdJfrRMDjm+jb_+_uuy8sPRd1B0F5mNVgOL2DmyHTMrYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Nov 8, 2013, at 1:43 AM, Dinh Nguyen wrote:

> Hi Pantelis,
> 

Hi Dinh,

[snip]

> +
> +/plugin/;      /* allow undefined label references and record them */
> 
> Should the fragment also need to have the  /dts-v1/; tag as well? The dtc would fail for me if I did not have the /dts-v1/; tag.
> 
> Error: arch/arm/boot/dts/socfpga_overlay.dts:1.1-9 syntax error
> FATAL ERROR: Unable to parse input tree
> 

Yes. The plugin tag only turns on symbol tracking, it doesn't affect the syntax of the DTS input.

> Dinh

Regards

-- Pantelis--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
