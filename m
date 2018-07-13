From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: imx6sx-nitrogen6sx: remove obsolete display
 configuration
Date: Fri, 13 Jul 2018 15:54:32 -0300
Message-ID: <CAOMZO5CKw7tCsZq9mftZ_8fKtSGpQ9hWL8TOyLz9rNd_Gemg8g@mail.gmail.com>
References: <20180713124904.9285-1-gary.bisson@boundarydevices.com>
 <20180713124904.9285-4-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180713124904.9285-4-gary.bisson@boundarydevices.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 13, 2018 at 9:49 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> This display configuration isn't working as-is as it depends on the
> tfp410 LCD to HDMI bridge. This will need to be updated later once
> the DRM MXSFB driver will be the default.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
