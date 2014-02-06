From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v6 18/19] ARM: mvebu: Enable watchdog support in defconfig
Date: Thu, 6 Feb 2014 14:12:23 -0500
Message-ID: <20140206191223.GL8533@titan.lakedaemon.net>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391707226-18258-19-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140206175159.GI8533@titan.lakedaemon.net>
 <20140206191023.GA19328@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140206191023.GA19328@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Wim Van Sebroeck <wim@iguana.be>, Lior Amsalem <alior@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 04:10:24PM -0300, Ezequiel Garcia wrote:
> On Thu, Feb 06, 2014 at 12:51:59PM -0500, Jason Cooper wrote:
> > On Thu, Feb 06, 2014 at 02:20:25PM -0300, Ezequiel Garcia wrote:
> > > Now that we have proper support for Armada 370/XP watchdog
> > > let's enable it in the defconfig.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > >  arch/arm/configs/mvebu_defconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > If this ends up being the last version for this series, I'll add a patch
> > for multi_v7_defconfig.  Otherwise, please add for the next round.
> > 
> 
> Oh, yes, I forgot about your request on this. Let's hope I don't forget
> next time.

Yes, we found the i2c hang because of multi_v7, so it's definitely worth
the effort.

thx,

Jason.
