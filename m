From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: support open
 drain mode
Date: Sun, 25 Jun 2017 17:03:31 +0100
Message-ID: <20170625170331.6fcd73a5@kernel.org>
References: <20170621192129.10226-1-lorenzo.bianconi@st.com>
        <20170621192129.10226-3-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621192129.10226-3-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Jun 2017 21:21:29 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Given this is a carbon copy of what we already have for the mpu3030 driver
I'm not going to waste Rob or Marks time pestering them for a review.
(obviously one is welcome if it happens to come along!)

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index 6f28ff55f3ec..1ff1af799c76 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -11,6 +11,14 @@ Required properties:
>  Optional properties:
>  - st,drdy-int-pin: the pin on the package that will be used to signal
>    "data ready" (valid values: 1 or 2).
> +- drive-open-drain: the interrupt/data ready line will be configured
> +  as open drain, which is useful if several sensors share the same
> +  interrupt line. This is a boolean property.
> +  (This binding is taken from pinctrl/pinctrl-bindings.txt)
> +  If the requested interrupt is configured as IRQ_TYPE_LEVEL_HIGH or
> +  IRQ_TYPE_EDGE_RISING a pull-down resistor is needed to drive the line
> +  when it is not active, whereas a pull-up one is needed when interrupt
> +  line is configured as IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING.
>  - interrupt-parent: should be the phandle for the interrupt controller
>  - interrupts: interrupt mapping for IRQ. It should be configured with
>    flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
