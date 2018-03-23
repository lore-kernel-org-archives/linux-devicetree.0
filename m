From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: RE: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness supports
Date: Fri, 23 Mar 2018 07:59:33 +0000
Message-ID: <VI1PR0402MB385471846E1D3B747C67B48D97A80@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180312081128.8195-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180312081128.8195-1-prabhakar.kushwaha@nxp.com>
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
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "oss@buserror.net" <oss@buserror.net>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,


> -----Original Message-----
> From: Prabhakar Kushwaha
> Sent: Monday, March 12, 2018 1:41 PM
> To: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org;
> robh@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org
> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
> oss@buserror.net; Leo Li <leoyang.li@nxp.com>; linux-arm-
> kernel@lists.infradead.org; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: [PATCH 1/2][v6] dt-bindings: mtd-physmap: Add endianness
> supports
> 
> Connection between flash and controller is not necessary to be always of
> same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes for v2: updated subject
> Changes for v3: fixed typo for "big-endian"
> Changes for v4: Moved binding definition in mtd-physmap.txt as discussed at
> https://patchwork.ozlabs.org/patch/842543/
> Changes for v5: Sending as it is
> Changes for v6: Updated binding when endianness property is absent
> 

I hope this version is good enough to be accepted. 

May I go ahead and send device tree changes for other NXP SoCs.

--pk


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
