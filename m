From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v2 10/15] arm64: dts: imx8qm: add conn ss support
Date: Wed, 17 Jul 2019 16:26:16 +0800
Message-ID: <CAA+hA=S=JMZDsbeJdzCRH+pikfy9nry-8UHq9V-75LuM0gxH6A@mail.gmail.com>
References: <1563290089-11085-1-git-send-email-aisheng.dong@nxp.com>
 <1563290089-11085-11-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5B=yK_S=2xRFt_1pAJ2iYE7CCCenOKQ3rjOeF3e+=vQtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5B=yK_S=2xRFt_1pAJ2iYE7CCCenOKQ3rjOeF3e+=vQtQ@mail.gmail.com>
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

On Wed, Jul 17, 2019 at 3:31 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Jul 16, 2019 at 12:37 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
> >
> > The CONN SS of MX8QM is mostly the same as MX8QXP except it has one more
> > USB HSIC module support. So we can fully reuse the exist CONN SS dtsi.
> > Add <soc>-ss-conn.dtsi with compatible string updated according to
> > imx8-ss-conn.dtsi.
>
> Subject and commit log does not match what the patch is actually doing.

What 'not match' did you mean?

Regards
Aisheng
