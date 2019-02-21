From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: RE: [EXT] [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support
 for Octal SPI controller
Date: Thu, 21 Feb 2019 10:41:33 +0000
Message-ID: <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <20190212083809.6534-1-vigneshr@ti.com>
 <20190212083809.6534-3-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190212083809.6534-3-vigneshr@ti.com>
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
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi, Vignesh

>
>Cadence OSPI controller IP supports Octal IO (x8 IO lines), It also has an
>integrated PHY. IP register layout is very similar to existing QSPI IP except for
>additional bits to support Octal and Octal DDR mode. Therefore, extend
>current driver to support Octal mode. Only Octal SDR read (1-1-8)mode is
>supported for now.

Does this your Cadence OSPI controller support 8-8-8 IO mode, if yes,
Why not directly enable 8-8-8 mode? 

>Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
>
>Signed-off-by: Vignesh R <vigneshr@ti.com>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
