From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined
 in device tree
Date: Wed, 20 Nov 2013 09:01:44 +1100
Message-ID: <1384898504.26969.48.camel@pasglop>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
 < 20131030134702.19B57C402A0@trevor.secretlab.ca>
 <528B5949.20204@samsung.com >
 <20131119151418.8BB2BC4079D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131119151418.8BB2BC4079D@trevor.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Ian Campbell <ian.campbell@citrix.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-11-19 at 15:14 +0000, Grant Likely wrote:
> > The proposal look good for me. I'm not convinced that we really need the
> > support for 'reg' property, as the fixed memory region is a special case
> > of generic dynamic allocation specified by the size and alloc-ranges, but
> > I assume that there have been already a long discussion about this, so I
> > accept the common consensus.
> 
> It is absolutely necessary for some use cases. For example, a
> framebuffer enabled by firmware and passed onto the kernel for
> flicker-free boot. Some platforms have fixed regions that cannot be
> moved up.

Arguably that could be covered with alloc-range and size by making the range be
the reg property content basically (and thus size == size of range) but I
prefer the reg property, it's a clearer statement of intent.

Cheers,
Ben.
