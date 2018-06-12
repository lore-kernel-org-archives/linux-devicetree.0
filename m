From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: usb: new ehci-npcm7xx dt
Date: Tue, 12 Jun 2018 11:46:22 +0300
Message-ID: <e12a159a-53ff-0c5e-9ce0-4fa9f93dd429@cogentembedded.com>
References: <20180611195837.251551-1-avifishman70@gmail.com>
 <20180611195837.251551-3-avifishman70@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611195837.251551-3-avifishman70@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: avifishman70@gmail.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 6/11/2018 10:58 PM, avifishman70@gmail.com wrote:

> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Device Tree documentation for Nuvoton npcm7xx EHCI.
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> Reviewed-by:   Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> new file mode 100644
> index 000000000000..b682bec103f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7XX SoC USB controllers:
> +-----------------------------
> +
> +EHCI:
> +-----
> +
> +Required properties:
> +- compatible: "nuvoton,npcm750-ehci"
> +- interrupts: Should contain the EHCI interrupt

    How about "reg"?

> +
> +Example:
> +
> +	ehci1: usb@f0806000 {
> +		compatible = "nuvoton,npcm750-ehci";
> +		reg = <0xf0806000 0x1000>;
> +		interrupts = <0 61 4>;
> +	};
> 

MBR, Sergei
