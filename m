From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 06/11] MIPS: ath79: export switch MDIO reference clock
Date: Mon, 21 Jan 2019 18:11:59 -0600
Message-ID: <20190122001159.GA29831@bogus>
References: <20190111142240.10908-1-o.rempel@pengutronix.de>
 <20190111142240.10908-7-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111142240.10908-7-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 03:22:35PM +0100, Oleksij Rempel wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> On AR934x, the MDIO reference clock can be configured to a fixed 100 MHz
> clock. If that feature is not used, it defaults to the main reference
> clock, like on all other SoC.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  arch/mips/ath79/clock.c               | 8 ++++++++

>  include/dt-bindings/clock/ath79-clk.h | 3 ++-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 10 insertions(+), 1 deletion(-)
