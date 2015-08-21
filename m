From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] ARM: dts: UniPhier: fix PPI interrupt CPU mask of
 timer nodes
Date: Thu, 20 Aug 2015 18:28:48 -0700
Message-ID: <20150821012848.GA4865@localhost>
References: <1439963366-4848-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439963366-4848-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 19, 2015 at 02:49:26PM +0900, Masahiro Yamada wrote:
> This SoC is integrated with 4 Cortex-A9 cores.  The GIC bindings
> document says that the bits[15:8] of the 3rd cell of the interrupts
> property represents PPI interrupt CPU mask.  Because the timer
> interrupts are wired to all of the 4 cores, bits[15:8] should be set
> to 0xf.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - Fix git-description

Thanks, applied.


-Olof
