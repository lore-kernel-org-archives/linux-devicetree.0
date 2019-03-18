From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
Date: Mon, 18 Mar 2019 22:39:05 +0100
Message-ID: <20190318223905.18f020f2@xps13>
References: <20190313222259.28704-1-paul@crapouillou.net>
        <20190313222259.28704-9-paul@crapouillou.net>
        <20190315094009.66b91ad5@xps13>
        <1552660654.1727.0@crapouillou.net>
        <1552941429.1495.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552941429.1495.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, od@zcrc.me, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 18 Mar 2019 21:37:09
+0100:

> Hi,
> 
> Le ven. 15 mars 2019 à 15:37, Paul Cercueil <paul@crapouillou.net> a écrit :
> > Hi,
> > 
> > Le ven. 15 mars 2019 à 9:40, Miquel Raynal > <miquel.raynal@bootlin.com> a écrit :  
> >> Hi Paul,  
> >> >> Paul Cercueil <paul@crapouillou.net> wrote on Wed, 13 Mar 2019 >> 23:22:56  
> >> +0100:  
> >> >>>  Use the 'ecc-engine' standard property instead of the custom  
> >>>  'ingenic,bch-controller' custom property, which is now deprecated.  
> >>> >>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>  
> >>>  ---  
> >>> >>>  Notes:  
> >>>      v5: New patch  
> >>> >>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---  
> >>>   1 file changed, 10 insertions(+), 3 deletions(-)  
> >>> >>>  diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c >>> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c  
> >>>  index d7f3a8c3abea..30436ca6628a 100644
> >>>  --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> >>>  +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> >>>  @@ -82,9 +82,9 @@ static struct ingenic_ecc >>> *ingenic_ecc_get(struct device_node *np)  
> >>> >>>   /**  
> >>>    * of_ingenic_ecc_get() - get the ECC controller from a DT node
> >>>  - * @of_node: the node that contains a bch-controller property.
> >>>  + * @of_node: the node that contains a ecc-engine property.  
> >> >> Would "contains an ecc-engine property" be better English?
> >> >> I am not sure what is the rule when it comes to plain English with  
> >> variable names. However if you agree, no need to re-send the series, >> I
> >> can fix it when applying.  
> > 
> > Yes, that's better.
> >   
> >> BTW, I added hw ECC engines support to my generic ECC engine
> >> implementation, but migrating the whole raw NAND subsystem (using I/O
> >> requests like in the SPI-NAND core, adding prepare/finish_io_req >> hooks)
> >> is going to be much more invasive than initially expected, so I am >> not
> >> sure I will finish the migration any time soon.  
> > 
> > Ok, I will follow the development then.
> >   
> >> Thanks,
> >> Miquèl  
> > 
> > One thing I notice with my patchset: it works perfectly on top of > 4.20,
> > but on top of 5.0 I am unable to erase any eraseblock with > flash_erase.
> > I get -EIO every time. I'm trying to debug it but didn't go very far,
> > it looks like nand_status_op() gives me a status of 0xff. Do you know
> > what could have changed between 4.20 and 5.0 that could trigger this > bug?  
> 
> Nevermind. It works now.

Great!

> 
> > Second thing, everytime I reboot it fails to find the BBT. That's > because
> > the BBT marker is overwritten by the ECC data as they occupy the same > area
> > in the OOB space. Is there a way to move the BBT marker? Or should I > use
> > NAND_BBT_NO_OOB then? Since the eraseblocks where the BBTs are located
> > is used in my system partition, won't that conflict with the data?  
> 
> Response to myself: It's possible to move the BBT marker. But in my case I
> have to deal with three possible layouts, so it's simpler to just use
> NAND_BBT_NO_OOB then. The BBT pages are marked so that they're not used
> for data in the partitions.

Maybe you should check Frieder's series:

mtd: rawnand: Support bad block markers in first, second or last page


Thanks,
Miquèl
