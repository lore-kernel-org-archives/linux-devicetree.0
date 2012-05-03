From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Thu, 3 May 2012 14:20:05 +0100
Message-ID: <20120503132004.GB14296@sirena.org.uk>
References: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com>
 <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 03, 2012 at 03:54:24PM +0300, Peter Ujfalusi wrote:

>  	/* In order to operate correctly we need valid interrupt config */
> -	if (!client->irq || !pdata->irq_base) {
> +	if (!client->irq) {

It looks like you're totally removing the use of irq_base which will
break any boards that didn't convert to DT.  The usual idiom is to use
irq_base as the base for the range of requested IRQs if it's supplied,
otherwise set it to -1 to allow dynamic allocation.  This should keep
existing users working without disruption.
