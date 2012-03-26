From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] rtc/spear: Add Device Tree probing capability
Date: Mon, 26 Mar 2012 13:32:01 +0200
Message-ID: <201203261332.02073.sr@denx.de>
References: <8747a4b3bdcfb7b3384c14ca909228e1164d0fc5.1332755275.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8747a4b3bdcfb7b3384c14ca909228e1164d0fc5.1332755275.git.viresh.kumar@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: akpm@linux-foundation.org, devicetree-discuss@lists.ozlabs.org, rajeev-dlh.kumar@st.com, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, spear-devel@list.st.com, viresh.linux@gmail.com, Rob Herring <robherring2@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday 26 March 2012 11:54:22 Viresh Kumar wrote:
> SPEAr platforms now support DT and so must convert all drivers support DT.
> This patch adds DT probing support for rtc and updates its documentation
> too.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> ---
>  Documentation/devicetree/bindings/rtc/spear-rtc.txt |   18
> ++++++++++++++++++ drivers/rtc/rtc-spear.c                             |  
> 10 ++++++++++ 2 files changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/spear-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/spear-rtc.txt
> b/Documentation/devicetree/bindings/rtc/spear-rtc.txt new file mode 100644
> index 0000000..928410f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/spear-rtc.txt
> @@ -0,0 +1,18 @@
> +* SPEAr RTC
> +
> +Required properties:
> +- compatible : "st,spear-rtc"
> +- reg : Address range of the rtc registers
> +- interrupt-parent: Should be the phandle for the interrupt controller
> +  that services interrupts for this device
> +- interrupt: Should contain the rtc interrupt number
> +
> +Example:
> +
> +	rtc@fc000000 {
> +		compatible = "st,spear-rtc";

With Rob's comments in mind, wouldn't it be better to use a more specific 
compatible property? Should we stick with "st,spear600-rtc"? Or use "st-
spear300-rtc" as "oldest" SoC variant?

Thanks,
Stefan
