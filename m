From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] GPIO: PCA953X: Increase size of invert variable to
 support 24 bit
Date: Thu, 12 Jul 2012 00:02:50 +0200
Message-ID: <CACRpkdYX58zq2byvdWtLs-1ufN2gF=+1qokumjhoia+RThW=NA@mail.gmail.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
	<505ac716b6c758d36471a90c2a5228cedb7217be.1341925681.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <505ac716b6c758d36471a90c2a5228cedb7217be.1341925681.git.cmahapatra@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chandrabhanu Mahapatra <cmahapatra@ti.com>
Cc: grant.likely@secretlab.ca, linus.walleij@stericsson.com, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, leed.aguilar@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2012 at 3:35 PM, Chandrabhanu Mahapatra
<cmahapatra@ti.com> wrote:

> TCA6424 is a low voltage 24 bit I2C and SMBus I/O expander of pca953x family
> similar to its 16 bit predecessor TCA6416. It comes with three 8-bit active
> Input, Output, Polarity Inversion and Configuration registers each. The polarity
> of Input ports can be reversed by setting the appropiate bit in Polarity
> Inversion registers.
>
> The variables corresponding to Input, Output and Configuration registers have
> already been updated to support 24 bit values. This patch thus updates the
> invert variable of PCA953X platform data to support 24 bit.
>
> Signed-off-by: Chandrabhanu Mahapatra <cmahapatra@ti.com>

I remember this (I think). So expand to 32bit to support 24 bit,
that looks reasonable.

Patch applied.

Thanks,
Linus Walleij
