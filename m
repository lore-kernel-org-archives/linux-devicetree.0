From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: mtd: add Marvell NAND controller
 documentation
Date: Thu, 11 Jan 2018 16:25:50 -0600
Message-ID: <20180111222550.nxus25nqoyvhq22r@rob-hp-laptop>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180109103637.23798-3-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180109103637.23798-3-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ezequiel
List-Id: devicetree@vger.kernel.org

On Tue, Jan 09, 2018 at 11:36:32AM +0100, Miquel Raynal wrote:
> Document the legacy and the new bindings for Marvell NAND controller.
> 
> The pxa3xx_nand.c driver does only support legacy bindings, which are
> incomplete and inaccurate. A rework of this controller (called
> marvell_nand.c) does support both.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/marvell-nand.txt       | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
