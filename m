From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio/pca953x: increase variables size to support 24
 bit of data
Date: Thu, 12 Jul 2012 00:04:07 +0200
Message-ID: <CACRpkdbv9miT=jHnv1uDf5fquqRFzYEXxnm4n7zsapc0oS1w_A@mail.gmail.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
	<d2503bb0719da649800c67f70953685da582543f.1341925681.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d2503bb0719da649800c67f70953685da582543f.1341925681.git.cmahapatra@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chandrabhanu Mahapatra <cmahapatra@ti.com>
Cc: grant.likely@secretlab.ca, linus.walleij@stericsson.com, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, leed.aguilar@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2012 at 3:35 PM, Chandrabhanu Mahapatra
<cmahapatra@ti.com> wrote:

> From: Leed Aguilar <leed.aguilar@ti.com>
>
> Increase variable size from u16 to u32 to allocate 24 bit of data required for
> the TCA6424 I/O expander device type.
>
> Signed-off-by: Leed Aguilar <leed.aguilar@ti.com>
> Signed-off-by: Chandrabhanu Mahapatra <cmahapatra@ti.com>

Looks good.

Applied.

Yours,
Linus Walleij
