From: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Sun, 20 Jan 2019 15:28:41 +0000
Message-ID: <353a011e-920a-ddb3-4eef-e3256555ac93@microchip.com>
References: <20190116103027.22657-1-vigneshr@ti.com>
 <20190116103027.22657-3-vigneshr@ti.com>
 <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
Content-Language: en-US
Content-ID: <5903957AF0BB3B43B3CC4DD8CDE1F107@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: vigneshr@ti.com, bbrezillon@kernel.org
Cc: marek.vasut@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Vignesh,

On 01/20/2019 04:56 PM, Tudor.Ambarus@microchip.com wrote:
> Looks good.

one more thing: in cqspi_read_setup() I see that the dummy cycles are adjusted
if (f_pdata->inst_width != CQSPI_INST_TYPE_QUAD).

Should you adjust the dummy cycles for octo too? I tried to find a datasheet for
the controller, without success though ...

ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
