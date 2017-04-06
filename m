From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: change fixup of dma-ranges size to error
Date: Thu, 6 Apr 2017 09:03:50 -0500
Message-ID: <CAL_Jsq+GLBtaezUiTbm0DAA2+MjcvxAcCsS-qJrr05YcTO5tdw@mail.gmail.com>
References: <1491459529-31391-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491459529-31391-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 6, 2017 at 1:18 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> of_dma_get_range() has workaround code to fixup a device tree that
> incorrectly specified a mask instead of a size for property
> dma-ranges.  That device tree was fixed a year ago in v4.6, so
> the workaround is no longer needed.  Leave a data validation
> check in place, but no longer do the fixup.  Move the check
> one level deeper in the call stack so that other possible users
> of dma-ranges will also be protected.
>
> The fix to the device tree was in
> commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree").

NACK. This was by design. You can't represent a size of 2^64 or 2^32.
Well, technically you can for the latter, but then you have to grow
#size-cells to 2 for an otherwise all 32-bit system which seems kind
of pointless and wasteful. You could further restrict this to only
allow ~0 and not just any case with bit 0 set.

I'm pretty sure AMD is not the only system. There were 32-bit systems too.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
