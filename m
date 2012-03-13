From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/7] ARM: kirkwood: use devicetree for rtc-mv
Date: Tue, 13 Mar 2012 13:44:37 +0000
Message-ID: <201203131344.37661.arnd@arndb.de>
References: <cover.1331601448.git.jason@lakedaemon.net>
 <201203130958.31223.arnd@arndb.de>
 <20120313132216.GI5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120313132216.GI5050@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 13 March 2012, Jason Cooper wrote:
> On Tue, Mar 13, 2012 at 09:58:30AM +0000, Arnd Bergmann wrote:
> > On Tuesday 13 March 2012, Jason Cooper wrote:
> > > 
> > > Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> > > ---
> > >  arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
> > >  arch/arm/mach-kirkwood/board-dt.c |    1 -
> > >  arch/arm/mach-kirkwood/common.c   |    2 +-
> > >  arch/arm/mach-kirkwood/common.h   |    1 -
> > >  4 files changed, 7 insertions(+), 3 deletions(-)
> > > 
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > I think you can just merge this with patch 6, as they are two halves
> > of the same work.
> 
> Others working on kirkwood and dt asked me to separate the two to
> facilitate integrating with their existing work.  I can undo if you
> think it's best.

No, just ignore my comment in that case. If it helps anyone to
split the patches, it's definitely ok to do so, I just didn't
see any reason why you would.

	Arnd
