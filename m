From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v2 06/15] arm64: dts: imx8: add adma lpcg clocks
Date: Wed, 17 Jul 2019 16:22:08 +0800
Message-ID: <CAA+hA=T29ek3B=s_aRS9Rk82cNHzx4-AD-TZh4T1_L1ja66rBw@mail.gmail.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
 <1563290089-11085-7-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5CdBhJmdbavfWzpx0YPhAXgQvA+ik3GMz0e5U1j6ytyHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5CdBhJmdbavfWzpx0YPhAXgQvA+ik3GMz0e5U1j6ytyHg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 3:28 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Jul 16, 2019 at 12:37 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> > +       uart0_lpcg: clock-controller@5a460000 {
> > +               reg = <0x5a460000 0x10000>;
> > +               #clock-cells = <1>;
> > +               clocks = <&clk IMX_ADMA_UART0_CLK>,
> > +                        <&dma_ipg_clk>;
>
> Putting the clocks into a single line helps readability, even if it is
> over 80 col.
>

Is this a new rule? I'm not aware of this requirement.
By looking at imx8mq.dts, it seems also have not followed that rule.
I'm a bit concern that it might be super long for other lpcgs with 5 clocks.
e.g. enet.

Regards
Aisheng

> > +               bit-offset = <0 16>;
> > +               clock-output-names = "uart0_lpcg_baud_clk",
> > +                                    "uart0_lpcg_ipg_clk";
>
> Same here.
