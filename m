From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 07/13] media: dt-bindings: add bindings for i.MX7
 media driver
Date: Tue, 22 May 2018 11:10:48 -0500
Message-ID: <20180522161048.GA17123@rob-hp-laptop>
References: <20180522145245.3143-1-rui.silva@linaro.org>
 <20180522145245.3143-8-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180522145245.3143-8-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2018 at 03:52:39PM +0100, Rui Miguel Silva wrote:
> Add bindings documentation for i.MX7 media drivers.
> The imx7 MIPI CSI2 and imx7 CMOS Sensor Interface.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/media/imx7-csi.txt    | 44 ++++++++++
>  .../bindings/media/imx7-mipi-csi2.txt         | 82 +++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
>  create mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt

Reviewed-by: Rob Herring <robh@kernel.org>
