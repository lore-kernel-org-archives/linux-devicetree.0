From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH 1/2] ARM: dts: cm-t54: fix serial console power supply.
Date: Thu, 4 Sep 2014 15:40:23 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1409041539540.23951@utopia.booyaka.com>
References: <1409835773-22782-1-git-send-email-lifshitz@compulab.co.il> <1409835773-22782-2-git-send-email-lifshitz@compulab.co.il>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1409835773-22782-2-git-send-email-lifshitz@compulab.co.il>
Sender: linux-omap-owner@vger.kernel.org
To: Dmitry Lifshitz <lifshitz@compulab.co.il>
Cc: =?ISO-8859-15?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 4 Sep 2014, Dmitry Lifshitz wrote:

> LDO8 regulator is used for act led and serial cosole power supply.
> 
> Its DT status is declared as "disabled", however the serial console was
> functional until Commit 318dbb02b ("regulator: palmas: Fix SMPS
> enable/disable/is_enabled") wich properly turns off LDO8 on boot.
> 
> Fix serial cosole power supply (and act led) on boot by turning LDO8 on.
> 
> Signed-off-by: Dmitry Lifshitz <lifshitz@compulab.co.il>

Tested-by: Paul Walmsley <paul@pwsan.com>


- Paul
