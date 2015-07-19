From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] iio: magnetometer: mmc35240: Add DT binding doc
Date: Sun, 19 Jul 2015 10:57:27 +0100
Message-ID: <55AB7487.5000307@kernel.org>
References: <1437122076-29816-1-git-send-email-qingsong.gou@ck-telecom.com> <1437122076-29816-3-git-send-email-qingsong.gou@ck-telecom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437122076-29816-3-git-send-email-qingsong.gou@ck-telecom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jandy Gou <qingsong.gou@ck-telecom.com>
Cc: daniel.baluta@intel.com, viorel.suman@intel.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 17/07/15 09:34, Jandy Gou wrote:
> Signed-off-by: Jandy Gou <qingsong.gou@ck-telecom.com>
This is so trivial, I'm taking it without waiting for the standard device tree ack / 3 weeks.

Applied to the togreg branch of iio.git - initially pushed out as testing.
> ---
>  .../devicetree/bindings/iio/magnetometer/mmc35240.txt       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt b/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt
> new file mode 100644
> index 0000000..a01235c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/mmc35240.txt
> @@ -0,0 +1,13 @@
> +* MEMSIC MMC35240 magnetometer sensor
> +
> +Required properties:
> +
> +  - compatible : should be "memsic,mmc35240"
> +  - reg : the I2C address of the magnetometer
> +
> +Example:
> +
> +mmc35240@30 {
> +        compatible = "memsic,mmc35240";
> +        reg = <0x30>;
> +};
> 
