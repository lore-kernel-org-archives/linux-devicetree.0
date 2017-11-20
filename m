From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
Date: Mon, 20 Nov 2017 13:01:22 -0600
Message-ID: <20171120190122.vzg3d6ikgxablfu6@rob-hp-laptop>
References: <20171116201842.006310882@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 11:18:32PM +0300, Sergei Shtylyov wrote:
> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
> 
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'fixes' branch of LinusW's 'linux-gpio.git' repo.
> 
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |    2 +-
>  drivers/gpio/gpio-pca953x.c                             |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
