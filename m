From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2 3/4] ARM: mm: add support for HW coherent systems in
 PL310
Date: Wed, 14 May 2014 15:34:48 +0100
Message-ID: <20140514143448.GD19866@localhost>
References: <1399975839-5311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399975839-5311-4-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399975839-5311-4-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 13, 2014 at 11:10:38AM +0100, Thomas Petazzoni wrote:
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -8,6 +8,8 @@ Required properties:
>  
>  - compatible : should be one of:
>    "arm,pl310-cache"
> +  "arm,pl310-coherent-cache", used for I/O coherent platforms using
> +     the PL310 cache
>    "arm,l220-cache"
>    "arm,l210-cache"
>    "bcm,bcm11351-a2-pl310-cache": DEPRECATED by "brcm,bcm11351-a2-pl310-cache"

The binding name kind of implies that we have a transparent PL310 cache
(at least to me), which is not the case. I would rather have a specific
dma-coherent property or something similar since it's not another type
of PL310 but rather a different SoC topology.

But I recall you mentioned that you can't make this decision at the DT
level since you don't know before whether the SoC is I/O coherent or
not.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
