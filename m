From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add system reset controller
Date: Tue, 15 Jan 2019 13:35:48 +0100
Message-ID: <20190115123548.GA16131@bogon.m.sigxcpu.org>
References: <20190115114641.GA15870@bogon.m.sigxcpu.org>
 <1547553117.4339.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1547553117.4339.8.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, Jan 15, 2019 at 12:51:57PM +0100, Lucas Stach wrote:
> Am Dienstag, den 15.01.2019, 12:46 +0100 schrieb Guido G=FCnther:
> > We can reuse the src from fsl,imx51-src as with other imx SOCs.
> =

> That's not true. The SRC is significantly different from the i.MX51
> one. See series "[PATCH v4 0/3] Reset controller support for i.MX8MQ".
> =

> We generally don't add the DT nodes until at least the binding, better
> yet the full driver, is upstream.

I guess I got carried away by the parts I needed working and mostly
requiring the syscon part. So let's hold that off, thanks for the quick
reply.

Cheers,
 -- Guido
