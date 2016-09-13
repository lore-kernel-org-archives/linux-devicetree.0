From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3] ARM: dts: artpec6.dtsi updates
Date: Tue, 13 Sep 2016 16:05:44 +0200
Message-ID: <2398929.KttRDJeEu5@wuerfel>
References: <cover.1471959733.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1471959733.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, arm@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, August 23, 2016 4:00:49 PM CEST Lars Persson wrote:
> This brings the dtsi up to date with with tested and optimized settings from the
> Axis tree.
> 
> Lars Persson (3):
>   ARM: dts: artpec: use clock binding header
>   ARM: dts: artpec: use optimized pl310 settings
>   ARM: dts: artpec: set irq affinity on pmu interrupts
> 
>  arch/arm/boot/dts/artpec6.dtsi | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> 

Applied all three to next/dt, thanks for your patience and sorry
for the delay on my side.

	Arnd
