From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mtd: nand: add reworked Marvell NAND controller
 driver
Date: Sun, 7 Jan 2018 22:46:43 +0100
Message-ID: <20180107224643.760eac74@xps13>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
        <20171219132942.27433-3-miquel.raynal@free-electrons.com>
        <20171221111428.0aa3e65e@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221111428.0aa3e65e@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Thu, 21 Dec 2017 11:14:28 +0100
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi Miquel,
> 
> On Tue, 19 Dec 2017 14:29:39 +0100
> Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> > Add marvell_nand driver which aims at replacing the existing
> > pxa3xx_nand driver.
> > 
> > The new driver intends to be easier to understand and follows the
> > brand new NAND framework rules by implementing hooks for every
> > pattern the controller might support and referencing them inside a
> > parser object that will be given to the core at each ->exec_op()
> > call.
> > 
> > Raw accessors are implemented, useful to test/debug
> > memory/filesystem corruptions. Userspace binaries contained in the
> > mtd-utils package may now be used and their output trusted.
> > 
> > Timings may not be kept from the bootloader anymore, the timings
> > used for instance in U-Boot were not optimal and it supposed to
> > have NAND support (and initialized) in the bootloader.  
> 
> Hm, AFAIR the old driver was able to dynamically adjust the timings
> when the NAND was ONFI compliant.
> 
> > 
> > Thanks to the improved timings, implementation of ONFI mode 5
> > support (with EDO managed by adding a delay on data sampling),
> > merging the commands together and optimizing writes in the command
> > registers, the new driver may achieve faster throughputs in both
> > directions. Measurements show an improvement of about +23% read
> > throughput and +24% write throughput. These measurements have been
> > done with an Armada-385-DB-AP (4kiB NAND pages forced in 4-bit
> > strength BCH ECC correction) using the userspace tool 'flash_speed'
> > from the MTD test suite.
> > 
> > Besides these important topics, the new driver addresses several
> > unsolved known issues in the old driver which:
> > - did not work with ECC soft neither with ECC none ;
> > - relied on naked read/write (which is unchanged) while the NFCv1
> >   embedded in the pxa3xx platforms do not implement it, so several
> >   NAND commands did not actually ever work without any notice (like
> >   reading the ONFI PARAM_PAGE or SET/GET_FEATURES) ;
> > - wrote the OOB data correctly, but was not able to read it
> > correctly past the first OOB data chunk ;
> > - did not displayed ECC bytes ;  
> 
> 	    ^display
> 
> and I'm not even sure display is the right term here. How about
> 'retrieve'.
> 
> > - used device tree bindings that did not allow more than one NAND
> > chip, and did not allow to choose the correct chip select if not
> >   incrementing from 0. Plus, the Ready/Busy line used had to be 0.
> > 
> > Old device tree bindings are still supported but deprecated. A more
> > hierarchical view has to be used to keep the controller and the NAND
> > chip structures clearly separated both inside the device tree and
> > also in the driver code.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Tested-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> > Tested-by: Willy Tarreau <w@1wt.eu>
> > ---


I made all the changes you requested, let me the time to do further
tests and I will send a v3.

Thanks,
Miquèl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
