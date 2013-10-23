From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [Patch v2 10/14] usb: doc: phy-mxs: update binding for adding
 disconnect line property
Date: Wed, 23 Oct 2013 16:44:10 +0800
Message-ID: <20131023084408.GQ2839@S2101-09.ap.freescale.net>
References: <1382421528-17897-1-git-send-email-peter.chen@freescale.com>
 <1382421528-17897-11-git-send-email-peter.chen@freescale.com>
 <20131023063154.GG2839@S2101-09.ap.freescale.net>
 <20131023070824.GH8534@shlinux1.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131023070824.GH8534@shlinux1.ap.freescale.net>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 03:08:25PM +0800, Peter Chen wrote:
> One more thing: it is a SoC feature, so I can delete it from DT, and
> using compatible string (or of_device_id.data) to judge if it is needed
> at driver, do you think so?

That's exactly my point - it's not a thing belonging to device tree.

Shawn

