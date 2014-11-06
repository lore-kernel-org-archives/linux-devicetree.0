From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Thu, 6 Nov 2014 15:49:39 -0600
Message-ID: <1415310579.23458.402.camel@snotra.buserror.net>
References: <1415200734-6978-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1415200734-6978-2-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1415200734-6978-2-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-11-05 at 09:18 -0600, Emil Medve wrote:
> +Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
> +to the respective BMan instance
> +
> +- fsl,bman
> +	Usage:		Required
> +	Value type:	<prop-encoded-array>
> +	Description:	List of phandle and DCP index pairs, to the BMan instance
> +			to which this device is connected via the DCP

Does software need the DCP index (though for QMan there do seem to be a
few registers associated with each DCP)?  Where can I find that info in
the manual?

-Scott


