From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mq-evk: Add fsl,magic-packet
 property
Date: Fri, 1 Feb 2019 18:49:00 +0800
Message-ID: <20190201104859.GA22413@dragon>
References: <20190128095212.14681-1-ccaione@baylibre.com>
 <20190128095212.14681-3-ccaione@baylibre.com>
 <CAOMZO5B1M9VPB=yXhyKDA8diXo7YuAusTa=uY1Uv6E+hWDqQHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5B1M9VPB=yXhyKDA8diXo7YuAusTa=uY1Uv6E+hWDqQHA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 10:11:56AM -0200, Fabio Estevam wrote:
> On Mon, Jan 28, 2019 at 7:53 AM Carlo Caione <ccaione@baylibre.com> wrote:
> >
> > Add the fsl,magic-packet property in the fec nome.
> 
> s/nome/node/

Fixed it up and applied both patches.

Shawn
