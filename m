From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v6 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Thu, 29 Aug 2013 22:20:54 +0100
Message-ID: <20130829212054.568123E1222@localhost>
References: <1376924669-28873-1-git-send-email-m.szyprowski@samsung.com>
 <52134B92.10308@samsung.com> <52139AE7.4050300@wwwdotorg.org>
 <2011590.EGDykoeEOS@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2011590.EGDykoeEOS@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Ian Campbell <ian.campbell@citrix.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Aug 2013 17:39:48 +0200, Tomasz Figa <t.figa@samsung.com> wrote:
> On Tuesday 20 of August 2013 10:35:51 Stephen Warren wrote:
> > >> a) Adjust memory.txt to allow multiple entries in memory-regions, and
> > >> add an associated memory-region-names property.
> > >> 
> > I don't believe that's a good approach unless you have at least a
> > partial idea of how the current bindings will be extended to support
> > multiple memory regions.
> 
> I believe that at least three "at least partial" ideas have been brought in 
> this thread. Moreover, I don't think that defining the simple binding now 
> would stop us from extending it according to any of those ideas in any way.

I would plan on extending later with suggestion 'a)' above. Making the
memory-region an array of phandles is a better match with how most of
the core bindings work.  I actually regret the *-gpio properties that
were defined earlier becasue it makes it harder for software to look at
a tree and determine if there are any gpio references.

It of course doesn't need to be done immediately, only when it becomes
required.

g.
