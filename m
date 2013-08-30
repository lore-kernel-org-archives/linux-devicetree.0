From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/2] spi: dual and quad support(device tree)
Date: Fri, 30 Aug 2013 15:20:13 -0600
Message-ID: <52210C8D.7020609@wwwdotorg.org>
References: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: wangyuhang <wangyuhang2014@gmail.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com
List-Id: devicetree@vger.kernel.org

On 08/26/2013 06:50 PM, wangyuhang wrote:
> fix two things in patch:
> commit id:f477b7fb13df2b843997559ff34e87d054ba6538
> 
> 1.change the name of property: spi-tx-nbits and spi-rx-nbits to
> spi-tmax-nbits and spi-rmax-nbits, aimed to make that name different
> from the member of spi_transfer(tx_nbits and rx_nbits). using tmax
> and rmax here to describe that it is the max transfer bits that the
> members in spi_transfer(tx_nbits and rx_nbits) can reach.
> 2.change property spi-tmax-nbits and spi-rmax-nbits to optional.
> If User don't set spi-tmax-nbits or spi-rmax-nbits, spi device mode
> should be regarded as SINGLE, not return an error. In such case, user
> don't have to modify the old dts files to fit the new spi framework.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c

> +		} else {
> +			switch (be32_to_cpup(prop)) {
> +			case SPI_NBITS_SINGLE:
> +				break;
> +			case SPI_NBITS_DUAL:
> +				spi->mode |= SPI_TX_DUAL;
> +				break;
> +			case SPI_NBITS_QUAD:
> +				spi->mode |= SPI_TX_QUAD;
> +				break;
> +			default:
> +				dev_err(&master->dev,
> +					"spi-tmax-nbits value is not supported\n");
> +				spi_dev_put(spi);
> +				continue;

You're missing a closing brace here; this patch doesn't compile...

>  		}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
