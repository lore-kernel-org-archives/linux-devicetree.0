From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 06/12] mtd: nand: davinci: adjust DT properties to MTD
 generic
Date: Tue, 26 Nov 2013 12:33:03 +0530
Message-ID: <529447A7.1050605@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-7-git-send-email-ivan.khoronzhuk@ti.com>
 <4F5844B3A985794BA902E12C070812375F8D20@DNCE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <4F5844B3A985794BA902E12C070812375F8D20@DNCE04.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>, "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 11 November 2013 10:31 PM, Khoronzhuk, Ivan wrote:
> The properties davinci-ecc-mode, davinci-nand-use-bbt, davinci-nand-buswidth
> are MTD generic. Correct names for them are: nand-ecc-mode, nand-on-flash-bbt,
> nand-bus-width accordingly. So rename them in dts and documentation.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |   25 ++++++++++++++++----
>  drivers/mtd/nand/davinci_nand.c                    |   11 ++++++---
>  2 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
> index d2a3fc0..befaa5b 100644
> --- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
> @@ -37,7 +37,7 @@ Recommended properties :
>  - ti,davinci-mask-chipsel:     mask for chipselect address. Needed to mask
>                                 addresses for given chipselect.
> 
> -- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. ECC mode
> +- nand-ecc-mode:               operation mode of the NAND ecc mode. ECC mode
>                                 valid values for davinci driver:
>                                 - "none"
>                                 - "soft"
> @@ -45,10 +45,25 @@ Recommended properties :
> 
>  - ti,davinci-ecc-bits:         used ECC bits, currently supported 1 or 4.
> 
> -- ti,davinci-nand-buswidth:    buswidth 8 or 16.

Shouldn't we keep the documentation for existing bindings while just
marking them as deprecated?

Thanks,
Sekhar


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
