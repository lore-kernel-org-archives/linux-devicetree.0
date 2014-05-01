From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCHv3 resend 1/2] dt/bindings: Add the DT binding documentation for endianness
Date: Thu, 1 May 2014 11:00:14 -0700
Message-ID: <A2CD6B78-31B7-467D-943C-48A17FD596B4@codeaurora.org>
References: <1398847921-9322-1-git-send-email-Li.Xiubo@freescale.com> <1398847921-9322-2-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398847921-9322-2-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>
Cc: mark.rutland@arm.com, broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, richardcochran@gmail.com, gregkh@linuxfoundation.org, mpa@pengutronix.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Apr 30, 2014, at 1:52 AM, Xiubo Li <Li.Xiubo@freescale.com> wrote:

> Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
> ---
> .../devicetree/bindings/endianness/endianness.txt  | 47 ++++++++++++++++++++++
> 1 file changed, 47 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/endianness/endianness.txt
> 
> diff --git a/Documentation/devicetree/bindings/endianness/endianness.txt b/Documentation/devicetree/bindings/endianness/endianness.txt
> new file mode 100644
> index 0000000..49458a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/endianness/endianness.txt
> @@ -0,0 +1,47 @@
> +Device-Tree binding for device endianness
> +
> +The endianness mode of CPU & Device scenarios:
> +Index    CPU       Device     Endianess flag for DT bool property
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
> +- {big,little}-endian{,-*}: this is one boolean property.
> +

what is the {,-*} all about?

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
> 1.8.4
> 

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

