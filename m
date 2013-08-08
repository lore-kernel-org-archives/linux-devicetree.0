Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:54485 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965398Ab3HHPzT convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 11:55:19 -0400
Subject: Re: [PATCH V2 1/2] DT: Add documentation for ralink-wdt
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <1375954919-30737-1-git-send-email-blogic@openwrt.org>
Date: Thu, 8 Aug 2013 10:55:15 -0500
Content-Transfer-Encoding: 8BIT
Message-Id: <0631E84C-AC6E-4B75-9073-D6A2BFD9EB02@codeaurora.org>
References: <1375954919-30737-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On Aug 8, 2013, at 4:41 AM, John Crispin wrote:

> Describe ralink-wdt binding.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> ---
> V1 used the old devicetree list as Cc.
> 
> .../devicetree/bindings/watchdog/ralink-wdt.txt     |   19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt
> new file mode 100644
> index 0000000..a70f0e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ralink-wdt.txt

Seems like this should be ralink-rt2880-wdt.txt (I'm guessing there are other ralink watchdog timers).

> @@ -0,0 +1,19 @@
> +Ralink Watchdog Timers

Should probably be Ralink RT2880 Watchdog Timer

> +
> +Required properties :
> +- compatible: must be "ralink,rt2880-wdt"
> +- reg: physical base address of the controller and length of the register range
> +
> +Optional properties :
> +- interrupt-parent: phandle to the INTC device node
> +- interrupts : Specify the INTC interrupt number

Since you'll be updating this to drop 'ralink,mt7620a-wdt' how about cleaning up the whitespace around ' :'

> +
> +Example:
> +
> +	watchdog@120 {
> +		compatible = "ralink,mt7620a-wdt", "ralink,rt2880-wdt";
> +		reg = <0x120 0x10>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <1>;
> +	};
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


- k

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

