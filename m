From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH v6] MIPS: NI 169445 board support
Date: Mon, 7 Aug 2017 23:36:03 +0200
Message-ID: <20170807213603.GE3509@linux-mips.org>
References: <1500402549-12090-1-git-send-email-nathan.sullivan@ni.com>
 <20170807152648.GA13214@linux-mips.org>
 <11583742.zienCqJRO5@np-p-burton>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11583742.zienCqJRO5@np-p-burton>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 07, 2017 at 10:24:05AM -0700, Paul Burton wrote:

> One possibility would be for us to split the board portions of vmlinux.its.S 
> out into a file per-board, perhaps board-boston.its.S, board-ni169445.its.S 
> etc. The build process would then have to concatenate the right files to 
> generate the full image tree source.
> 
> Does that sound good to you?

Yes, that sounds good.

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
