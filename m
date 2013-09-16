From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v7 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Mon, 16 Sep 2013 17:25:44 +1000
Message-ID: <1379316344.3721.6.camel@pasglop>
References: <1377527959-5080-1-git-send-email-m.szyprowski@samsung.com>
 <1377527959-5080-4-git-send-email-m.szyprowski@samsung.com>
 <20130829224637.D09183E1222@localhost> <52209278.8040106@samsung.com>
 <DAF223EB-C84C-4E82-A24A-ACD0A3A0559F@codeaurora.org>
 <20130909160154.8D7183E0F23@localhost> <5236AF64.80607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5236AF64.80607@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linaro-mm-sig@lists.linaro.org, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@secretlab.ca>, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-09-16 at 09:12 +0200, Marek Szyprowski wrote:
> 
> Fixing those issues requires further discussion. Frankly, right now I
> really have no idea which way should I go. The /reserved-ranges node seems
> to be easy to match particular reserved memory region with a given device.
> I'm also not really convinced if it makes sense to add a code for finding
> and matching a reserved memory region to every device driver, which might
> need it. I would really like to get some more feedback on the Ben's
> comment.
> 
> In any case, the code will also change significantly, so I assume that the
> best, what can be done now is to revert the current version and start from
> the scratch with a new, complete proposal.

Yes, let's do that. I will try to help. It shouldn't be that a big deal.

Worst case, how many of us will meet physically next month in Edinburgh ?

Cheers,
Ben.
