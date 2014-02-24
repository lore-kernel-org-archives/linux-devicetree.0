From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v3 1/9] staging: imx-drm-core: don't request probe
	deferral in imx_drm_encoder_parse_of
Date: Mon, 24 Feb 2014 18:41:21 +0100
Message-ID: <1393263681.3091.84.camel@pizza.hi.pengutronix.de>
References: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
	<1392723370-4772-2-git-send-email-p.zabel@pengutronix.de>
	<20140224154919.GL21483@n2100.arm.linux.org.uk>
	<1393260998.3091.63.camel@pizza.hi.pengutronix.de>
	<20140224170653.GO21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140224170653.GO21483@n2100.arm.linux.org.uk>
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

Am Montag, den 24.02.2014, 17:06 +0000 schrieb Russell King - ARM Linux:
> On Mon, Feb 24, 2014 at 05:56:38PM +0100, Philipp Zabel wrote:
> > Am Montag, den 24.02.2014, 15:49 +0000 schrieb Russell King - ARM Linux:
> > One issue was that the DT parsing code would try to add the imx-ldb
> > component right after the first crtc, and then its bind would fail
> > in imx_drm_encoder_parse_of because the three remaining crtcs were
> > not yet registered. This is already fixed by adding the crtc
> > components first.
> 
> That's what happens anyway - we add /all/ the CRTCs first before we
> start adding the connectors.

Yes, I know. I accidentally removed that feature when I switched to
parsing the OF graph instead of the crtcs and encoder properties, but
I've fixed this again in v3 without moving this patch out of the way.

regards
Philipp
