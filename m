From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v18 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Fri, 05 Dec 2014 14:55:24 +0100
Message-ID: <1417787724.3227.10.camel@pengutronix.de>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Freitag, den 05.12.2014, 14:22 +0800 schrieb Andy Yan:
> We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
> use the interface compatible Designware HDMI IP, but they also have some
> lightly differences, such as phy pll configuration, register width(imx hdmi
> register is one byte, but rk3288 is 4 bytes width and can only be accessed
> by word), 4K support(imx6 doesn't support 4k, but rk3288 does), and HDMI2.0
> support.
> 
> To reuse the imx-hdmi driver, we make this patch set:
> (1): fix some CodingStyle warning to make checkpatch happy
> (2): convert imx-hdmi to drm_bridge
> (3): split platform specific code
> (4): move imx-hdmi to bridge/dw_hdmi
> (5): extend dw_hdmi.c to support rk3288 hdmi
> (6): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c
> 
> Changes in v18:
> - remove a multiple blank lines in imx-hdmi.c
> - fix a checkpatch warning in imx-hdmi_pltfm.c
> - add port bindings
> - correct some spelling mistakes in dw_hdmi bindings doc
> - correct some spelling mistakes in dw_hdmi-rockchip bindings doc
[...]

I am happy with the series so far. Pending Acks from the device tree
maintainers for the new binding documents, I'd like to apply either the
whole of it on top of
    git://git.pengutronix.de/git/pza/linux.git imx-drm/next
or take at least the i.MX specific patches (1-5) because of the
dependency on the imx-drm OF helper conversion.

regards
Philipp
