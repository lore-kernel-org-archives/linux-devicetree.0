From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 01/11] MIPS: ath79: add helpers for setting clocks and
 expose the ref clock
Date: Mon, 21 Jan 2019 18:11:07 -0600
Message-ID: <20190122001107.GA28193@bogus>
References: <20190111142240.10908-1-o.rempel@pengutronix.de>
 <20190111142240.10908-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111142240.10908-2-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 03:22:30PM +0100, Oleksij Rempel wrote:
> From: Felix Fietkau <nbd@nbd.name>
> 
> Preparation for transitioning the legacy clock setup code over
> to OF.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  arch/mips/ath79/clock.c               | 128 +++++++++++++-------------

>  include/dt-bindings/clock/ath79-clk.h |   3 +-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 68 insertions(+), 63 deletions(-)
