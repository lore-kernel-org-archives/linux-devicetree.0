From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P)
 support
Date: Thu, 3 Nov 2016 16:32:46 -0600
Message-ID: <20161103223246.GA5135@hector>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
 <20161028000656.GH26139@codeaurora.org>
 <822ebad4-4fdf-574a-12cb-75b0165f4746@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <822ebad4-4fdf-574a-12cb-75b0165f4746@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jmcnicol@redhat.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, Bastian =?iso-8859-1?Q?K=F6cher?= <mail@kchr.de>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 05:54:01PM -0700, Jeremy McNicoll wrote:
> On 2016-10-27 5:06 PM, Stephen Boyd wrote:
> >On 10/25, Jeremy McNicoll wrote:
> >>diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> >>new file mode 100644
> >>index 0000000..2fc68c4
> >>--- /dev/null
> >>+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> >>@@ -0,0 +1,40 @@
> >>+/* Copyright (c) 2015, Huawei Inc. All rights reserved.
> >>+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or modify
> >>+ * it under the terms of the GNU General Public License version 2 and
> >>+ * only version 2 as published by the Free Software Foundation.
> >>+ *
> >>+ * This program is distributed in the hope that it will be useful,
> >>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>+ * GNU General Public License for more details.
> >>+ */
> >>+
> >>+/dts-v1/;
> >>+
> >>+#include "msm8994-v2.0.dtsi"
> >>+
> >>+/ {
> >>+	model = "HUAWEI MSM8994 ANGLER rev-1.01";
> >>+	compatible = "qcom,msm8994";
> >
> >Please replace this with something more specific for the actual
> >board. Preferably with the board manufacturer vendor prefix and
> >some sort of string for the board.

Something like?

"huawei,nexus-6P", "qcom,msm8994"
