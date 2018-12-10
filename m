From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Date: Mon, 10 Dec 2018 12:28:18 +0100
Message-ID: <20181210122818.15de3232@bbrezillon>
References: <20181003165603.2579-1-vigneshr@ti.com>
        <20181003165603.2579-4-vigneshr@ti.com>
        <20181210094513.6282d55e@bbrezillon>
        <f6c3a649-f580-513d-644d-5010b3b5cf0b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6c3a649-f580-513d-644d-5010b3b5cf0b@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2018 16:49:29 +0530
Vignesh R <vigneshr@ti.com> wrote:

> On 10/12/18 2:15 PM, Boris Brezillon wrote:
> > On Wed, 3 Oct 2018 22:26:03 +0530
> > Vignesh R <vigneshr@ti.com> wrote:
> >   
> >> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> >> It also has an integrated PHY. IP register layout is very
> >> similar to existing QSPI IP except for additional bits to support Octal
> >> and Octal DDR mode. Therefore, extend current driver to support Octal
> >> mode.
> >>
> >> Signed-off-by: Vignesh R <vigneshr@ti.com>
> >> ---
> >>  drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> >> index e24db817154e..48b00e75a879 100644
> >> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> >> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> >> @@ -101,6 +101,7 @@ struct cqspi_st {
> >>  #define CQSPI_INST_TYPE_SINGLE			0
> >>  #define CQSPI_INST_TYPE_DUAL			1
> >>  #define CQSPI_INST_TYPE_QUAD			2
> >> +#define CQSPI_INST_TYPE_OCTAL			3
> >>  
> >>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
> >>  #define CQSPI_DUMMY_BYTES_MAX			4
> >> @@ -898,6 +899,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
> >>  		case SNOR_PROTO_1_1_4:
> >>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
> >>  			break;
> >> +		case SNOR_PROTO_1_1_8:
> >> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> >> +			break;
> >>  		default:
> >>  			return -EINVAL;
> >>  		}
> >> @@ -1205,6 +1209,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
> >>  			SNOR_HWCAPS_READ_FAST |
> >>  			SNOR_HWCAPS_READ_1_1_2 |
> >>  			SNOR_HWCAPS_READ_1_1_4 |
> >> +			SNOR_HWCAPS_READ_1_1_8 |  
> > 
> > Is this really supported on qspi versions of this IP? I guess not given
> > the description in the commit message and the name of the new
> > compatible (ospi instead of qspi).  
> 
> No, qspi version does not support Octal mode. I guess you are pointing
> out its logically wrong for driver with "*-qspi" compatible to declare
> SNOR_HWCAPS_READ_1_1_8 capability.

Exactly.

> Will update patch to declare SNOR_HWCAPS_READ_1_1_8 based on compatible.

Thanks.
