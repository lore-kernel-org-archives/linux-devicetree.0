From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 3/3] PCI: imx: Add support for i.MX8MQ
Date: Fri, 14 Dec 2018 14:30:42 -0600
Message-ID: <20181214203042.GC20725@google.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com>
 <20181206073545.10967-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206073545.10967-4-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-pci@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: devicetree@vger.kernel.org

[+cc Gustavo for fallthrough annotation]

On Wed, Dec 05, 2018 at 11:35:45PM -0800, Andrey Smirnov wrote:
> Add code needed to support i.MX8MQ variant.

> @@ -245,7 +253,8 @@ static void imx6_pcie_reset_phy(struct imx6_pcie *imx6_pcie)
>  {
>  	u32 tmp;
>  
> -	if (imx6_pcie->variant == IMX7D)
> +	if (imx6_pcie->variant == IMX7D ||
> +	    imx6_pcie->variant == IMX8MQ)

This style looks like a maintenance problem: the code below is probably
IMX6-specific, and you should test for *that* instead of adding to this
list of things that are *not* IMX6, because that list is likely to
continue growing.  There are more occurrences below.

> @@ -301,6 +312,7 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
>  
>  	switch (imx6_pcie->variant) {
>  	case IMX7D:
> +	case IMX8MQ: /* FALLTHROUGH */
>  		reset_control_assert(imx6_pcie->pciephy_reset);
>  		reset_control_assert(imx6_pcie->apps_reset);
>  		break;

I'm not an expert on fallthrough annotation (Gustavo, cc'd, is), but
this looks wrong.  It's the IMX7D case that falls through, not the
IMX8MQ case.

The recent annotations added by Gustavo are at the point where the
"break" would normally be, e.g.,

  case IMX7D:
    /* fall through */                    <--- annotation
  case IMX8MQ:
    <code>
    break;

But in this case there's actually no IMX7D-specific *code* there, so I
suspect the annotation is unnecessary.  It's obvious that IMX7D and
IMX8MQ are handled the same, so there's really no opportunity for the
"forgotten break" mistake -Wimplicit-fallthrough is trying to find.

If we *do* want this annotation, we should spell it the same as
Gustavo has been, i.e., "fall through".

Again, more occurrences below.

Bjorn
