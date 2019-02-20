From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH 2/2] dt-bindings: iio: chemical: pms7003: extend
 supported sensors list
Date: Wed, 20 Feb 2019 10:54:02 +0000
Message-ID: <20190220105402.04cb8de6@archlinux>
References: <20190217192213.15803-1-tduszyns@gmail.com>
        <20190217192213.15803-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217192213.15803-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 17 Feb 2019 20:22:13 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add other sensors to the compatible list.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied,  This will miss the coming merge window, so will be a while
before it hits mainline.

Thanks,

Jonathan

> ---
>  .../bindings/iio/chemical/plantower,pms7003.txt           | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> index 7b5f06f324c8..c52ea2126eaa 100644
> --- a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> @@ -1,7 +1,13 @@
>  * Plantower PMS7003 particulate matter sensor
>  
>  Required properties:
> -- compatible: must be "plantower,pms7003"
> +- compatible: must one of:
> +   "plantower,pms1003"
> +   "plantower,pms3003"
> +   "plantower,pms5003"
> +   "plantower,pms6003"
> +   "plantower,pms7003"
> +   "plantower,pmsa003"
>  - vcc-supply: phandle to the regulator that provides power to the sensor
>  
>  Optional properties:
