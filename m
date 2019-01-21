From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Mon, 21 Jan 2019 11:30:57 +0530
Message-ID: <de9f281c-6bbb-2686-a809-f53302d1a3e0@ti.com>
References: <20190116103027.22657-1-vigneshr@ti.com>
 <20190116103027.22657-3-vigneshr@ti.com>
 <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
 <353a011e-920a-ddb3-4eef-e3256555ac93@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <353a011e-920a-ddb3-4eef-e3256555ac93@microchip.com>
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
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 20/01/19 8:58 PM, Tudor.Ambarus@microchip.com wrote:
> Vignesh,
> 
> On 01/20/2019 04:56 PM, Tudor.Ambarus@microchip.com wrote:
>> Looks good.
> 
> one more thing: in cqspi_read_setup() I see that the dummy cycles are adjusted
> if (f_pdata->inst_width != CQSPI_INST_TYPE_QUAD).
> 
> Should you adjust the dummy cycles for octo too? 

Driver does not claim support for SNOR_HWCAPS_PP_4_4_4 mode or
SNOR_HWCAPS_PP_8_8_8 mode. Therefore inst_width is always be
CQSPI_INST_TYPE_SINGLE (cqspi_set_protocol() always sets inst_width and
addr_width to CQSPI_INST_TYPE_SINGLE).
Code to support 4_4_4 or 8_8_8 mode is incomplete in the driver. Also,
using mode bits to satisfy dummy clk cycles does not seem right. My
guess is driver is broken, if inst_width is indeed CQSPI_INST_TYPE_QUAD
as we end up sending additional 8 dummy clock cycles over what is asked
in nor->read_dummy.
I will plan to fix these as part of moving driver over to spi-mem. But
above code should not impact 1-1-8 mode support.

> I tried to find a datasheet for the controller, without success though ...
> 

You can find Octal SPI controller datasheet in AM65x SoC TRM here:
http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
Page 9449: 12.3.2 Octal Serial Peripheral Interface (OSPI)



-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
