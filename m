From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 5/5] ARM: DTS: da850: Add usb phy node
Date: Thu, 14 Apr 2016 22:51:52 +0300
Message-ID: <570FF4D8.8080307@cogentembedded.com>
References: <1460663058-9462-1-git-send-email-david@lechnology.com>
 <1460663058-9462-6-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460663058-9462-6-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, nsekhar@ti.com
Cc: petr@barix.com, khilman@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04/14/2016 10:44 PM, David Lechner wrote:

> Add a node for the new usb phy driver.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>
> v4 changes: none
>
>
>   arch/arm/boot/dts/da850.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index e56c554..2c60751 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -339,6 +339,11 @@
>   					>;
>   			status = "disabled";
>   		};
> +		usbphy: usbphy {

    Name it "usb-phy" please -- to mimic the ePAPR mandated "ethernet-phy".

[...]

MBR, Sergei
