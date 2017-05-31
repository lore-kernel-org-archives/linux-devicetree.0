From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v3] ARM: dts: at91: sama5d2_xplained: add pwm controller
Date: Wed, 31 May 2017 12:01:04 +0200
Message-ID: <20170531100104.ol6gkredbncq52kl@piout.net>
References: <1496222592-19375-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496222592-19375-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: nicolas.ferre@microchip.com, boris.brezillon@free-electrons.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 31/05/2017 at 12:23:12 +0300, Claudiu Beznea wrote:
> Add pwm controller bindings for sama5d2_xplained
> and enable it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
> Changes in v3:
> - enable pwm in at91-sama5d2_xplained.dts file
> 
> Changes in v2:
> - Correct the typo in patch subject.
> 
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 4 ++++
>  arch/arm/boot/dts/sama5d2.dtsi              | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
