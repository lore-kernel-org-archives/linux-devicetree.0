From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCHv2 0/2] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Sat, 18 Jan 2014 16:27:05 +0800
Message-ID: <20140118082703.GA3430@S2101-09.ap.freescale.net>
References: <1389860123-14874-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389860123-14874-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 09:15:21AM +0100, Lothar Wa=DFmann wrote:
> This patch adds support for the Ka-Ro electronics GmbH TX53 modules.
> There are two distinct module types. One with an LVDS display
> interface and SATA support, the other with a parallel LCD
> interface and no SATA interface.
>=20
> Changes wrt. v1:
> - set the '#pwm-cells' property locally due to the changed
>   pwm-polarity patch that made this property optional.
>   see <1389859585-14006-3-git-send-email-LW@KARO-electronics.de>

Applied both, thanks.

But please be aware that componentised device adoption required by
moving imx-drm out of staging tree will need some additional change.
Let's fixed it up when it comes.

Shawn
