From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Doc: Micrel-ksz90x1.txt: Update the Micrel phy
 documentation for ksz9031
Date: Thu, 28 Jan 2016 21:33:06 -0600
Message-ID: <20160129033306.GA18787@rob-hp-laptop>
References: <1453999767-26298-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453999767-26298-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 10:49:27AM -0600, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Update the Micrel phy documentation for the KSZ9031 PHY to represent how
> the actual values are calculated from the code.
> 
> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
>  .../devicetree/bindings/net/micrel-ksz90x1.txt     | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> index f9c32ad..9535b2b 100644
> --- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> +++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> @@ -36,6 +36,71 @@ KSZ9031:
>    value is 0, and the maximum is property-dependent. The increment
>    step is 60ps.
>  
> +  The KSZ9031 hardware supports a range of skew values from negative to
> +  positive, where the specific range is property dependent. All values
> +  specified in the devicetree are offset by the minimum value so they
> +  can be represented as positive integers in the devicetree since it's
> +  difficult to represent a negative number in the devictree.

I don't think that is true anymore. dtc should allow negative numbers 
AIUI. That would be much better here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
