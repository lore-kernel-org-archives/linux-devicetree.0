From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH v4 2/3] dt-bindings: add Plantower to the vendor
 prefixes
Date: Mon, 11 Feb 2019 20:20:50 +0000
Message-ID: <20190211202050.56ca6132@archlinux>
References: <20190209173609.13220-1-tduszyns@gmail.com>
        <20190209173609.13220-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209173609.13220-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, johan@kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat,  9 Feb 2019 18:36:08 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add Plantower to the vendor prefixes.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to ignore this.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 3cfe0c8b8250..fa391a650f3a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -300,6 +300,7 @@ phytec	PHYTEC Messtechnik GmbH
>  picochip	Picochip Ltd
>  pine64	Pine64
>  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
> +plantower Plantower Co., Ltd
>  plathome	Plat'Home Co., Ltd.
>  plda	PLDA
>  plx	Broadcom Corporation (formerly PLX Technology)
