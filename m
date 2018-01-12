From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Date: Fri, 12 Jan 2018 19:21:42 +0100
Message-ID: <20180112192142.6541edf4@xps13>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
        <20180111222833.GA15584@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111222833.GA15584-K+wRfnb2/UA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Tarreau <w@1wt.eu>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Willy,

On Thu, 11 Jan 2018 23:28:33 +0100
Willy Tarreau <w@1wt.eu> wrote:

> Hi Miquel,
> 
> On Tue, Jan 09, 2018 at 11:36:30AM +0100, Miquel Raynal wrote:
> > These changes have been tested on:
> >    - PXA3xx platform with a CM-X300 board (2kiB page NAND, 1b/512B
> >      strength, Hamming ECC engine) [32 bits]
> >    - Armada 385 DB AP (4kiB page NAND, 4b/512B, BCH ECC engine) [32
> > bits]
> >    - Armada 398 DB (4kiB page NAND, 8b/512B, BCH ECC engine using a
> > layout with a last chunk different than the others) [32 bits]
> >    - Armada 7040 DB and Armada 8040 DB (4kiB page NAND, 4b/512B,
> > BCH ECC engine) [64 bits]
> >    - Triax dvb-tc board (2kiB page NAND, 4b/512B, BCH ECC engine)
> > [32 bits]  
> 
> If you're interested, I have a mirabox with an armada 370 which uses
> the same driver. I've not powered it up for a while but if that can
> be useful I can try to find some time for this.

Thank you very much for the proposal!

For the moment I don't think there is a need as this type of platform
has already been tested, but I keep it in mind.

Thanks again!
Miquèl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
