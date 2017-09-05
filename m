From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: Adjust status "ok" -> "okay" under
 drivers/of/
Date: Tue, 5 Sep 2017 10:05:57 -0500
Message-ID: <20170905150557.wxphjvtd2vz5ndqp@rob-hp-laptop>
References: <alpine.LFD.2.21.1709020336290.12205@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1709020336290.12205-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 02, 2017 at 03:44:07AM -0400, Robert P. J. Day wrote:
> 
> Tweak a small number of status "ok" lines in a single file under
> /drivers/of/ to use the proper DTSpec 0.1 spelling of "okay".
> 
> Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
> 
> ---
> 
>   since there was a single file under all of drivers/ that had this,
> it seemed trivial to just patch it and be done with it. the vast
> majority of "ok" spellings are under arch/arm*/, and i'm not going
> near that.

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
