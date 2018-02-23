From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v1 1/3] mtd: physmap: add dual die entry in devicetree
 binding
Date: Fri, 23 Feb 2018 16:53:40 +0100
Message-ID: <20180223165340.24bb2c6c@bbrezillon>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB001463BD62775C388AEBFD3FA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
 <20180222140542.47340842@bbrezillon>
 <DM2PR12MB0014BEF2B19FED0392EB0366A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <DM2PR12MB0014BEF2B19FED0392EB0366A6CC0@DM2PR12MB0014.namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Bean Huo <beanhuo@outlook.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, beanhuo <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Feb 2018 11:07:17 +0000
Bean Huo <beanhuo@outlook.com> wrote:

> Boris,
> thanks for the review.
> 
> >> + - dual-die-stack: boolean to enable support for the devices with the
> >> +   two dies in stack.  
> 
> >How about making that more future proof and adding a property that
> >directly contains the number of dies (num-dies)?  
> 
> Exactly, I also thought here should add a property, through which it can be compatible
> with all kinds of PNOR for the future more dies stacked device.
> But currently, it doesn't exist  PNOR device with more than two dies, and we
> have no idea about 4/6 dies stacked device operation sequence. so I simply add a boolean
> entry and try to only enable dual-die stacked PNOR firstly.

Actually, I think it's better to think about future evolutions now than
adding a new property every time a vendor decides to add more dies (I
guess the number of dies will always be a power-of-2).

> 
> Maybe I can try to do that in next version patch. the software implementation is so flexible.
> 
> >>
> >>  For JEDEC compatible devices, the following additional properties
> >>  are defined:  
> 



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
