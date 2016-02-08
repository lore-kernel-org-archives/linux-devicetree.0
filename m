From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/11] drm/hisilicon: Add device tree binding for
 hi6220 display subsystem
Date: Mon, 8 Feb 2016 14:12:46 -0600
Message-ID: <20160208201246.GA17459@rob-hp-laptop>
References: <1454729098-79807-1-git-send-email-xinliang.liu@linaro.org>
 <1454729098-79807-2-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454729098-79807-2-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 06, 2016 at 11:24:48AM +0800, Xinliang Liu wrote:
> Add ADE display controller binding doc.
> Add DesignWare DSI Host Controller v1.20a binding doc.

One comment, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> +Board specific:
> +	&dsi {
> +		status = "ok";
> +
> +		ports {
> +			/* 1 for output port */
> +			port@1 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <1>;
> +
> +				/* 0 for bridge, other value for panel */

The endpoint address would not change based on bridge or panel. So you 
can drop the unit address here.

> +				dsi_out0: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&adv7533_in>;
> +				};
> +			};
> +		};
> +	};
