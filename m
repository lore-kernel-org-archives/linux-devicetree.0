Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6F5C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AD7A2082E
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9gT757z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgAaSgm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 13:36:42 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45594 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgAaSgm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 13:36:42 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so3744954pfg.12
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Bu1DeTckneSKzkikeKf98tT1vcO8GqgJ/xU+WVIBHPM=;
        b=X9gT757zbAkVNUznciIoqWDsz2EPJoW5yOwp9vknDINJMkTJAqCuZ16m6SfnFwgZc+
         +2UIyLRFFJRNyNdWF4htEZ4VMywGv0qSHeDKi7HPjLb4nSZG2aiBi0hn++gkZPzjqeXL
         rTOc5FZteINKaYDQspkVQkWw7Q/RJWdBRkPIr2vto4ocGIraxELEcMEg1egJkuCA/eiG
         RFWfcsz3/o/y/n2NEufLm2NwsXuXqpYBi2hZxHZ1MReGv+dIXMZUw4trxDEFApIMYugv
         qQmzgDqPjvLN9LDPM3k33m+4lZBw/hwDYPDGhIWPXVZShA0t9UOt2oF0MKbRg3ch5Wui
         K3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Bu1DeTckneSKzkikeKf98tT1vcO8GqgJ/xU+WVIBHPM=;
        b=lz6zYA/D++hAxzstUBFMV7CBPmGTtrV7jblROW0YOY0mMSdexaAI02hxWZO6zA2kt8
         CZnJIZyx+FC/ai690vBXRFoDwx+Yj7rd53QON2HMi79CbJvt6/SXWk5Dc3pgthJ34NIL
         svtfoCZ3dbXovphw+emeJJZJlVwwIM0SQ+do/go5hLuA7V5sFEwZQtnwlD6qw7bWqym8
         WDNZCmh8sPiEueniC0wKBqWD3qAvlfY+fu8WmawxoaA5pVlthrHQ79uzUxHx9X8WDjzX
         J2Ksfb20hVqyv+5N6fkAQX2KsD0/+L6XcYwTs0dcV46U8gfPz61VCQs+66GZasdckhkr
         PEgQ==
X-Gm-Message-State: APjAAAUzNzdr3/W6VYKZ9+piJnHAz7lTiyQbjJ1ABeQhsFYSURF6q595
        n0W/TSi5bt4xcCesPWH0tc0k7g==
X-Google-Smtp-Source: APXvYqzQG2Bthn+l5dmYQMAjXbjZdn/dN+2DzOBbQWNs9xr+VikGqxag/Te5HTNRxeQgEYa1W5zGag==
X-Received: by 2002:a63:e911:: with SMTP id i17mr11877612pgh.42.1580495800075;
        Fri, 31 Jan 2020 10:36:40 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k3sm11155894pgc.3.2020.01.31.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 10:36:39 -0800 (PST)
Date:   Fri, 31 Jan 2020 11:36:37 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Wojciech =?utf-8?B?xbttdWRh?= <wzmuda@n7space.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "antoine.tenart@bootlin.com" <antoine.tenart@bootlin.com>,
        "t-kristo@ti.com" <t-kristo@ti.com>,
        "rajan.vaja@xilinx.com" <rajan.vaja@xilinx.com>,
        Krzysztof Pilch <kpilch@n7space.com>,
        Michal Mosdorf <mmosdorf@n7space.com>,
        =?utf-8?Q?Micha=C5=82?= Kurowski <mkurowski@n7space.com>
Subject: Re: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
Message-ID: <20200131183637.GA26658@xps15>
References: <20200130153613.20365-1-wzmuda@n7space.com>
 <20200130153613.20365-2-wzmuda@n7space.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200130153613.20365-2-wzmuda@n7space.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Wojciech,

On Thu, Jan 30, 2020 at 03:36:27PM +0000, Wojciech Żmuda wrote:
> From: Wojciech Zmuda <wzmuda@n7space.com>
> 
> Add nodes for the following CoreSight components:
>  - ETMs for A53 cores
>  - debug components for A53 cores
>  - funnel gathering outputs from A53 ETMs and SoC-wide funnels
>  - the only replicator
>  - all TMCs: 4k ETF, 8k ETF and ETR
>  - TPIU
> 
> Signed-off-by: Wojciech Zmuda <wzmuda@n7space.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 +++++++++++++++++++++++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
>  2 files changed, 274 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> new file mode 100644
> index 000000000000..8b7579ad89cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +

Looking at other Xilinx DT files there is no space between the SPDX identifier
and the header of the file.

> +/*
> + * dtsi for Xilinx Ultrascale+ MPSoC CoreSight components
> + *
> + * Copyright (C) 2019-2020 N7 Space Sp. z o.o.
> + *
> + * Author: Wojciech Zmuda <wzmuda@n7space.com>
> + *
> + */
> +/ {
> +	etm0@fec40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0 0xfec40000 0 0x1000>;
> +		cpu = <&cpu0>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		out-ports {
> +			port {
> +				etm0_out_port: endpoint {
> +					remote-endpoint = <&funnel1_in_port0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm1@fed40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0 0xfed40000 0 0x1000>;
> +		cpu = <&cpu1>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		out-ports {
> +			port {
> +				etm1_out_port: endpoint {
> +					remote-endpoint = <&funnel1_in_port1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm2@fee40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0 0xfee40000 0 0x1000>;
> +		cpu = <&cpu2>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		out-ports {
> +			port {
> +				etm2_out_port: endpoint {
> +					remote-endpoint = <&funnel1_in_port2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm3@fef40000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		reg = <0 0xfef40000 0 0x1000>;
> +		cpu = <&cpu3>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		out-ports {
> +			port {
> +				etm3_out_port: endpoint {
> +					remote-endpoint = <&funnel1_in_port3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	debug0@fec10000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfec10000 0 0x1000>;
> +		cpu = <&cpu0>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +	};
> +
> +	debug1@fed10000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfed10000 0 0x1000>;
> +		cpu = <&cpu1>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +	};
> +
> +	debug2@fee10000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfee10000 0 0x1000>;
> +		cpu = <&cpu2>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +	};
> +
> +	debug3@fee10000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfef10000 0 0x1000>;
> +		cpu = <&cpu3>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +	};
> +
> +	funnel1@fe920000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0 0xfe920000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +			port@0 {
> +				reg = <0x0>;
> +				funnel1_in_port0: endpoint {
> +					remote-endpoint = <&etm0_out_port>;
> +				};
> +			};
> +			port@1 {
> +				reg = <0x1>;
> +				funnel1_in_port1: endpoint {
> +					remote-endpoint = <&etm1_out_port>;
> +				};
> +			};
> +			port@2 {
> +				reg = <0x2>;
> +				funnel1_in_port2: endpoint {
> +					remote-endpoint = <&etm2_out_port>;
> +				};
> +			};
> +			port@3 {
> +				reg = <0x3>;
> +				funnel1_in_port3: endpoint {
> +					remote-endpoint = <&etm3_out_port>;
> +				};
> +			};
> +		};
> +		out-ports {
> +			port {
> +				funnel1_out_port0: endpoint {
> +					remote-endpoint = <&etf1_in_port>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel2@fe930000 {
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +		reg = <0 0xfe930000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +			port@2 {
> +				reg = <0x2>;
> +				funnel2_in_port2: endpoint {
> +					remote-endpoint = <&etf1_out_port>;
> +				};
> +			};
> +			// Funnel2 has another input port connected to
> +			// funnel0's output. Funnel0 gathers Cortex-R5 ETMs.

C++ style comments.  

> +		};
> +		out-ports {
> +			port {
> +				funnel2_out_port0: endpoint {
> +					remote-endpoint = <&etf2_in_port>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etf1@fe940000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0 0xfe940000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			port {
> +				etf1_in_port: endpoint {
> +					remote-endpoint = <&funnel1_out_port0>;
> +				};
> +			};
> +		};
> +		out-ports {
> +			port {
> +				etf1_out_port: endpoint {
> +					remote-endpoint = <&funnel2_in_port2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etf2@fe950000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0 0xfe950000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			port {
> +				etf2_in_port: endpoint {
> +					remote-endpoint = <&funnel2_out_port0>;
> +				};
> +			};
> +		};
> +		out-ports {
> +			port {
> +				etf2_out_port: endpoint {
> +					remote-endpoint =
> +						<&replicator_in_port0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	replicator {
> +		compatible = "arm,coresight-static-replicator";
> +		in-ports {
> +			port {
> +				replicator_in_port0: endpoint {
> +					remote-endpoint = <&etf2_out_port>;
> +				};
> +			};
> +		};
> +		out-ports {
> +			#address-cells = <0x1>;
> +			#size-cells = <0x0>;
> +			port@0 {
> +				reg = <0x0>;
> +				replicator_out_port0: endpoint {
> +					remote-endpoint = <&etr_in_port>;
> +				};
> +			};
> +			port@1 {
> +				reg = <0x1>;
> +				replicator_out_port1: endpoint {
> +					remote-endpoint = <&tpiu_in_port>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etr@fe970000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0 0xfe970000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			port {
> +				etr_in_port: endpoint {
> +					remote-endpoint =
> +						<&replicator_out_port0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpiu@fe980000  {
> +		compatible = "arm,coresight-tpiu", "arm,primecell";
> +		reg = <0 0xfe980000 0 0x1000>;
> +		clocks = <&clk100>;
> +		clock-names = "apb_pclk";
> +		in-ports {
> +			port {
> +				tpiu_in_port: endpoint {
> +					remote-endpoint =
> +						<&replicator_out_port1>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 3c731e73903a..ca0a6b9f4445 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -12,6 +12,8 @@
>   * the License, or (at your option) any later version.
>   */
>  
> +#include "zynqmp-coresight.dtsi"
> +

Those bindings are correctly used.  If Michal doesn't mind the nit-picks I have
highlighted above then

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Otherwise feel free to add my tag to your next revision, which I advise you to
send out once v5.6-rc1 comes out.

Thanks,
Mathieu

>  / {
>  	compatible = "xlnx,zynqmp";
>  	#address-cells = <2>;
> -- 
> 2.11.0
> 
