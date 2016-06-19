From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 18:53:43 +0200
Message-ID: <20160619185343.14ef0669@bbrezillon>
References: <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org> <57669BEA.5030306@nod.at>
 <20160619140952.GC820@makrotopia.org> <5766AD99.1040809@nod.at>
 <20160619152445.GG820@makrotopia.org> <5766BAB8.9090707@nod.at>
 <20160619161334.GH820@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20160619161334.GH820@makrotopia.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Daniel Golle <daniel@makrotopia.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, Richard Weinberger <richard@nod.at>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 19 Jun 2016 18:13:36 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Hi Richard,
> 
> On Sun, Jun 19, 2016 at 05:31:04PM +0200, Richard Weinberger wrote:
> > Am 19.06.2016 um 17:24 schrieb Daniel Golle:  
> > >> You mean marking a MTD partition in DT and UBI will attach from it?
> > >> That makes sense.  
> > > 
> > > Yes. Currently we just use a naming convention (the first MTD partition
> > > named 'ubi' will be auto-attached), that's obviously not very clean...  
> > 
> > I was about to reply to my own mail that you can still attach by name.
> > Boris reminded me of that, I forgot that feature.^^
> > Why is it not clean?  
> 
> That's nice and I also didn't know that.
> It's still not perfect because I got to add it to the cmdline (in DT),
> and should have it only on devices where a partition with that given
> name actually exists. A flag for the mtd partition would still be
> nicer.
> 
> >   
> > >>
> > >> To sum up, I asked a lot of questions to understand your use case(s).
> > >> Everything you described can be done with existing facilities.
> > >> But I agree that at least some UBI DT machinery would be nice to have
> > >> although we need to check with DT folks first.
> > >> At least marking an MTD partition should be fine, hopefully.  
> > > 
> > > Great. That'd already greatly improve things.  
> > 
> > How is that better than attach by name? You mark the to be attached
> > MTD by its name...  
> 
> See above. We'd then still need to have that ubi.mtd=name in the
> cmdline for NAND devices using UBI and *not* have it for other devices
> within the same family which may use SPI or NOR flash without UBI.
> I'd prefer to have one place inside the device-tree for everything
> flash-storage related, eg.
> &nand {
> 	status = "okay";
> 	partition@0 {
> 		label = "boot";
> 		reg = <0x00000000 0x00e00000>;
> 		read-only;
> 	};
> 
> 	partition@e00000 {
> 		label = "data";
> 		compatible = "ubi,device";

So, if we follow your logic we should also have

		compatible = "jffs2,file-system";

Because JFFS2 is an MTD user, just as UBI is.

Let's see what Rob and other DT maintainers think about that.

Still, it seems to me that you're trying to solve a problem in the
kernel when it should actually be solved in an upper layer.

Another option would be to try attaching UBI (along with all possible
MTD users) to all the the MTD partitions. That's what's done for block
filesystems when rootfstype is not specified.


> 		reg = <0x00e00000 0x07200000>;
> 	};
> };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
