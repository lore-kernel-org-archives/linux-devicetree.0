From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 04/18] xhci-platform: Add a new controller using xhci:
 Armada 38x
Date: Fri, 25 Apr 2014 21:55:15 +0400
Message-ID: <535AA183.3070009@cogentembedded.com>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com> <1398434836-18908-5-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398434836-18908-5-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04/25/2014 06:07 PM, Gregory CLEMENT wrote:

> Extend the compatible string list with armada-380-xhci. It is used to
> describe xhci controller which is in the Armada 38x SoCs.

> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>   Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 90f8f607d125..cbc91414fd59 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -1,7 +1,8 @@
>   USB xHCI controllers
>
>   Required properties:
> -  - compatible: should be "generic-xhci" (deprecated: "xhci-platform").
> +  - compatible: should be on of "generic-xhci",

    s/on/one/

> +    "marvell,armada-380-xhci" (deprecated: "xhci-platform").

    What's the difference of "marvell,armada-380-xhci" to "generic-xhci"?

WBR, Sergei
