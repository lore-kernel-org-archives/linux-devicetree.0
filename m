From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/1] clk: meson8b: remove CLKID with typo ("ABP" -> "APB")
Date: Mon, 1 Apr 2019 10:34:34 +0200
Message-ID: <9b7b7257-0c33-35bc-c383-5350d1640ca2@baylibre.com>
References: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19/03/2019 22:41, Martin Blumenstingl wrote:
> This is a follow-up of my previous series from [0]:
>   clk: meson8b: fix typo "ABP" -> "APB"
> 
> The previous series introduced a fixed CLKID. Nothing uses the CLKID
> with the typo anymore so it's removed with this patch.
> 
> 
> [0] https://patchwork.kernel.org/cover/10804943/
> 
> 
> Martin Blumenstingl (1):
>   dt-bindings: clock: meson8b: drop the "ABP" clock definition
> 
>  include/dt-bindings/clock/meson8b-clkc.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied to next/headers for Linux 5.2-rc1
