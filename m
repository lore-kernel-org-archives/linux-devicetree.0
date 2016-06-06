From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/7] mtd: nand: Add Hynix H27UBG8T2BTR-BC to
 nand_ids table
Date: Mon, 6 Jun 2016 22:31:38 +0200
Message-ID: <20160606223138.3c2032ee@bbrezillon>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
	<1465208664-9366-6-git-send-email-mamlinav@gmail.com>
	<20160606205549.1ecd6fdb@bbrezillon>
	<20160606225903.264abc01647eb1528cc226bd@gmail.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCK63FO5TUHRBNN3265AKGQELJ7ESYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160606225903.264abc01647eb1528cc226bd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 6 Jun 2016 22:59:03 +0300
Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, 6 Jun 2016 20:55:49 +0200
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > On Mon,  6 Jun 2016 13:24:22 +0300
> > Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >   
> > > Add the full description of the Hynix H27UBG8T2BTR-BC NAND chip in the
> > > nand_ids table so that we can later use the NAND ECC infos and ONFI timings
> > > mode in controller drivers.  
> > 
> > Still hoping to get this series [1] merged in 4.8, but if that's
> > not the case, I'll apply your patch.
> > 
> > BTW, that would be great if you could test it on your platforms.
> >   
> 
> It seems that Hynix-specific initialization code can't handle H27UBG8T2BTR-BC
> chip:
> 
> [    0.886153] nand: Could not find valid ONFI parameter page; aborting
> [    0.892665] nand: device found, Manufacturer ID: 0xad, Chip ID: 0xd7
> [    0.899025] nand: Hynix 1c03000.nand
> [    0.902596] nand: bus width 8 instead 16 bit
> [    0.906858] nand: No NAND device found
> [    0.910620] sunxi_nand 1c03000.nand: failed to init nand chips
> [    0.916528] sunxi_nand: probe of 1c03000.nand failed with error -22

Can you try this patch? It should fix the problem [1].

[1]http://code.bulix.org/6hjww1-100494


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
