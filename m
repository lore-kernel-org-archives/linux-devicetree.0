From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 00/13] Common patches from downstream development
Date: Sat, 14 Sep 2019 10:30:06 +0800
Message-ID: <20190914023004.GA3425@dragon>
References: <20190827131806.6816-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190827131806.6816-1-philippe.schenker@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan @ agner . ch" <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 01:18:16PM +0000, Philippe Schenker wrote:
> 
> This patchset holds some common changes that were never upstreamed.
> With latest downstream kernel upgrade, I took the aproach to select
> mainline devicetrees and atomically add missing stuff for downstream.
> 
> These patches I send here are separated out with changes that also
> have a benefit for mainline.
> 
> --------------------- Update version 4 and later -----------------------
> Patches that got pulled in an earlier patchset version got dropped in
> this patchset.
> ------------------------------------------------------------------------
> 
> Philippe
> 
> Changes in v5:
> - changed legacy gpio-key,wakeup to wakeup-source
> - Add note in commit message about disabled status
> - Added Olek's reviewed-by
> - change group name
> - Add pinmux to iomuxc
> - Adjusted commit message
> - Switched to consistent naming: pinctrl_xxx: xxxgrp
> - Added Olek's Reviewed-by
> - Added Olek's Reviewed-by
> - Added Olek's Reviewed-by
> - Added Olek's Reviewd-by
> - Added Olek's Reviewed-by
> - Add Olek's Reviewed-by
> - Added note to commit message about disabled status
> - Add Olek's Reviewed-by
> 
> Changes in v4:
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Add Marcel Ziswiler's Ack
> - Move can nodes to module deviceteree include imx6ull-colibri.dtsi
> - Add Marcel Ziswiler's Ack
> 
> Changes in v3:
> - Add new commit message from Stefan's proposal on ML
> - Fix commit message
> - Fix commit title to "...imx6-apalis:..."
> 
> Changes in v2:
> - Deleted touchrevolution downstream stuff
> - Use generic node name
> - Better comment
> - Changed commit title to '...imx6qdl-apalis:...'
> - Deleted touchrevolution downstream stuff
> - Use generic node name
> - Put a better comment in there
> - Commit title
> - Removed f0710a
> that is downstream only
> - Changed to generic node name
> - Better comment
> 
> Max Krummenacher (2):
>   ARM: dts: imx6ull-colibri: reduce v_batt current in power off
>   ARM: dts: imx6ull: improve can templates
> 
> Philippe Schenker (9):
>   ARM: dts: imx7-colibri: Add touch controllers
>   ARM: dts: imx6qdl-colibri: Add missing pin declaration in iomuxc
>   ARM: dts: imx6qdl-apalis: Add sleep state to can interfaces
>   ARM: dts: imx6-apalis: Add touchscreens used on Toradex eval boards
>   ARM: dts: imx6-colibri: Add missing pinmuxing to Toradex eval board
>   ARM: dts: imx6ull-colibri: Add sleep mode to fec
>   ARM: dts: imx6ull-colibri: Add watchdog
>   ARM: dts: imx6ull-colibri: Add general wakeup key used on Colibri
>   ARM: dts: imx6ull-colibri: Add touchscreen used with Eval Board

Applied all, but except this one which uses base64
Content-Transfer-Encoding.

Shawn

> 
> Stefan Agner (2):
>   ARM: dts: imx7-colibri: add GPIO wakeup key
>   ARM: dts: imx7-colibri: fix 1.8V/UHS support
> 
>  arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts  | 39 +++++++++++
>  arch/arm/boot/dts/imx6q-apalis-eval.dts       | 13 ++++
>  arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts | 13 ++++
>  arch/arm/boot/dts/imx6q-apalis-ixora.dts      | 13 ++++
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi         | 27 ++++++--
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi        | 17 +++++
>  .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 38 +++++++++++
>  .../arm/boot/dts/imx6ull-colibri-nonwifi.dtsi |  2 +-
>  arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi   |  2 +-
>  arch/arm/boot/dts/imx6ull-colibri.dtsi        | 64 +++++++++++++++++--
>  arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi   | 38 +++++++++++
>  arch/arm/boot/dts/imx7-colibri.dtsi           | 30 ++++++++-
>  12 files changed, 280 insertions(+), 16 deletions(-)
> 
> -- 
> 2.23.0
> 
