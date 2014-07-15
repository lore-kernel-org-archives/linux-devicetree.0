From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv5 2/2] dt/bindings: Add the DT binding documentation for
 endianness
Date: Tue, 15 Jul 2014 04:29:15 +0000
Message-ID: <6d7c67f283d54f2582de098f12ba66cc@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1405397904-31202-1-git-send-email-Li.Xiubo@freescale.com>
 <1405397904-31202-3-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405397904-31202-3-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Please ignore this V5 patch series.

Thanks,

BRs




> -----Original Message-----
> From: Xiubo Li [mailto:Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Tuesday, July 15, 2014 12:18 PM
> To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org
> Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org;
> galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xiubo Li-B47053
> Subject: [PATCHv5 2/2] dt/bindings: Add the DT binding documentation for
> endianness
> 
> Device-Tree binding for device endianness
> Index     Device     Endianness properties
> ---------------------------------------------------
> 1         BE         'big-endian'
> 2         LE         'little-endian'
> 
> For one device driver, which will run in different scenarios above
> on different SoCs using the devicetree, we need one way to simplify
> this.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/regmap/regmap.txt          | 48
> ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt
> 
> diff --git a/Documentation/devicetree/bindings/regmap/regmap.txt
> b/Documentation/devicetree/bindings/regmap/regmap.txt
> new file mode 100644
> index 0000000..cc5f7f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regmap/regmap.txt
> @@ -0,0 +1,48 @@
> +Device-Tree binding for device endianness
> +
> +The endianness mode of CPU & Device scenarios:
> +Index    CPU       Device     Endianness properties
> +------------------------------------------------------------
> +1        LE        LE         -
> +2        LE        BE         'big-endian{,-*}'
> +3        BE        BE         -
> +4        BE        LE         'little-endian{,-*}'
> +
> +For one device driver, which will run in different scenarios above
> +on different SoCs using the devicetree, we need one way to simplify
> +this.
> +
> +Required properties:
> +- {big,little}-endian{,-*}: these are boolean properties, if absent
> +  meaning that the CPU and the Device are in the same endianness mode.
> +
> +Examples:
> +Scenario 1 : CPU in LE mode & device in LE mode.
> +dev: dev@40031000 {
> +	      compatible = "name";
> +	      reg = <0x40031000 0x1000>;
> +	      ...
> +};
> +
> +Scenario 2 : CPU in LE mode & device in BE mode.
> +dev: dev@40031000 {
> +	      compatible = "name";
> +	      reg = <0x40031000 0x1000>;
> +	      ...
> +	      big-endian{,-*};
> +};
> +
> +Scenario 3 : CPU in BE mode & device in BE mode.
> +dev: dev@40031000 {
> +	      compatible = "name";
> +	      reg = <0x40031000 0x1000>;
> +	      ...
> +};
> +
> +Scenario 4 : CPU in BE mode & device in LE mode.
> +dev: dev@40031000 {
> +	      compatible = "name";
> +	      reg = <0x40031000 0x1000>;
> +	      ...
> +	      little-endian{,-*};
> +};
> --
> 1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
