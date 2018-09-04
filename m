From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mtd: describe the simple BCM963XX NOR
 flash layout
Date: Tue, 04 Sep 2018 08:33:23 -0500
Message-ID: <5b8e89a4.1c69fb81.48305.1677@mx.google.com>
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
 <20180828111944.5956-2-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180828111944.5956-2-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 28 Aug 2018 13:19:40 +0200, Jonas Gorski wrote:
> Add binding documentation for the standard CFE based BCM963XX flash
> layout, found in most devices using a BCM63XX SoC with NOR flash.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../brcm,bcm963xx-cfe-nor-partitions.txt           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
