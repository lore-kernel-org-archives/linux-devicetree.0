From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: pfla02: add ksz9031 clock skew values
Date: Thu, 28 Feb 2019 10:23:34 +0800
Message-ID: <20190228022332.GB26041@dragon>
References: <20190204152956.13471-1-m.felsch@pengutronix.de>
 <20190204152956.13471-2-m.felsch@pengutronix.de>
 <20190211023639.GG22487@dragon>
 <20190211103652.hq77ftu56c34zeas@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190211103652.hq77ftu56c34zeas@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, c.hemp@phytec.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 11:36:52AM +0100, Marco Felsch wrote:
> Hi Shawn,
> 
> On 19-02-11 10:36, Shawn Guo wrote:
> > On Mon, Feb 04, 2019 at 04:29:56PM +0100, Marco Felsch wrote:
> > > From: Philipp Zabel <p.zabel@pengutronix.de>
> > > 
> > > The pfla02 SoM has a Micrel KSZ9031RNX ethernet phy connected to the FEC,
> > > which needs RX and TX clock skew settings to compensate for differences
> > > in line length. The skew values are taken from barebox commit
> > > 4c65c20f1071 ("ARM: pfla02: Set new ethernet phy tx timings"), which
> > > is based on patches originally provided by Phytec:
> > > 
> > >     TX_CLK line is approx. 54mm longer than other TX lines which adds
> > >     a delay of 0.36ns. RGMII need a delay of min. 1.0ns. This mean we
> > >     have to add a delay of 0.64ns. We choose 0.78 to have a little gap.
> > >     This can be done by setting GTX pad skew value to 11100
> > >     Also add a delay for the RX delay lines, needed for the Duallite
> > >     variant.  => Set register 2.8 (RGMII Clock Pad Skew) to 0x039F.
> > > 
> > > Cc: Christian Hemp <c.hemp@phytec.de>
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > 
> > Applied, thanks.
> 
> Thanks, for applying. Just for me, is something wrong with the first
> patch?

No.  Something is wrong on my side - the patch went to Spam folder for
some reason.

Shawn
