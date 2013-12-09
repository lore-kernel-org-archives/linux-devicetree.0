From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCHv13] ARM: dts: Add support for the cpuimx25 board from
 Eukrea and its baseboard.
Date: Mon, 9 Dec 2013 11:52:52 +0800
Message-ID: <20131209035250.GE825@S2101-09.ap.freescale.net>
References: <1386255416-18661-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1386255416-18661-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 03:56:56PM +0100, Denis Carikli wrote:
> The following devices/functionalities were added:
>  * Main and secondary UARTs.
>  * i2c and the pcf8563 device.
>  * Ethernet.
>  * NAND.
>  * The BP1 button.
>  * The LED.
>  * Watchdog
>  * SD.
> =

> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric B=E9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v10->v13:
> - The display part was splitted out because it depends on other
>   patches that are not applied yet, the commit message was updated accord=
ingly.
> - The new GPIO and input defines are now used in the dts(i).
> =

> ChangeLog v9->v10:
> - Adapted to the new pingrp patches.
> =

> ChangeLog v8->v9:
> - Licenses were shortened.
> ---
>  arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi       |   60 ++++++++++
>  .../boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts  |  119 ++++++++++++++=
++++++
>  2 files changed, 179 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx25-eukrea-cpuimx25.dtsi
>  create mode 100644 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard.dts

Added the dtb target into arch/arm/boot/dts/Makefile, and applied the
patch.

Shawn
