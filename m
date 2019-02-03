From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
Date: Sun, 3 Feb 2019 08:20:32 +0100
Message-ID: <20190203082032.6e37c523@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat,  2 Feb 2019 20:19:17 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi,
> 
> As requested by Boris, I added a patch to move all the Ingenic NAND
> drivers to their own directory.
> 
> In this V2 I added support for the JZ4740 SoC. The combo of the
> jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and dusty
> jz4740-nand driver.

Any plan to get the old driver removed? I guess you want to migrate the
boards to DT first.

> 
> To support the only upstream JZ4740-based board we have, the Ben
> Nanonote, I added an option to specify the OOB layout of that device
> from a device property string.
> 
> Finally, I dropped the last two patches that moved the platform NAND
> code to devicetree; I will upstream them as part of a different
> patchset.
> 
> Cheers,
> -Paul
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
