From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 1/3] dts: change Marvell prefix to 'marvell'
Date: Sun, 14 Jul 2013 21:29:43 +0200
Message-ID: <201307142129.43271.arnd@arndb.de>
References: <1373352166-10064-1-git-send-email-zhangwm@marvell.com>
 <20130710214922.GQ11908@titan.lakedaemon.net>
 <175CCF5F49938B4D99B2E3EF7F558EBE3DBC97FDFA@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <175CCF5F49938B4D99B2E3EF7F558EBE3DBC97FDFA@SC-VEXCH4.marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: Jason Cooper <jason@lakedaemon.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Matt Sealey <neko@bakuhatsu.net>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 11 July 2013, Neil Zhang wrote:
> > > > To do this properly, the drivers are going to have to be compatible
> > > > with the old and the new names, and the binding docs updated to
> > > > reflect the legacy name and the preferred name.
> > >
> > > Properly would be as above. You can stop using stock tickers for new
> > > company names, but anything that has been defined in a device tree
> > > before has to stay that way, and all the manufacturer prefixes to
> > > device names should be the same. What you're proposing is purely
> > > driver bloat and increasing the size of kernel.
> > 
> > *I'm* not proposing to change the name, Neil is.  I'm proposing that
> > iff they chose to do that, don't break sh*t along the way.
> > 
> 
> What's your opinion?

We discussed the topic of fixing bad bindings vs. keeping backwards
compatibility during last week's Linaro Connect.

The main outcome was that we need to have a better review for new bindings
getting merged to avoid this situation in the future, but the general
consensus seems that bindings that are already in use but were never
reviewed properly (which should have caught this) should be changed.
We will likely establish an annotation in the binding soon to mark those
that can not be changed as opposed to those that are not considered stable
yet.

	Arnd
