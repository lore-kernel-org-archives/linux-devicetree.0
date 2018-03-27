From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness supports
Date: Tue, 27 Mar 2018 11:03:16 -0500
Message-ID: <1522166596.5274.6.camel@buserror.net>
References: <20180312081128.8195-1-prabhakar.kushwaha@nxp.com>
 <20180323093408.230a61c1@bbrezillon>
 <VI1PR0402MB385456DB28FE27FCF9ACCAB997AC0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR0402MB385456DB28FE27FCF9ACCAB997AC0@VI1PR0402MB3854.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org" <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, Poonam Aggrwal <poonam.aggrwal@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-03-27 at 12:06 +0000, Prabhakar Kushwaha wrote:
> Hi Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > Sent: Friday, March 23, 2018 2:04 PM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>;
> > robh@kernel.org
> > Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org;
> > mark.rutland@arm.com; shawnguo@kernel.org; boris.brezillon@free-
> > electrons.com; computersforpeace@gmail.com; oss@buserror.net; Leo Li
> > <leoyang.li@nxp.com>; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness
> > supports
> > 
> > You still haven't answered the comments I made on your v5. To me, this
> > does
> > not represent how the controller and chip pins are connected, but how the
> > chip was programmed and which endianness should be used by the
> > controller to correctly read the data back. Maybe I'm wrong, hence my
> > question.
> > 
> 
> NXP's ARM SoC has IFC module which interface with NOR flash. Here IFC is big
> endian module connected with NOR flash. 
> As SoC has ARM processor(Littler Endian),  CONFIG_MTD_CFI_BE_BYTE_SWAP needs
> to be enabled  to make sure data is read correctly.  
> This is the reason, I wrote about connection between controller and flash.
> 
> In a way, I agree with you.  It is not about connection. 
> It is about how controller read the data (inherently ARM processor)

It is not about anything inherent to ARM (which, like PPC, is a bi-endian
arch).  It's about the programming model of IFC on certain SoCs.

-Scott


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
