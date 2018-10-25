Return-Path: <robherring2@gmail.com>
Date: Thu, 25 Oct 2018 16:20:35 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dt: relicense two DT binding IRQ headers
Message-ID: <20181025212035.GA2092@bogus>
References: <20181024170513.25431-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181024170513.25431-1-swarren@wwwdotorg.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 24, 2018 at 11:05:13AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Files in include/dt-bindings/ may be useful to any OS that uses DT, when
> building the OS binary itself, not just when building DTB files. Since
> some OSs are not GPL, they need non-GPL headers. This change relicenses
> two of the useful files so that they can be used under the MIT license
> when desired. I wrote these files and NVIDIA legal has approved this
> change. Geert also ack'd the change; he fixed some spelling issues in the
> comments.

I'm sure there's some dual licensed dts files including these as well.

> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  include/dt-bindings/interrupt-controller/arm-gic.h | 2 +-
>  include/dt-bindings/interrupt-controller/irq.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied.

Rob
