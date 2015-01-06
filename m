From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v18.1 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Tue, 6 Jan 2015 13:42:54 +0000
Message-ID: <20150106134254.GE12302@n2100.arm.linux.org.uk>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
 <1417760705-17000-1-git-send-email-andy.yan@rock-chips.com>
 <2418550.Y9upXa8SAB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2418550.Y9upXa8SAB@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, airlied@linux.ie, fabio.estevam@freescale.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Josh Boyer <jwboyer@redhat.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>, Zubair.Kakakhel@imgtec.com, djkurtz@google.com, ykk@rock-chips.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, jay.xu@rock-chips.com, Pawel Moll <pawel.moll@arm.com>, mark.yao@rock-chips.com, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
List-Id: devicetree@vger.kernel.org

On Tue, Jan 06, 2015 at 12:52:24PM +0100, Heiko St=FCbner wrote:
> +static void imx_hdmi_bridge_nope(struct drm_bridge *bridge)

"_nope" ?  As in "No"?  Or should this be "_nop" for no-operation ?

--=20
=46TTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
