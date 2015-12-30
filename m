From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Wed, 30 Dec 2015 11:35:01 +0100
Message-ID: <6145950.8rtkDup7QD@wuerfel>
References: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com> <1670989.QknqqsXE3p@wuerfel> <1451470328.22426.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451470328.22426.5.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 30 December 2015 18:12:08 James Liao wrote:
> On Wed, 2015-12-30 at 09:52 +0100, Arnd Bergmann wrote:
> > On Wednesday 30 December 2015 14:41:44 James Liao wrote:
> > > Some power domain comsumers may init before module_init.
> > > So the power domain provider (scpsys) need to be initialized
> > > earlier too.
> > > 
> > > Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> > > ---
> > > 
> > 
> > Why?
> 
> Some drivers use different init level to ensure they can be initialized
> before other drivers. To support these drivers, moving scpsys driver's
> initial function to subsys_init is the most easy way.

This is just the same generic explanation that you already have.

Please be more specific what the dependency is and why we can't rely
on deferred probing here.

	Arnd
