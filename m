From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: Re: [PATCH] ARCH: Use the correct style for SPDX License Identifier
Date: Mon, 8 Apr 2019 19:00:18 +0530
Message-ID: <20190408133016.GA2662@nishad>
References: <20190323132808.GA10547@nishad>
 <20190331010549.GA17669@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190331010549.GA17669@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 31, 2019 at 01:41:26AM -0500, Rob Herring wrote:
> On Sat, Mar 23, 2019 at 06:58:14PM +0530, Nishad Kamdar wrote:
> > This patch corrects the SPDX License Identifier style
> > in the Hardware Architecture subsystem.
> > 
> > Changes made by using a script provided by Joe Perches here:
> > https://lkml.org/lkml/2019/2/7/46
> > and making some manual changes.
> > 
> > Suggested-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h     | 2 +-
> >  arch/arm64/include/asm/pointer_auth.h             | 2 +-
> >  arch/arm64/include/asm/sdei.h                     | 2 +-
> >  arch/arm64/include/asm/vmap_stack.h               | 2 +-
> >  arch/nds32/include/asm/assembler.h                | 2 +-
> 
> No reason to put all arches in one patch. Please split by arch for 
> maintainers to take.
> 
> Rob
> 
Ok, I'll do that.

Thanks for the review.

Thanks and regards,
Nishad
