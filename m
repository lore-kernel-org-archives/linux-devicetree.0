From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 1/1] ARM i.MX6: change mxs usbphy clock usage
Date: Fri, 18 Jan 2013 10:55:10 +0800
Message-ID: <20130118025508.GB31381@S2101-09.ap.freescale.net>
References: <1358476685-28572-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1358476685-28572-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, kernel@pengutronix.de, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, festevam@gmail.com, marex@denx.de, mkl@pengutronix.de, m.grzeschik@pengutronix.de, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 18, 2013 at 10:38:05AM +0800, Peter Chen wrote:
> This mxs usbphy is only needs to be on after system boots
> up, and software never needs to control it anymore.
> Meanwhile, usbphy's parent needs to be notified if usb
> is suspend or not. So we design below mxs usbphy usage:
> 
> - usbphy1_gate and usbphy2_gate:
> Their parents are dummy clock, we only needs to enable
> it after system boots up.
> - usbphy1 and usbphy2
> Usage reserved bit for this clock, in that case, the refcount
> will be updated, but without hardware changing.
> 
> Signed-off-by: Peter Chen <peter.chen@freescale.com>

Applied, thanks.

