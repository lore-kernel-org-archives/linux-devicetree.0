From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 0/4] ARM: dts: several updates for the imx28-tx28.dts file
Date: Wed, 10 Sep 2014 11:16:01 +0800
Message-ID: <20140910031559.GB18566@dragon>
References: <1410261963-27956-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1410261963-27956-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 09, 2014 at 01:25:59PM +0200, Lothar Wa=DFmann wrote:
> - remove unused labels on spidev nodes
> - add third spidev node to utilize all available CS
> - use GPIO polarity flags
> - add configuration for spi-gpio driver as alternative to spi-mxs
> - add an alias for the can transceiver regulator which is used by U-Boot

Applied all 4, thanks.
