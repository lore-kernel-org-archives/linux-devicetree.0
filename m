From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 17:31:04 +0200
Message-ID: <5766BAB8.9090707@nod.at>
References: <5765A14F.6020201@nod.at>
 <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <20160618232054.GB29476@makrotopia.org> <57665D96.1070804@nod.at>
 <20160619112510.GA820@makrotopia.org> <576689CC.3030809@nod.at>
 <20160619130514.GB820@makrotopia.org> <57669BEA.5030306@nod.at>
 <20160619140952.GC820@makrotopia.org> <5766AD99.1040809@nod.at>
 <20160619152445.GG820@makrotopia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20160619152445.GG820@makrotopia.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Hauke Mehrtens <hauke@hauke-m.de>, dedekind1@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Am 19.06.2016 um 17:24 schrieb Daniel Golle:
>> You mean marking a MTD partition in DT and UBI will attach from it?
>> That makes sense.
> 
> Yes. Currently we just use a naming convention (the first MTD partition
> named 'ubi' will be auto-attached), that's obviously not very clean...

I was about to reply to my own mail that you can still attach by name.
Boris reminded me of that, I forgot that feature.^^
Why is it not clean?

>>
>> To sum up, I asked a lot of questions to understand your use case(s).
>> Everything you described can be done with existing facilities.
>> But I agree that at least some UBI DT machinery would be nice to have
>> although we need to check with DT folks first.
>> At least marking an MTD partition should be fine, hopefully.
> 
> Great. That'd already greatly improve things.

How is that better than attach by name? You mark the to be attached
MTD by its name...

> I can see that sooner or later we will need some way to reference UBI
> volumes in DT, independently of the whole rootfs selection. Vendors do
> use UBI volumes also for things like WiFi EEPROM data. Currentlhy, we
> extract that in user-space and save a copy in /lib/firmware/... for
> things more crazy than plain offsets inside MTD partitions.

Really, please append a decent root= kernel parameter.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
