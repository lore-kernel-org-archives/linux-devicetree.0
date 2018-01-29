From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 0/7] ARM: dts: imx6q: engicam LVDS panel changes
Date: Mon, 29 Jan 2018 18:35:43 +0800
Message-ID: <20180129103542.GE26461@dragon>
References: <1515046345-15881-1-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515046345-15881-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 11:42:18AM +0530, Jagan Teki wrote:
> Series add LVDS panel attributes on panel drivers instead of defining
> them in dts nodes, and also added new icorem6 engicam boards
> 
> Jagan Teki (7):
>   drm/panel: simple: add support for Ampire AM-800480AYTZQW-00H
>   ARM: dts: imx6q-icore: Switch LVDS timings from panel-simple
>   ARM: dts: imx6dl-icore: Add LVDS node
>   drm/panel: simple: Add support for KEO TX31D200VM0BAA
>   ARM: dts: imx6q-icore-ofcap12: Switch LVDS timings from panel-simple
>   ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 7
>     initial support
>   ARM: dts: imx6q: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit
>     support

Those two "drm/panel" patches should be sent to DRM maintainer and list.
I can only take the DTS chagnes after "drm/panel" patches get merged.

Shawn
