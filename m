From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Initial DT clock bindings
Date: Mon, 12 Dec 2011 16:52:15 -0600
Message-ID: <4EE6859F.2040807@gmail.com>
References: <1323727236-4811-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323727236-4811-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2011 04:00 PM, Grant Likely wrote:
> Hi everyone,
> 
> Here's my second posting of initial device tree bindings for clocks.  I'm
> a lot happier with how this is looking now, and Versatile is pretty much
> entirely converted.  In fact, the realview, integrator and vexpress platforms
> are pretty close now too.  Just for fun I went and converted Highbank also.

Thanks! I'll give it a spin.

> There is still stuff to clean up, and I want to add test cases for the new
> clock framework, but otherwise I think it is pretty complete.  There are
> some changes to the binding documentation that you'll want to pay attention
> to.
> 
> This series is based on v3.2-rc5 plus the of_parse_phandle_args() patches
> that I posted a couple of hours ago.
> 
Where? I'm not seeing them on devicetree-discuss.

Can you publish this series on your git tree?

Rob

> 
>  .../devicetree/bindings/clock/clock-bindings.txt   |  114 +++++++++++
>  .../devicetree/bindings/clock/fixed-clock.txt      |   21 ++
>  arch/arm/Kconfig                                   |    1 +
>  arch/arm/boot/dts/highbank.dts                     |   32 +++-
>  arch/arm/boot/dts/testcases/tests-phandle.dtsi     |    2 +
>  arch/arm/boot/dts/versatile-ab.dts                 |   79 ++++++++
>  arch/arm/common/timer-sp.c                         |   72 ++++++-
>  arch/arm/include/asm/hardware/timer-sp.h           |    2 +
>  arch/arm/mach-highbank/clock.c                     |   19 --
>  arch/arm/mach-highbank/core.h                      |    1 -
>  arch/arm/mach-highbank/highbank.c                  |   13 +-
>  arch/arm/mach-highbank/include/mach/clkdev.h       |   11 +
>  arch/arm/mach-integrator/impd1.c                   |   30 +---
>  arch/arm/mach-integrator/include/mach/clkdev.h     |   19 --
>  arch/arm/mach-integrator/integrator_cp.c           |   21 +--
>  arch/arm/mach-realview/core.c                      |   22 +--
>  arch/arm/mach-realview/include/mach/clkdev.h       |   10 -
>  arch/arm/mach-versatile/core.c                     |   61 +------
>  arch/arm/mach-versatile/include/mach/clkdev.h      |   10 -
>  arch/arm/mach-versatile/versatile_dt.c             |   39 ++++-
>  arch/arm/mach-vexpress/include/mach/clkdev.h       |    9 -
>  arch/arm/mach-zynq/include/mach/clkdev.h           |   10 -
>  arch/arm/plat-versatile/clock.c                    |  151 ++++++++++++++
>  arch/arm/plat-versatile/include/plat/clock.h       |   34 ++++
>  drivers/clk/clkdev.c                               |    9 +
>  drivers/of/Kconfig                                 |    6 +
>  drivers/of/Makefile                                |    1 +
>  drivers/of/base.c                                  |   36 ++++
>  drivers/of/clock.c                                 |  208 ++++++++++++++++++++
>  drivers/of/selftest.c                              |   29 +++
>  include/linux/of.h                                 |    3 +
>  include/linux/of_clk.h                             |   41 ++++
>  32 files changed, 893 insertions(+), 223 deletions(-)
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
