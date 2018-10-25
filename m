From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 6/8] dts: imx: add common imx7ulp dtsi support
Date: Thu, 25 Oct 2018 13:44:06 -0300
Message-ID: <CAOMZO5ArziSkimJvKMFPR-RZwWywLmzjpmvAFT9fB0fp_J_YZw@mail.gmail.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-7-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540295058-26090-7-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 8:55 AM A.s. Dong <aisheng.dong@nxp.com> wrote:

> +               gpio_ptc: gpio@40ae0000 {
> +                       compatible = "fsl,vf610-gpio";

This should be:

compatible = "fsl,imx7ulp-gpio", "fsl,vf610-gpio";
