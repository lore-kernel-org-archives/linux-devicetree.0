From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [PATCH v5 09/11] arm: add support for reserved memory defined by
 device tree
Date: Thu, 13 Mar 2014 16:36:36 -0500
Message-ID: <20140313213636.GR18529@joshc.qualcomm.com>
References: <1392985527-6260-1-git-send-email-m.szyprowski@samsung.com>
 <1392985527-6260-10-git-send-email-m.szyprowski@samsung.com>
 <CAGa+x856+YyJ-vyfGoFAKmsqwKD+=Wh0-TT_mAaPStOXjd8eSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAGa+x856+YyJ-vyfGoFAKmsqwKD+=Wh0-TT_mAaPStOXjd8eSQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Paul Mackerras <paulus@samba.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laura Abbott <lauraa@codeaurora.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lis>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 13, 2014 at 01:46:50PM -0700, Kevin Hilman wrote:
> On Fri, Feb 21, 2014 at 4:25 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > Enable reserved memory initialization from device tree.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This patch has hit -next and several legacy (non-DT) boot failures
> were detected and bisected down to this patch.  A quick scan looks
> like there needs to be some sanity checking whether a DT is even
> present.

Hmm.  Yes, the code unconditionally calls of_flat_dt_scan(), which will
gladly touch initial_boot_params, even though it may be uninitialized.
The below patch should allow these boards to boot...

However, I'm wondering if there is a good reason why we don't parse the
/reserved-memory nodes at the right after we parse the /memory nodes as
part of early_init_dt_scan()...

Thanks,
  Josh

--8<--
Subject: [PATCH] drivers: of: only scan for reserved mem when fdt present

Reported-by: Kevin Hilman <khilman@linaro.org>
Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 drivers/of/fdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 510c0d8..501bc83 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -557,6 +557,9 @@ static int __init __fdt_scan_reserved_mem(unsigned long node, const char *uname,
  */
 void __init early_init_fdt_scan_reserved_mem(void)
 {
+	if (!initial_boot_params)
+		return;
+
 	of_scan_flat_dt(__fdt_scan_reserved_mem, NULL);
 	fdt_init_reserved_mem();
 }
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
