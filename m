From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v2 09/15] arm64: dts: imx8qm: add lsio ss support
Date: Wed, 17 Jul 2019 16:24:33 +0800
Message-ID: <CAA+hA=Sy3=6VF1eZJ-g_nhqbpCy+td+VEOUUK2pLrZAQpbAcFA@mail.gmail.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
 <1563290089-11085-10-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5DZDX4hGmLLT0+5e0VDhws-DknhAwyKyAxva8x5F2BYjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5DZDX4hGmLLT0+5e0VDhws-DknhAwyKyAxva8x5F2BYjw@mail.gmail.com>
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

On Wed, Jul 17, 2019 at 3:30 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Jul 16, 2019 at 12:37 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> > +&lsio_gpio0 {
> > +       compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
>
> fsl,imx8qm-gpio needs to be documented.

Yes, as documented in cover-letter.
Will submit in a separate patch.

Regards
Aisheng
