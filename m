From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Wed, 03 Dec 2014 10:19:58 +0100
Message-ID: <1417598398.5124.2.camel@pengutronix.de>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
 <1417544629.3411.15.camel@pengutronix.de> <547E5F51.2090800@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <547E5F51.2090800@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.comLucas Stach <l>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Mittwoch, den 03.12.2014, 08:54 +0800 schrieb Andy Yan:
> >> +Required properities:
> >> +- compatible: platform specific such as:
> >> +   * "fsl,imx6q-hdmi"
> >> +   * "fsl,imx6dl-hdmi"
> >> +   * "rockchip,rk3288-dw-hdmi"
> > I think we should add a common compatible value "snps,dw-hdmi-tx" here:
> >
> > 	compatible = "fsl,imx6q-hdmi", "snps,dw-hdmi-tx";
> >
>       How about "snps,dw-hdmi", because the driver is not only about
>    hdmi tx, but also include hdmi phy.

Synopsys call the whole module
"DesignWare HDMI Transmitter (TX) IP Solution":

https://www.synopsys.com/dw/ipdir.php?ds=dwc_hdmi_14_csds_tx
https://www.synopsys.com/dw/ipdir.php?ds=dwc_hdmi_20_csds_tx

That includes the PHY. I'd prefer keeping the -tx in there to
differentiate from a possible future "snps,dw-hdmi-rx":

https://www.synopsys.com/dw/ipdir.php?ds=dwc_hdmi_14_csds_rx
https://www.synopsys.com/dw/ipdir.php?ds=dwc_hdmi_20_csds_rx

>        If we add such compatible value, do we have to implement another
>     platform driver like dw_hdmi-pltfm.c with the 
> compatible="snps,dw-hdmi" ,
>     or just include the compatible value in dw_hdmi-imx.c and 
> dw_hdmi-rockchip.c?

That common compatible doesn't have to be used by any driver. It's just
there to show these are the same/similar IP core.
If a common driver without any SoC specific knowledge could be written,
that one would match against the common compatible.

regards
Philipp
