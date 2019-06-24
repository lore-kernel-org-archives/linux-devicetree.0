From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ul: fix PWM[1-4] interrupts
Date: Mon, 24 Jun 2019 21:14:18 +0800
Message-ID: <20190624131417.GB16146@dragon>
References: <20190618155834.15545-1-sebastien.szymanski@armadeus.com>
 <20190624004703.GF3800@dragon>
 <670f98af-2c55-de1f-d36c-37d1f33086c7@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <670f98af-2c55-de1f-d36c-37d1f33086c7@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 09:36:37AM +0200, S=E9bastien Szymanski wrote:
> Hello,
> =

> On 6/24/19 2:47 AM, Shawn Guo wrote:
> > +Lothar
> > =

> > On Tue, Jun 18, 2019 at 05:58:34PM +0200, S=E9bastien Szymanski wrote:
> >> According to the i.MX6UL/L RM, table 3.1 "ARM Cortex A7 domain interru=
pt
> >> summary", the interrupts for the PWM[1-4] go from 83 to 86.
> >>
> >> Fixes: b9901fe84f02 ("ARM: dts: imx6ul: add pwm[1-4] nodes")
> >> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> > =

> > Just curious - did you spot the error by testing PWM or merely by
> > looking at the code and document?
> =

> I spotted the error when trying to play sound with PWM [1].
> The PWM driver (drivers/pwm/pwm-imx27.c) don't use interrupt that's
> probably why nobody notice this error.

Thanks for the info.  Patch applied, thanks.

Shawn

> =

> [1] https://github.com/sasamy/imx-snd-pwm
