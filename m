From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 2/2] rtc: cpcap: new rtc driver
Date: Mon, 27 Feb 2017 17:49:49 -0600
Message-ID: <20170227234949.ylaf2n3jrwtzoemy@rob-hp-laptop>
References: <20170220073535.27393-1-sre@kernel.org>
 <20170223010353.24351-1-sre@kernel.org>
 <20170223010353.24351-2-sre@kernel.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDJIP47K7MERBHXW2LCQKGQELBJI7ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170223010353.24351-2-sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 02:03:53AM +0100, Sebastian Reichel wrote:
> This driver supports the Motorola CPCAP PMIC found on
> some of Motorola's mobile phones, such as the Droid 4.
> 
> Tested-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes since PATCHv2:
>  - checkpatch fixes
>  - add comment for update irq
>  - introduced vendor prefix patch
> Changes since PATCHv1:
>  - added device_init_wakeup() at the end of probe
>  - added Tested-by from Tony
> 
> ---
>  .../devicetree/bindings/rtc/cpcap-rtc.txt          |  13 +
>  drivers/rtc/Kconfig                                |   7 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-cpcap.c                            | 332 +++++++++++++++++++++
>  4 files changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>  create mode 100644 drivers/rtc/rtc-cpcap.c
> 
> diff --git a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
> new file mode 100644
> index 000000000000..2709c32baf2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
> @@ -0,0 +1,13 @@
> +Motorola CPCAP PMIC RTC
> +------------------------------------

Need to state what this is a child of.

> +
> +Requires node properties:
> +- compatible: should contain "motorola,cpcap-rtc"
> +- interrupts: An interrupt specifier for alarm and 1 Hz irq
> +
> +Example:
> +
> +cpcap_rtc: rtc {
> +	compatible = "motorola,cpcap-rtc";
> +	interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
> +};

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
