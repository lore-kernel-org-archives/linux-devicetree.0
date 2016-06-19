From: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 18:23:56 +0200
Message-ID: <20160619162355.GI820@makrotopia.org>
References: <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org> <57669BEA.5030306@nod.at>
 <20160619140952.GC820@makrotopia.org> <5766AD99.1040809@nod.at>
 <20160619152445.GG820@makrotopia.org>
 <20160619174351.53678b4c@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160619174351.53678b4c@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, Richard Weinberger <richard@nod.at>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Sun, Jun 19, 2016 at 05:43:51PM +0200, Boris Brezillon wrote:
> Hi Daniel,
> 
> On Sun, 19 Jun 2016 17:24:46 +0200
> Daniel Golle <daniel@makrotopia.org> wrote:
> 
> > Hi Richard,
> > 
> > On Sun, Jun 19, 2016 at 04:35:05PM +0200, Richard Weinberger wrote:
> > > Daniel,
> > > 
> > > Am 19.06.2016 um 16:09 schrieb Daniel Golle:  
> > > >> DT already offer all you need and nothing hinders you from
> > > >> using mtdparts=.  
> > > > 
> > > > I know. However, it's much nicer to define partitions for a specific
> > > > flash chip inside the device tree (I've sent a link to the DTS of the
> > > > BTHOMEHUBV2B to illustrate that, please have a look at it and tell
> > > > me if you'd really like that partitioning currently stored as
> > > > device-tree nodes to be migrated back to 'mtdparts=...'.)  
> > > 
> > > I'd be fine with having the partitions in DT and the UBI kernel parameters
> > > as kernel cmdline also in DT.  
> > 
> > That's the current state of affairs. I'd just want to have it in one
> > place, so if the MTD partitioning gets updated one would see easily how
> > that affects UBI. For that, I don't think it's good enough to have
> > 'ubi.mtd=X' in the cmdline (in DT or wherever, it's a single string in
> > a different place than the MTD partitioning if people use DT for MTD
> > partitioning).
> > 
> > >   
> > > >> I didn't recommend adding glibc+systemd in the initramfs. It can be very, very small
> > > >> and trivial.  
> > > > 
> > > > Again, please understand that the whole production firmware can be as
> > > > small as 3.5 megs for kernel and rootfs. Of course we never use glibc
> > > > or systemd anywhere.  
> > > 
> > > I know these use cases, I design and maintain such stuff for customers.
> > >   
> > > > Yes, it can be done. But you would have to define your flash chips in
> > > > device-tree, you may define the mtd partitions either in DT or by using
> > > > mtdparts=... in the cmdline. Now to define which MTD device to
> > > > ubiattach you will have to use ubi.mtd=X on the cmdline. If you defined
> > > > your partitions inside the of_node of the flash chip, changes there
> > > > (which do happen) may change the index of the partition you want to
> > > > ubi-attach. C'mon. This *is* messy. Just having a compatible-flag to
> > > > attach the partition would already greatly improve things.  
> > > 
> > > You mean marking a MTD partition in DT and UBI will attach from it?
> > > That makes sense.  
> > 
> > Yes. Currently we just use a naming convention (the first MTD partition
> > named 'ubi' will be auto-attached), that's obviously not very clean...
> > 
> > > 
> > > To sum up, I asked a lot of questions to understand your use case(s).
> > > Everything you described can be done with existing facilities.
> > > But I agree that at least some UBI DT machinery would be nice to have
> > > although we need to check with DT folks first.
> > > At least marking an MTD partition should be fine, hopefully.  
> > 
> > Great. That'd already greatly improve things.
> > 
> > I can see that sooner or later we will need some way to reference UBI
> > volumes in DT, independently of the whole rootfs selection. Vendors do
> > use UBI volumes also for things like WiFi EEPROM data. Currentlhy, we
> > extract that in user-space and save a copy in /lib/firmware/... for
> > things more crazy than plain offsets inside MTD partitions.
> 
> Hm, you're clearly abusing the DT role here (and this comment comes from
> someone who tend to think that some of the config information should be
> described in the DT ;)).
> 
> You want to link your partition (which is already a specific usage of
> your flash device, and as such might not even be described in the DT)
> to a Linux specific software layer (UBI).
> Remember that the DT is supposed to be OS agnostic, you clearly don't
> need to describe that in the DT, since everything you need is already
> there (a way to attach the UBI layer to an MTD device by its name).

UBI is supported by U-Boot as well and U-Boot supports storing its
environment inside an UBI volume, loading things from volumes or even
mounting UBIFS, so information about which partition to attach might
already be useful outside of Linux as well.
Apart from that, DT already stores a whole lot of Linux-specific
properties, such as linux,keycodes or for gpio-keys-polled or
linux,default-trigger for LEDs. Not having that information in the
devicetree would definitely make things worse imho.


> 
> Now, if that's something you want to make generic for all the boards
> supporting OpenWrt, you just have to enforce the partition name, and
> make sure the ubi.mtd=<default-ubi-name> parameter is passed on the
> cmdline. IIRC, there's a way to define a default cmdline in case you
> don't have access to the bootloaders.
> 
> This sounds like something that could be done at the build-system level.

True, but devices which do not have UBI will throw some errors to the
log about not being able to attach the device.


> 
> Am I missing something?
> 
> For the EEPROM emulation using UBI volumes part, I'm not sure what you
> want to do exactly? Are you planning to use the nvmem abstraction and
> provide an nvmem wrapper around UBI volumes?

Definitely not something I'd hope to get into at all, however, I can
smell it coming ;)


Cheers


Daniel


> 
> Regards,
> 
> Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
