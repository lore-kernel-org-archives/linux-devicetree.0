From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 22:14:34 +0200
Message-ID: <20160619221434.6d0202ad@bbrezillon>
References: <20160619112510.GA820@makrotopia.org>
	<576689CC.3030809@nod.at>
	<20160619130514.GB820@makrotopia.org>
	<57669BEA.5030306@nod.at>
	<20160619140952.GC820@makrotopia.org>
	<5766AD99.1040809@nod.at>
	<20160619152445.GG820@makrotopia.org>
	<5766BAB8.9090707@nod.at>
	<20160619161334.GH820@makrotopia.org>
	<20160619185343.14ef0669@bbrezillon>
	<20160619194236.GA1222@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160619194236.GA1222-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 19 Jun 2016 21:42:39 +0200
Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org> wrote:

> Hi Boris,
> 
> On Sun, Jun 19, 2016 at 06:53:43PM +0200, Boris Brezillon wrote:
> > On Sun, 19 Jun 2016 18:13:36 +0200
> > Daniel Golle <daniel-g5gK2j5usbvCyp4qypjU+w@public.gmane.org> wrote:
> >   
> > > Hi Richard,
> > > 
> > > On Sun, Jun 19, 2016 at 05:31:04PM +0200, Richard Weinberger wrote:  
> > > > Am 19.06.2016 um 17:24 schrieb Daniel Golle:    
> > > > >> You mean marking a MTD partition in DT and UBI will attach from it?
> > > > >> That makes sense.    
> > > > > 
> > > > > Yes. Currently we just use a naming convention (the first MTD partition
> > > > > named 'ubi' will be auto-attached), that's obviously not very clean...    
> > > > 
> > > > I was about to reply to my own mail that you can still attach by name.
> > > > Boris reminded me of that, I forgot that feature.^^
> > > > Why is it not clean?    
> > > 
> > > That's nice and I also didn't know that.
> > > It's still not perfect because I got to add it to the cmdline (in DT),
> > > and should have it only on devices where a partition with that given
> > > name actually exists. A flag for the mtd partition would still be
> > > nicer.
> > >   
> > > >     
> > > > >>
> > > > >> To sum up, I asked a lot of questions to understand your use case(s).
> > > > >> Everything you described can be done with existing facilities.
> > > > >> But I agree that at least some UBI DT machinery would be nice to have
> > > > >> although we need to check with DT folks first.
> > > > >> At least marking an MTD partition should be fine, hopefully.    
> > > > > 
> > > > > Great. That'd already greatly improve things.    
> > > > 
> > > > How is that better than attach by name? You mark the to be attached
> > > > MTD by its name...    
> > > 
> > > See above. We'd then still need to have that ubi.mtd=name in the
> > > cmdline for NAND devices using UBI and *not* have it for other devices
> > > within the same family which may use SPI or NOR flash without UBI.
> > > I'd prefer to have one place inside the device-tree for everything
> > > flash-storage related, eg.
> > > &nand {
> > > 	status = "okay";
> > > 	partition@0 {
> > > 		label = "boot";
> > > 		reg = <0x00000000 0x00e00000>;
> > > 		read-only;
> > > 	};
> > > 
> > > 	partition@e00000 {
> > > 		label = "data";
> > > 		compatible = "ubi,device";  
> > 
> > So, if we follow your logic we should also have
> > 
> > 		compatible = "jffs2,file-system";
> > 
> > Because JFFS2 is an MTD user, just as UBI is.  
> 
> Well, if there was any use for that, then yes, we should have that.
> However, if root=/dev/mtdblockX is set, the filesystem type simply
> doesn't matter as it is being probed and thus there simply is no
> real need for that.
> 
> In some rare cases the bootloader may make use of JFFS2 and a certain
> (/boot) partition is thus required to be JFFS2 no-matter-what. In that
> case I'd agree, there should be such a thing as "jffs2,file-system" set
> in DT (but that's a very rare corner case and abuse would probably
> prevail over ligitimate use-cases).
> 
> In the end, the classication as "is an MTD user" isn't relevant for
> this debate imho.

It is, because supporting the UBI specific case is just an open door to
supporting any specific cases people might have, and how should we
justify that UBI is more legitimate than others.

> 
> > 
> > Let's see what Rob and other DT maintainers think about that.
> > 
> > Still, it seems to me that you're trying to solve a problem in the
> > kernel when it should actually be solved in an upper layer.  
> 
> It's definitely inside the grey-zone of early-userland... Doing things
> which need to be done to mount the root filesystem are traditionally
> the exceptions of things which are user-land and yet happen inside
> the kernel before executing init.

But I've never seen any DT properties specifying which FS should be
used on a block device...
I know, partitions on block devices are stored in a dedicated partition
table, and MTD partitions are not (or let's say that most of the time
they are not).

But still, I think the software stack you put on top of your storage
device should not appear in the DT.

Now, if all other people think this is sane to do it, I won't block it.

> 
> > 
> > Another option would be to try attaching UBI (along with all possible
> > MTD users) to all the the MTD partitions. That's what's done for block
> > filesystems when rootfstype is not specified.  
> 
> Correct, but in case of filesystems, it is only done for the specified
> partition/device. Probing all partitions sounds nice, however, please
> keep in mind that MTD partitions may overlap and there may be
> left-overs from previous UBI devices.

Overlapping partitions are unsafe in general, no matter what you want to
do with it. The only valid case would be 1 RW partition and several RO
partitions overlapping with the RW one.
The other accepted use case is exposing the master device (the real MTD
device under MTD partitions). But in any case, using 2 overlapping
partitions in // and both in RW mode is unsafe and should be avoided.

> Simply trying to ubiattach *all*
> available MTD devices will need quite some extra work to handle all
> potential outcomes of trying to attach non-UBI or
> broken/corrupted/wrongly-sized UBI partitions.

Attaching broken/corrupted/wrongly-sized partitions will still fail,
except they might be detected as valid UBI partition by the
auto-detection code, which would trigger a full attach step.
The only drawback is that you might try something that has been
corrupted, but this is already the case with the current approach.

BTW, I don't expect to see a lot of systems defining several UBI
devices attached to a single MTD device. So this only leaves the
multi-devices case. And of course this auto-detection logic would have
to be explicitly enabled, so the penalty would only impact those
enabling this feature.

> Generally, I believe that's actually the only good alternative, but I
> doubt it can easily made as robust and reliable compared to hinting
> which mtd device to ubiattach via the devicetree.

As I said, I'm not in favor of putting this kind of information in the
DT, so I'm trying to find other approaches to solve your problem ;).

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
