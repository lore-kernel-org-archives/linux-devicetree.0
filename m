From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Mon, 13 Jan 2014 20:30:35 +0800
Message-ID: <20140113123033.GU23525@S2101-09.ap.freescale.net>
References: <1389609158-11179-1-git-send-email-LW@KARO-electronics.de>
 <1389609158-11179-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389609158-11179-3-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 11:32:38AM +0100, Lothar Wa=DFmann wrote:
> This patch adds support for the Ka-Ro electronics GmbH TX53 modules.
> There are two distinct module types. One with an LVDS display
> interface and SATA support, the other with a parallel LCD
> interface and no SATA interface.
>=20
> Signed-off-by: Lothar Wa=DFmann <LW@KARO-electronics.de>

The patch looks good to me.  Ping me when pwm driver changes gets
accepted.

Shawn
