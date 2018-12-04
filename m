From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson-axg: Enable watchdog on Meson AXG
 SoCs
Date: Tue, 04 Dec 2018 14:56:59 -0800
Message-ID: <7h8t14dhok.fsf@baylibre.com>
References: <20181123144541.15114-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181123144541.15114-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Carlo Caione <ccaione@baylibre.com> writes:

> Add the watchdog node also on the AXG platforms.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> V2:
>  - Remove amlogic,meson-axg-wdt compatible

Queued for v4.21 with Neil's tag (branch: v4.21/dt64)

Thanks,

Kevin
