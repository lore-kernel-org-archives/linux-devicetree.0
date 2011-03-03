From: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] hwmon: (ads1015) Add devicetree documentation
Date: Thu, 3 Mar 2011 13:22:42 +0100
Message-ID: <20110303132242.713cd342@endymion.delvare>
References: <20110303102157.GC3649@pengutronix.de>
	<1299154757-13682-1-git-send-email-eibach@gdsys.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299154757-13682-1-git-send-email-eibach-dJ+jgKLZIg4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  3 Mar 2011 13:19:17 +0100, Dirk Eibach wrote:
> Signed-off-by: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>
> ---
> Changes since v1:
> - removed sysfs from description
> - explain channels 
> 
>  Documentation/devicetree/bindings/i2c/ads1015.txt |   29 +++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ads1015.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/ads1015.txt b/Documentation/devicetree/bindings/i2c/ads1015.txt
> new file mode 100644
> index 0000000..0f30616
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ads1015.txt
> @@ -0,0 +1,29 @@
> +ADS1015 (I2C)
> +
> +This device is a 12-bit A-D converter with 4 inputs.
> +
> +The inputs can be used single ended or in certain differential combinations.
> +
> +For configuration all possible combinations are mapped to 8 channels:
> +0: Voltage over AIN0 and AIN1.
> +1: Voltage over AIN0 and AIN3.
> +2: Voltage over AIN1 and AIN3.
> +3: Voltage over AIN2 and AIN3.
> +4: Voltage over AIN0 and GND.
> +5: Voltage over AIN1 and GND.
> +6: Voltage over AIN2 and GND.
> +7: Voltage over AIN3 and GND.
> +
> +Optional properties:
> +
> + - exported-channels : exported_channels is a bitmask that specifies which
> +		       channels should be accessable by the user.

"accessable" doesn't exist as an English word.

> +
> +Example:
> +ads1015@49 {
> +	compatible = "ti,ads1015";
> +	reg = <0x49>;
> +	exported-channels = <0x14>;
> +};
> +
> +In this example only channel 2 and 4 would be accessable by the user.

Ditto.

-- 
Jean Delvare
