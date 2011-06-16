From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 11/11] arm/versatile: Add device tree support
Date: Thu, 16 Jun 2011 16:20:37 +0200
Message-ID: <201106161620.37205.arnd@arndb.de>
References: <20110616042653.29371.2052.stgit@ponder>
	<20110616044311.29371.49018.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110616044311.29371.49018.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 16 June 2011, Grant Likely wrote:
> This patch adds a new versatile platform for when using the device
> tree.  Add platform and amba devices are discovered and registered by
> parsing the device tree.  Clocks and initial io mappings are still
> configured statically.

Hi Grant,

Two small questions about the device tree contents:

> +       i2c@10002000 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "arm,versatile-i2c";
> +               reg = <0x10002000 0x1000>;
> +
> +               rtc@68 {
> +                       compatible = "dallas,ds1338";
> +                       reg = <0x68>;
> +               };
> +       };
> +
> +       net@10010000 {
> +               compatible = "smsc,lan91c111";
> +               reg = <0x10010000 0x10000>;
> +               interrupts = <25>;
> +       };
> +
> +       lcd@10008000 {
> +               compatible = "arm,versatile-lcd";
> +               reg = <0x10008000 0x1000>;
> +       };

Why are these devices on the top level, rather than on the AMBA bus or
the FPGA? From the documentation, it seems that they are implemented
in the FPGA, which would also match the address layout.

> +       amba {
> +               compatible = "arm,amba-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vic: intc@10140000 {
> +                       compatible = "arm,versatile-vic", "arm,vic";
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +                       reg = <0x10140000 0x1000>;
> +               };
> +

Why the empty ranges property? All device registers are based on 0x10000000,
so I'd expect this to be described like that here.

	Arnd
