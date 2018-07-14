From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: imx6sl-evk: add missing GPIO iomux setting
Date: Sat, 14 Jul 2018 13:09:59 -0300
Message-ID: <CAOMZO5AcJSMyh3Y51K+4P2Ha-aX9kbeZCT6gFN9tV90p-6F2hg@mail.gmail.com>
References: <1531533238-8816-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531533238-8816-1-git-send-email-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Fri, Jul 13, 2018 at 10:53 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> On i.MX6SL EVK board, the MX6SL_PAD_KEY_ROW5 pin is
> used as lcd 3v3 regulator control pin, need to make
> sure MX6SL_PAD_KEY_ROW5 is muxed as GPIO function
> for controlling lcd 3v3 regulator.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Looks good now, thanks:

Reviewed-by; Fabio Estevam <fabio.estevam@nxp.com>
