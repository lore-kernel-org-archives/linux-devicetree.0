From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 10/38] Documentation: dt: iio: Add binding for LPS001WP
Date: Sat, 14 Sep 2013 13:08:29 +0100
Message-ID: <523451BD.4080003@kernel.org>
References: <1378817379-8238-1-git-send-email-lee.jones@linaro.org>
 <1378817379-8238-11-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378817379-8238-11-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, arnd@arndb.de, linux-iio@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, denis.ciocca@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

added devicetree list cc.
On 09/10/13 13:49, Lee Jones wrote:
> LPS001WP is a Pressure and Temperature sensor.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../devicetree/bindings/iio/pressure/lps001wp.txt   | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt b/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
> new file mode 100644
> index 0000000..3294a65c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/lps001wp.txt
> @@ -0,0 +1,21 @@
> +* STMicroelectronics Pressure Sensor
> +
> +Required properties:
> +  - compatible: Should be "st,lps001wp_press"
> +  - reg: The I2C address of the sensor
> +
> +Optional properties:
> +  - vdd-supply: Phandle to the Vdd supply regulator
> +  - vddio-supply: Phandle to the Vdd-IO supply regulator
> +
> +Example:
> +
> +i2c@80128000 {
> +        lps001wp@5c {
> +                compatible = "st,lps001wp_press";
> +                reg = <0x5c>;
> +
> +                vdd-supply = <&ab8500_ldo_aux1_reg>;
> +                vddio-supply = <&db8500_vsmps2_reg>;
> +        };
> +};
> -- 1.8.1.2 -- To unsubscribe from this list: send the line "unsubscribe linux-iio" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at http://vger.kernel.org/majordomo-info.html
