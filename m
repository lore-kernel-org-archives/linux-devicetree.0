From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] x86: dts: ce4100: Use defined compatible string for
 PCF8575 chip
Date: Fri, 18 Mar 2016 16:44:39 -0500
Message-ID: <20160318214439.GA17481@rob-hp-laptop>
References: <1458147080.20441.1.camel@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458147080.20441.1.camel-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Hutchings <ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 04:51:20PM +0000, Ben Hutchings wrote:
> The binding definition for the PCF857x GPIO expanders doesn't mention
> a "ti,pcf8575" compatible string.  This is apparently because TI is
> only a second source - there is no functional difference between
> PCF8575 chips manufactured by TI and NXP, and the same board might be
> populated with either depending on availability.
> 
> This is not a problem in practice because the I2C core uses
> of_modalias_node() before matching drivers and this strips the
> manufacturer name.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
> v2: Correct the claim that this is a practical problem.
> 
>  Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt | 4 ++--
>  arch/x86/platform/ce4100/falconfalls.dts                     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
