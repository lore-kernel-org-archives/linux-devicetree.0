From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 12/14] mtd: maps: Merge gpio-addr-flash.c into
 physmap-core.c
Date: Sun, 14 Oct 2018 09:06:06 +0200
Message-ID: <20181014090606.12c9baac@bbrezillon>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-13-boris.brezillon@bootlin.com>
 <CAPybu_3ZTNzB=PmidBRzW_ZG_H5Pwwp7sro52LuO58XpOzq+Tg@mail.gmail.com>
 <20181009091106.7f25a314@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181009091106.7f25a314@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 9 Oct 2018 09:11:06 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Tue, 9 Oct 2018 09:04:51 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> 
> > Hi Boris
> > 
> > Maybe we want to leave the pdata example.
> > 
> > /**
> >  * The platform resource layout expected looks something like:
> >  * struct mtd_partition partitions[] = { ... };
> >  * struct physmap_flash_data flash_data =
> > .....  
> 
> Sure, I'll add it back.

Actually I changed my mind on that one. The physmap driver did not
document that in the first place, so, if we want to add this example,
we should do it in a separate patch, and maybe place it next to the
physmap_flash_data struct definition. This being said, I don't see a
lot of drivers documenting this sort of things and I doubt new
platforms will use pdata to describe their device anyway.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
