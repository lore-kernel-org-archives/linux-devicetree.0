From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for LS1021A
Date: Tue, 09 Sep 2014 13:50:09 +0200
Message-ID: <4286278.g3iXMFknkK@wuerfel>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com> <1410253952-15631-2-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410253952-15631-2-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaveta Leekha <shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Suresh Gupta <suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ruchika Gupta <ruchika.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 September 2014 17:12:27 Jingchang Lu wrote:

> +		dcfg: dcfg@1ee0000 {
> +			compatible = "fsl,ls1021a-dcfg";
> +			reg = <0x0 0x1ee0000 0x0 0x10000>;
> +		};
> +		scfg: scfg@1570000 {
> +			compatible = "fsl,ls1021a-scfg";
> +			reg = <0x0 0x1570000 0x0 0x10000>;
> +		};

Should these be marked as 'compatible = "syscon"' as well?

> +	dcsr {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "fsl,dcsr", "simple-bus";
> +
> +		ranges = <0x0 0x0 0x20000000 0x1000000>;
> +
> +		dcsr-epu@0 {
> +			compatible = "fsl,ls1021a-dcsr-epu";
> +			reg = <0x0 0x10000>;
> +		};

The binding document only specifies a generic "fsl,dcsr-epu", not
"fsl,ls1021a-dcsr-epu". It also mandates that "interrupts"
must be present and contain three interrupt lines.

Please fix either the DT or the binding, so they match.	

> +		dcsr-gdi@100000 {
> +			compatible = "fsl,ls1021a-dcsr-gdi";
> +			reg = <0x100000 0x10000>;
> +		};
> +
> +		dcsr-dddi@120000 {
> +			compatible = "fsl,ls1021a-dcsr-dddi";
> +			reg = <0x120000 0x10000>;
> +		};
> +
> +		dcsr-dcfg@220000 {
> +			compatible = "fsl,ls1021a-dcsr-dcfg";
> +			reg = <0x220000 0x1000>;
> +		};
> +
> +		dcsr-clock@221000 {
> +			compatible = "fsl,ls1021a-dcsr-clock";
> +			reg = <0x221000 0x1000>;
> +		};

None of these are part of the dcsr.txt binding.

> +		dcsr-rcpm@222000 {
> +			compatible = "fsl,ls1021a-dcsr-rcpm";
> +			reg = <0x222000 0x1000 0x223000 0x1000>;
> +		};

Missing generic fsl,dcsr-rcpm compatible value again.

> +		dcsr-ccp@225000 {
> +			compatible = "fsl,ls1021a-dcsr-ccp";
> +			reg = <0x225000 0x1000>;
> +		};

I'm not checking any devices below this one, I assume they are mostly
incomplete, so please go through the whole list and make sure they
all match the documentation.
I can't really find any code using the dcsr in Linux. Is there
an out of tree driver that you plan to submit?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
