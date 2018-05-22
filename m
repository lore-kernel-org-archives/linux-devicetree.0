From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v11 03/27] clk: davinci: psc: allow for dev == NULL
Date: Tue, 22 May 2018 14:35:58 +0530
Message-ID: <250d94db-c33f-51c9-99c1-3a4ddcd627fa@ti.com>
References: <20180518164829.27052-1-david@lechnology.com>
 <20180518164829.27052-4-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180518164829.27052-4-david@lechnology.com>
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

On Friday 18 May 2018 10:18 PM, David Lechner wrote:
> On some davinci SoCs, we need to register the PSC clocks during early
> boot because they are needed for clocksource/clockevent. These changes
> allow for dev == NULL because in this case, we won't have a platform
> device for the clocks.
> 
> Some function declarations are moved to a public header files so that they can
> be called from mach init code.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
