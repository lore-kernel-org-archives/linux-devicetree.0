From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Fri, 17 Jan 2014 17:58:13 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Seif Mazareeb <seif@marvell.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Gregory Clement <gregory.clement@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

>From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
>
>This patch is our first proposal to address the need for a suitable ECC
>devicetree binding.
>
>NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
>binding. See for instance the binding for OMAP:
>
> - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
>	"sw"		<deprecated> use "ham1" instead
>	"hw"		<deprecated> use "ham1" instead
>	"hw-romcode"	<deprecated> use "ham1" instead
>	"ham1"		1-bit Hamming ecc code
>	"bch4"		4-bit BCH ecc code
>	"bch8"		8-bit BCH ecc code
>
>Other drivers (such as pxa3xx-nand) have similar requirements, with special
>(controller-specific) ECC modes. Instead of adding a possibly different binding
>per compatible-string, let's add generic ECC strength and ECC step size.
>
>This properties should describe completely the ECC mode and let drivers choose
>the appropriate ECC mode.
>
Yes, this is good approach.
It was found earlier that generic NAND DT bindings are not much use to other
controllers as well, as different h/w engines have different interpretations.
Brian Norris had similar comments giving example of his hardware.
(hope following reference helps).

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-September/048869.html

with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
