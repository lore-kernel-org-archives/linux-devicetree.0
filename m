From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] imx-drm: imx-ldb: Use OF graph to find connected panel
Date: Thu, 06 Mar 2014 15:01:30 +0100
Message-ID: <1394114490.3622.15.camel@paszta.hi.pengutronix.de>
References: <1394114080-27223-1-git-send-email-p.zabel@pengutronix.de>
	<1394114080-27223-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1394114080-27223-2-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 06.03.2014, 14:54 +0100 schrieb Philipp Zabel:
> This patch depends on the OF graph parsing helper and imx-drm-dt series.
> It allows to connect the panel to the output port (port@1 on i.MX53, port@4
> on i.MX6) via the OF graph bindings.

If we postpone this until the imx-drm-dt binding series gets accepted, I
can just squash the two patches together.

regards
Philipp
