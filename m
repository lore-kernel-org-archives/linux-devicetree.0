From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx53-qsb: disable 1.2GHz OPP
Date: Wed, 12 Sep 2018 14:46:52 +0800
Message-ID: <20180912064649.GC28239@dragon>
References: <20180910125056.30813-1-s.hauer@pengutronix.de>
 <20180912012252.GE28469@dragon>
 <20180912062335.GB7949@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180912062335.GB7949@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 08:23:35AM +0200, Sascha Hauer wrote:
> Hi Shawn,
> 
> On Wed, Sep 12, 2018 at 09:22:54AM +0800, Shawn Guo wrote:
> > On Mon, Sep 10, 2018 at 02:50:56PM +0200, Sascha Hauer wrote:
> > > The maximum CPU frequency for the i.MX53 QSB is 1GHz, so disable the
> > > 1.2GHz OPP. This makes the board work with cpufreq again.
> > 
> > I feel that the word 'again' and the Fixes tag below are a little
> > confusing.  It makes impression that cpufreq worked fine on the board
> > before and commit 791f416608 broke it.  However, this is not the case,
> > right?
> 
> You're right, the "again" shouldn't be there. I meant that the board
> works "again" after the addition of cpufreq support broke it.
> 
> Just resent the patch with a rephrased commit message.

Thanks, Sascha.

Shawn
