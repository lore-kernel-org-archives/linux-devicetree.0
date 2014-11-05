From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH V2 1/2] imx-drm: imx-hdmi: split imx soc specific code
 from imx-hdmi
Date: Wed, 5 Nov 2014 13:30:40 +0000
Message-ID: <545A2680.2@imgtec.com>
References: <1415192385-6572-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415192385-6572-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org


This one patch does too much to be reviewed easily.

One patch is supposed to modify/add one thing at a time in the kernel.

Separating platform specific code from imx-drm/imx-hdmi is one thing.

Adding support for multi-byte register access is something different.

i.e. Something like.
1/3 split platform specific code out.
2/3 move/rename imx-hdmi outside the folder
3/3 add support for multi byte register width access.

If there are other things that are not directly relevant to the patch,
it goes in a different patch. Bug fixes are also separate.

This should result in readable patches that can be reviewed easily.

Also, the approach with 4 byte access is ok. But you could use reg-shifts as well perhaps.
Then you won't have to change so much of the code.

static inline void hdmi_writeb(struct dwc_hdmi *hdmi, u8 val, int offset)
+{
+ writeb(val, hdmi->regs + (offset << hdmi->reg_shift));
+}
+
+static inline u8 hdmi_readb(struct dwc_hdmi *hdmi, int offset)
+{
+ return readb(hdmi->regs + (offset << hdmi->reg_shift));
+}

And then in probe

+hdmi->reg_shift = 0;
+
+ if (of_property_read_u32(np, "reg-shift", &hdmi->reg_shift))
+ dev_warn(hdmi->dev, "No reg-shift\n");

This way the reg-shift property can be defined using DT

Cheers,
ZubairLK

On 05/11/14 12:59, Andy Yan wrote:
> imx6 and rockchip rk3288 and JZ4780 (Ingenic Xburst/MIPS)
> use the interface compatible Designware HDMI IP, but they
> also have some lightly difference, such as phy pll configuration,
> register width(imx hdmi register is one byte, but rk3288 is 4
> bytes width), 4K support(imx6 doesn't support 4k, but rk3288 does),
> clk useage,and the crtc mux configuration is also platform specific.
> 
> To reuse the imx hdmi driver, split the platform specific code out
> to dw_hdmi-imx.c.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>  drivers/staging/imx-drm/Makefile      |   2 +-
>  drivers/staging/imx-drm/dw_hdmi-imx.c | 214 ++++++++++
>  drivers/staging/imx-drm/imx-hdmi.c    | 726 ++++++++++++++--------------------
>  include/drm/bridge/dw_hdmi.h          | 114 ++++++
>  4 files changed, 634 insertions(+), 422 deletions(-)
>  create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
>  create mode 100644 include/drm/bridge/dw_hdmi.h
