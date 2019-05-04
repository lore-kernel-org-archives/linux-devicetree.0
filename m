From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v3 0/3] MIPS: ath79: add ag71xx support
Date: Sun, 5 May 2019 00:01:00 +0800
Message-ID: <CAJsYDV+1dXfQ3qKMDkbbXa94UQ+DiNCQ3YQB=PTkeXJ19Xa8uQ@mail.gmail.com>
References: <20190422064046.2822-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422064046.2822-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

On Mon, Apr 22, 2019 at 2:41 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> [...]
> - most of deficetree bindings was removed. Not every thing made sense
>   and most of it is SoC specific, so it is possible to detect it by
>   compatible.

I noticed that you've dropped all PLL and gmac-config stuff. These are
board-specific properties and PLL registers should be changed
accroding to negotiated ethernet speed. By dropping them, you rely on
bootloader to configure everything corectly for you (which has been
proven unreliable for many ath79 routers) and ethernet won't work if
negotiated speed changed after u-boot's configuration.

Regards,
Chuanhong Guo
