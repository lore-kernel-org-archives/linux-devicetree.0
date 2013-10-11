From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined
 in device tree
Date: Fri, 11 Oct 2013 18:48:36 +1100
Message-ID: <1381477716.5630.74.camel@pasglop>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-10-11 at 09:27 +0200, Marek Szyprowski wrote:
> Hi all!
> 
> Benjamin Herrenschmidt pointed a few issues in the proposed design of
> device tree bindings for contiguous memory allocator and reserved memory
> regions:
> https://lkml.org/lkml/2013/9/15/151
> http://www.spinics.net/lists/arm-kernel/msg273548.html

Are you guys in Edinburgh ?

I'll be there from Tuesday PM (so really Wed) to Friday (fly out on
Sat). We should catch up, brainstorm and come up with something.

Cheers,
Ben.

> Some time has passed, but there is still no consensus on the bindings
> for the reserved memory and various drawback of this solution has been
> shown, so in my opinion the best I can do now is to revert them
> completely and start from scratch again later.
> 
> This patch series reverts patches related to device tree bindings
> proposed in the following thread:
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/263216
> and merged by commit 64c353864e3f7ccba0ade1bd6f562f9a3bc7e68d ("Merge
> branch 'for-v3.12' of git://git.linaro.org/people/mszyprowski/linux-dma-mapping").
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Marek Szyprowski (2):
>   Revert "ARM: init: add support for reserved memory defined by device tree"
>   Revert "drivers: of: add initialization code for dma reserved memory"
> 
>  Documentation/devicetree/bindings/memory.txt |  168 -------------------------
>  arch/arm/mm/init.c                           |    3 -
>  drivers/of/Kconfig                           |    6 -
>  drivers/of/Makefile                          |    1 -
>  drivers/of/of_reserved_mem.c                 |  173 --------------------------
>  drivers/of/platform.c                        |    4 -
>  include/linux/of_reserved_mem.h              |   14 ---
>  7 files changed, 369 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory.txt
>  delete mode 100644 drivers/of/of_reserved_mem.c
>  delete mode 100644 include/linux/of_reserved_mem.h
> 
