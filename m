From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 17/41] dt-bindings: clock: Add bindings for DA8XX
 CFGCHIP clocks
Date: Fri, 2 Feb 2018 11:50:58 +0530
Message-ID: <572e31a2-ac18-512b-03bb-82fffcf4d228@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-18-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516468460-4908-18-git-send-email-david@lechnology.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
> +EMIFA clock source (ASYNC1)
> +---------------------------
> +Required properties:
> +- compatible: shall be "ti,da850-async1-clksrc".
> +- #clock-cells: from common clock binding; shall be set to 0.
> +- clocks: phandles to the parent clocks corresponding to clock-names
> +- clock-names: shall be "pll0_sysclk3", "div4.5"

Is this clock really referred to as aysnc1 in documentation? I don't get
hits for async1 in OMAP-L138 TRM.

Thanks,
Sekhar
