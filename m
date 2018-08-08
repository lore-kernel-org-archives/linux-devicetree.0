From: Scott Wood <oss@buserror.net>
Subject: Re: [v2, 1/6] powerpc/pm: Fix suspend=n in menuconfig for e500mc
 platforms.
Date: Wed, 8 Aug 2018 18:01:52 -0500
Message-ID: <20180808230152.GA5459@home.buserror.net>
References: <20180411063551.30368-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180411063551.30368-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@kernel.crashing.org>, Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, Zhao Chenhui <chenhui.zhao@freescale.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 02:35:46PM +0800, Ran Wang wrote:
> Also, unselect FSL_PMC which is for older platfroms instead.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Changes in v2:
>   - no change
> 
>  arch/powerpc/Kconfig |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)

It's not "fixing" anything, but rather enabling something that was
previously unsupported -- and that should happen after the code that
adds support.

-Scott
