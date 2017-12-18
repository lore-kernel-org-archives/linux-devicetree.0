From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
Date: Mon, 18 Dec 2017 09:25:35 +0100
Message-ID: <20171218092535.2ca1fe13@xps13>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
        <20171214070930.0b885f6d@bbrezillon>
        <877etkecig.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <877etkecig.fsf-4ty26DBLk+jEm7gnYqmdkQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>Ezequiel Garcia <ez>
List-Id: devicetree@vger.kernel.org

Hello Robert,

On Mon, 18 Dec 2017 08:11:35 +0100
Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote:

> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
> 
> >> Robert, it would be great if you could also do more testing on PXA
> >> and validate this driver. If needed, a branch ready to be tested is
> >> available at [3]. It is based on nand/next and has all the changes
> >> brought by the previously mentionned series as well as this one.  
> >
> > Robert, do you think you'll have some time to test Miquel's branch
> > on your PXA boards? Miquel already tested on one of these boards
> > (CM-X300), but we'd like to have other testers. Also feel free to
> > review the driver if have the time.
> >
> > Thanks,
> >
> > Boris  
> 
> Hi Boris and Miquel,
> 
> I have applied the whole serie to linux-next yesterday.
> 
> A boot attempt on my zylonite with my old defconfig (with the new
> Marvell NAND config activated) yields to :
>  - this message
> [    3.136818] marvell-nfc pxa3xx-nand: could not identify the nand
> chip [    3.143874] marvell-nfc: probe of pxa3xx-nand failed with
> error -22
>  - then my board hangs
> 
> Is there something to be done to improve the trace level so that you
> can guess what's happening ?

Thank you very much for testing this.

Could you please try this branch [1] instead of linux-next + the
patches?

Also, can you please add #define DEBUG in marvell_nand.c + nand_base.c,
it should help us figuring out what is wrong.

Thank you,
Miquèl

[1] https://github.com/miquelraynal/linux/tree/marvell/nand-next/nfc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
