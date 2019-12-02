Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC247C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:04:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89EB62084F
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfLBREc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:04:32 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58575 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfLBREb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:04:31 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ibp7Q-0007Zx-2p; Mon, 02 Dec 2019 18:04:16 +0100
Message-ID: <cd0fae1a6b88a37e034876b53b350e79f58c654f.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Update Hisilicon reset doc
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jun Nie <jun.nie@linaro.org>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        xuwei5@hisilicon.com, opensource@jilayne.com, swinslow@gmail.com,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Date:   Mon, 02 Dec 2019 18:04:11 +0100
In-Reply-To: <20191202144524.5391-2-jun.nie@linaro.org>
References: <20191202144524.5391-1-jun.nie@linaro.org>
         <20191202144524.5391-2-jun.nie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jun,

I have a few questions and comments about these patches. I notice that
the changed device trees only use the default setting. Are these new
features something that is required for the present SoCs, or is this in
preparation for a new SoC?

On Mon, 2019-12-02 at 22:45 +0800, Jun Nie wrote:
> Document the update of Hisilicon reset operation extension.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/clock/hisi-crg.txt    | 12 ++++----
>  include/dt-bindings/reset/hisilicon-resets.h  | 28 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/reset/hisilicon-resets.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/hisi-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> index cc60b3d423f3..fd8b0a964806 100644
> --- a/Documentation/devicetree/bindings/clock/hisi-crg.txt
> +++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> @@ -26,19 +26,21 @@ to specify the clock which they consume.
>  
>  All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
>  
> -- #reset-cells: should be 2.
> +- #reset-cells: should be 3.
>  
>  A reset signal can be controlled by writing a bit register in the CRG module.
> -The reset specifier consists of two cells. The first cell represents the
> +The reset specifier consists of three cells. The first cell represents the
>  register offset relative to the base address. The second cell represents the
> -bit index in the register.
> +bit index in the register. The third represent the flags to operation type.
> +
> +All reset flags could be found in <dt-bindings/reset/hisilicon-resets.h>
>  
>  Example: CRG nodes
>  CRG: clock-reset-controller@12010000 {
>  	compatible = "hisilicon,hi3519-crg";
>  	reg = <0x12010000 0x10000>;
>  	#clock-cells = <1>;
> -	#reset-cells = <2>;
> +	#reset-cells = <3>;
>  };
>  
>  Example: consumer nodes
> @@ -46,5 +48,5 @@ i2c0: i2c@12110000 {
>  	compatible = "hisilicon,hi3519-i2c";
>  	reg = <0x12110000 0x1000>;
>  	clocks = <&CRG HI3519_I2C0_RST>;
> -	resets = <&CRG 0xe4 0>;
> +	resets = <&CRG 0xe4 0 (HISI_ASSERT_SET | HISI_DEASSERT_CLEAR)>;
>  };
> diff --git a/include/dt-bindings/reset/hisilicon-resets.h b/include/dt-bindings/reset/hisilicon-resets.h
> new file mode 100644
> index 000000000000..983e42a0c318
> --- /dev/null
> +++ b/include/dt-bindings/reset/hisilicon-resets.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Hisilicon Reset definitions
> + *
> + * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
> + */
> +
> +#ifndef __DT_BINDINGS_RESET_HISILICON_H__
> +#define __DT_BINDINGS_RESET_HISILICON_H__
> +
> +/*
> + * The reset does not support the feature and corresponding
> + * values are not valid
> + */
> +#define HISI_ASSERT_NONE		(1 << 0)
> +#define HISI_DEASSERT_NONE		(1 << 1)

What is the purpose of these two? Surely a reset control that does
nothing is not useful?

> +
> +/* When set this function is activated by polling/setting/clearing this bit */
> +#define HISI_ASSERT_SET		(1 << 2)
> +#define HISI_DEASSERT_SET		(1 << 3)

> +#define HISI_ASSERT_CLEAR		(0 << 4)
> +#define HISI_DEASSERT_CLEAR		(0 << 5)
> +#define HISI_ASSERT_POLL		(0 << 6)
> +#define HISI_DEASSERT_POLL		(0 << 7)

These are all zero, checking for them with an & operation in the code
always returns false.

> +
> +#define HISI_RESET_DEFAULT		(HISI_ASSERT_SET | HISI_DEASSERT_CLEAR)
> +
> +#endif

regards
Philipp

