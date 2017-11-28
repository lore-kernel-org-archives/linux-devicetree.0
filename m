From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] of: overlay locking fixes
Date: Tue, 28 Nov 2017 08:59:47 -0600
Message-ID: <20171128145947.qm7k7di3hexwha4t@rob-hp-laptop>
References: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1511793987-315-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 03:46:25PM +0100, Geert Uytterhoeven wrote:
> 	Hi Pantelis, Rob, Frank,
> 
> Here are two locking fixes for OF overlays, found by code inspection.
> 
> They were compile-tested only, as I'm still working on getting "real"
> (configfs) overlays working again in v4.15-rc1...
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix cleanup order in of_overlay_apply()
>   of: unittest: Remove bogus overlay mutex release from
>     overlay_data_add()

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
