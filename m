From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH v4 3/3] iio: chemical: sps30: add device tree support
Date: Sun, 16 Dec 2018 13:15:25 +0000
Message-ID: <20181216131525.22e24839@archlinux>
References: <20181214182803.9006-1-tduszyns@gmail.com>
        <20181214182803.9006-4-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214182803.9006-4-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, a.brauchli@elementarea.net
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 19:28:03 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add device tree support for Sensirion SPS30 particulate
> matter sensor.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied with slight tweak to title to match dt-bindings: standard.

Thanks,

Jonathan

> ---
>  .../bindings/iio/chemical/sensirion,sps30.txt        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> new file mode 100644
> index 000000000000..6eee2709b5b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> @@ -0,0 +1,12 @@
> +* Sensirion SPS30 particulate matter sensor
> +
> +Required properties:
> +- compatible: must be "sensirion,sps30"
> +- reg: the I2C address of the sensor
> +
> +Example:
> +
> +sps30@69 {
> +	compatible = "sensirion,sps30";
> +	reg = <0x69>;
> +};
