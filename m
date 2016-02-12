From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: Add ARM SP805 DT bindings
Date: Fri, 12 Feb 2016 09:23:06 -0600
Message-ID: <20160212152306.GA29673@rob-hp-laptop>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
 <1455084651-29325-5-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455084651-29325-5-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 10, 2016 at 11:40:49AM +0530, Anup Patel wrote:
> The ARM SP805 DT node is already present in various DTS files.
> This patch adds missing DT bindings documentation for ARM SP805.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  .../devicetree/bindings/watchdog/arm,sp805.txt          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> new file mode 100644
> index 0000000..6ebb77d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> @@ -0,0 +1,17 @@
> +ARM AMBA Primecell SP805 Watchdog
> +
> +Required properties:
> +- compatible: Should be "arm,sp805" & "arm,primecell"
> +- reg: Should contain location and length for watchdog timer register.
> +- interrupts: Should contain the list of watchdog timer interrupts.
> +- clocks: clocks driving the watchdog timer hardware. This list should be 2
> +	clocks. With 2 clocks, the order is wdogclk clock, apb_pclk.
> +
> +Example:
> +	wdt@66090000 {

This should be watchdog@...

Otherwise:

Acked-by: Rob Herring <robh@kernel.org>
