Return-Path: <SRS0=k3cm=IC=atomide.com=tony@kernel.org>
Date: Tue, 15 May 2018 11:18:20 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: am335x-baltos-ir3220: Use IRQ_TYPE specifier
Message-ID: <20180515181820.GX98604@atomide.com>
References: <1526253393-3247-1-git-send-email-hernan@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1526253393-3247-1-git-send-email-hernan@vanguardiasur.com.ar>
To: =?utf-8?Q?Hern=C3=A1n?= Gonzalez <hernan@vanguardiasur.com.ar>
Cc: bcousson@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Hernán Gonzalez <hernan@vanguardiasur.com.ar> [180513 23:19]:
> GPIO_ACTIVE_LOW was being used to specify an interrupt, use
> IRQ_TYPE_EDGE_RISING instead. This improves DT readability.

Thanks applying all five similar patchs into omap-for-v4.18/dt.

Tony
