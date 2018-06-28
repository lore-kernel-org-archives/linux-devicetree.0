From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v7 2/3] arm: shmobile: Add the R9A06G032 SMP enabler
 driver
Date: Thu, 28 Jun 2018 14:16:55 +0200
Message-ID: <20180628121655.bvawikztkd2qiefl@verge.net.au>
References: <1530173842-56851-1-git-send-email-michel.pollet@bp.renesas.com>
 <1530173842-56851-3-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530173842-56851-3-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Carlo Caione <carlo@endlessm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andy Gross <andy.gross@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 09:17:13AM +0100, Michel Pollet wrote:
> The Renesas R9A06G032 second CA7 is parked in a ROM pen at boot time, it
> equires a special enable method to get it started.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
