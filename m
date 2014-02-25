From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC PATCH v4 4/8] staging: imx-drm: Document imx-hdmi device
 tree bindings
Date: Tue, 25 Feb 2014 12:13:35 -0300
Message-ID: <CAOMZO5AnXYEDB5PfQUNW_bY7ng8YkSYGK5y_Em04t6L-Eb2g+g@mail.gmail.com>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
 <1393338203-25051-5-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1393338203-25051-5-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 25, 2014 at 11:23 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> This patch adds device tree binding documentation for the HDMI transmitter
> on i.MX6.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/staging/imx-drm/hdmi.txt   | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
>
> diff --git a/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt b/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
> new file mode 100644
> index 0000000..7dcd673a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt
> @@ -0,0 +1,53 @@
> +Device-Tree bindings for HDMI Transmitter
> +
> +HDMI Transmitter
> +================
> +
> +The LVDS Display Bridge device tree node contains up to two lvds-channel
> +nodes describing each of the two LVDS encoder channels of the bridge.

Copy and paste error? ;-)
