From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: a711: set regulator for each
 cluster of CPUs
Date: Wed, 28 Feb 2018 14:19:51 +0100
Message-ID: <20180228141951.3a06bc11@windsurf.lan>
References: <cover.f1ec43f8d2a0151c52434f0952e973b19626f285.1519823347.git-series.quentin.schulz@bootlin.com>
        <07883d44949420891c1ed2411ff15199d53075c0.1519823347.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <07883d44949420891c1ed2411ff15199d53075c0.1519823347.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 28 Feb 2018 14:11:21 +0100, Quentin Schulz wrote:

> @@ -136,6 +144,7 @@
>   * An USB-2 hub is connected here, which also means we don't need to
>   * enable the OHCI controller.
>   */
> +
>  &ehci0 {
>  	status = "okay";
>  };

Spurious change.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
