From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v6 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Mon, 26 Aug 2013 07:20:57 -0500
Message-ID: <CAL_JsqJ3hcpgj6GgzqZdgLLqGQXmzys5PvCgy+36RpvQELvMjA@mail.gmail.com>
References: <1376924669-28873-1-git-send-email-m.szyprowski@samsung.com>
 <1376924669-28873-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1376924669-28873-4-git-send-email-m.szyprowski@samsung.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2013 at 10:04 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch adds device tree support for contiguous and reserved memory
> regions defined in device tree.
>
> Large memory blocks can be reliably reserved only during early boot.
> This must happen before the whole memory management subsystem is
> initialized, because we need to ensure that the given contiguous blocks
> are not yet allocated by kernel. Also it must happen before kernel
> mappings for the whole low memory are created, to ensure that there will
> be no mappings (for reserved blocks) or mapping with special properties
> can be created (for CMA blocks). This all happens before device tree
> structures are unflattened, so we need to get reserved memory layout
> directly from fdt.
>
> Later, those reserved memory regions are assigned to devices on each
> device structure initialization.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Michal Nazarewicz <mina86@mina86.com>
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Reviewed-by: Rob Herring <rob.herring@calxeda.com>
