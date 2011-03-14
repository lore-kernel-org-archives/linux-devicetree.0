From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/7] arm/dt: add pad configurations for mx51 babbage
Date: Mon, 14 Mar 2011 23:53:14 +0800
Message-ID: <20110314155313.GC3674@S2101-09.ap.freescale.net>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-3-git-send-email-shawn.guo@linaro.org>
	<4D7E3230.6040505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D7E3230.6040505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2011 at 10:20:16AM -0500, Rob Herring wrote:
> Shawn,
> 
Hi Rob,

> On 03/14/2011 09:25 AM, Shawn Guo wrote:
> >The pad configuration is something common between dt and non-dt
> >kernel, so it can be copied from non-dt code directly.
> >
> >Signed-off-by: Shawn Guo<shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >---
> >  arch/arm/mach-mx5/board-dt.c |   94 ++++++++++++++++++++++++++++++++++++++++++
> >  1 files changed, 94 insertions(+), 0 deletions(-)
> >
> >diff --git a/arch/arm/mach-mx5/board-dt.c b/arch/arm/mach-mx5/board-dt.c
> >index 45d1e37..4850251 100644
> >--- a/arch/arm/mach-mx5/board-dt.c
> >+++ b/arch/arm/mach-mx5/board-dt.c
> >@@ -31,6 +31,97 @@
> >
> >  #include "devices.h"
> >
> >+static iomux_v3_cfg_t mx51babbage_pads[] = {
> >+	/* UART1 */
> >+	MX51_PAD_UART1_RXD__UART1_RXD,
> >+	MX51_PAD_UART1_TXD__UART1_TXD,
> >+	MX51_PAD_UART1_RTS__UART1_RTS,
> >+	MX51_PAD_UART1_CTS__UART1_CTS,
[...]
> >+};
> 
> This data already exists, so you should not duplicate it here.
> 
So you are suggesting remove the 'static' where is first defined, and
refer to it here directly?  Correct me if I misunderstood you comment.

> Iomux setup is a good candidate for a DT binding as it is just data,
> but I never came up with a good solution that was not bloated with a
> 32-bit value for every setting of each pin.
> 
Honestly, this is something new for me, and I never thought about it,
but will, if later we all think this is something we should do.

-- 
Regards,
Shawn
