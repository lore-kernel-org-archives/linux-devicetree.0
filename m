From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH] arm64: dts: k3-am65-wakeup: Fix wakeup_uart reg address
Date: Fri, 5 Oct 2018 20:40:22 +0530
Message-ID: <8dc7a5d5-3e21-c2be-fde1-3f2bc6396bec@ti.com>
References: <20180927050146.17847-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927050146.17847-1-vigneshr@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Thursday 27 September 2018 10:31 AM, Vignesh R wrote:
> cbass_wakeup interconnect which is the parent of wakeup_uart node
> defines address-cells=1 and size-cells=1, therefore fix up reg property
> of wakeup_uart node accordingly. Otherwise, this UART instance fails to
> probe if enabled.
> 
> Fixes: 4201af2544b3 ("arm64: dts: ti: am654: Add uart nodes")
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh
