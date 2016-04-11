From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 05/16] ARM: davinci: add set_parent callback for mux
 clocks
Date: Mon, 11 Apr 2016 16:10:12 +0530
Message-ID: <570B7F0C.8000503@ti.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-6-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458863503-31121-6-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, David.Laight@ACULAB.COM, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 25 March 2016 05:21 AM, David Lechner wrote:
> Introduce a set_parent callback that will be used for mux clocks, such as
> the USB PHY muxes and the async3 clock domain mux.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v3 changes: none.
> 
> 
>  arch/arm/mach-davinci/clock.c | 17 ++++++++++++++++-
>  arch/arm/mach-davinci/clock.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-davinci/clock.c b/arch/arm/mach-davinci/clock.c
> index a5c2629..dfc2eb3 100644
> --- a/arch/arm/mach-davinci/clock.c
> +++ b/arch/arm/mach-davinci/clock.c
> @@ -195,6 +195,13 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
>  		return -EINVAL;
>  
>  	mutex_lock(&clocks_mutex);
> +	if (clk->set_parent) {
> +		int ret = clk->set_parent(clk, parent);

Need empty line here.

> +		if (ret) {
> +			mutex_unlock(&clocks_mutex);
> +			return ret;
> +		}
> +	}
>  	clk->parent = parent;
>  	list_del_init(&clk->childnode);
>  	list_add(&clk->childnode, &clk->parent->children);
> @@ -224,8 +231,16 @@ int clk_register(struct clk *clk)
>  
>  	mutex_lock(&clocks_mutex);
>  	list_add_tail(&clk->node, &clocks);
> -	if (clk->parent)
> +	if (clk->parent) {
> +		if (clk->set_parent) {
> +			int ret = clk->set_parent(clk, clk->parent);

Here too. Applying this patch with these local changes.

BTW, checkpatch complained about these. Please try to address all
warnings unless there is a good reason not to fix one.

Thanks,
Sekhar
