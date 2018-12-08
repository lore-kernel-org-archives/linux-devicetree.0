From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Fri, 07 Dec 2018 16:20:02 -0800
Message-ID: <7hftv8yiml.fsf@baylibre.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-2-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207105231.25593-2-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com, ingrassia@epigenesys.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Carlo Caione <ccaione@baylibre.com> writes:

> A long running stress test on a custom board shipping an AXG SoCs and a
> Realtek RTL8211F PHY revealed that after a few hours the connection
> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
> the 'macirq' (eth0) IRQ would stop being triggered at all and as
> consequence the GMAC IRQs never ACKed.
>
> After a painful investigation the problem seemed to be due to a wrong
> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
> EDGE_RISING.
>
> The change in the macirq IRQ type also solved another long standing
> issue affecting this SoC/PHY where EEE was causing the network
> connection to die after stressing it with iperf3 (even though much
> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
> well.
>
> Fixes: feb3cbea0946 ("ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage")
> Fixes: 6d28d577510f ("ARM64: dts: meson-axg: fix ethernet stability issue")
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Queuing this one for v4.21 (dt64 branch)

I'm going to wait for the dust to settle on 'PATCH v2 2/2' for the
32-bit SoCs (and will rely on Martin's recommendation for the final
decision there.)

Kevin
