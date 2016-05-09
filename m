From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] soc: renesas: rcar-sysc: Add support for R-Car M3-W power areas
Date: Mon, 09 May 2016 15:01:42 +0300
Message-ID: <3527039.nIMxVx4mej@avalon>
References: <1462372570-31979-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1462372570-31979-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thank you for the patches.

For the whole series,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Wednesday 04 May 2016 16:36:07 Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds support for the power areas exposed by the System
> Controller on the Renesas R-Car M3-W SoC.
> 
> /sys/kernel/debug/pm_genpd/pm_genpd_summary output:
> 
>     domain                          status          slaves
> 	/device                                             runtime status
>     ----------------------------------------------------------------------
>     clock-controller                on
>     a3ir                            off-0
>     3dg-b                           off-0
>     3dg-a                           off-0           3dg-b
>     a2vc1                           off-0
>     a2vc0                           off-0
>     a3vc                            off-0           a2vc0, a2vc1
>     cr7                             off-0
>     ca53-cpu3                       on
>     ca53-cpu2                       on
>     ca53-cpu1                       on
>     ca53-cpu0                       on
>     ca53-scu                        on              ca53-cpu0, ca53-cpu1,
> ca53-cpu2, ca53-cpu3 ca57-cpu1                       on
>     ca57-cpu0                       on
>     ca57-scu                        on              ca57-cpu0, ca57-cpu1
>     always-on                       on              ca57-scu, ca53-scu, cr7,
> a3vc, 3dg-a, a3ir /devices/platform/soc/e6e88000.serial              
> active
> 
> For your convenience, I've pushed this series to the
> topic/r8a7796-sysc-v1 branch of
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git.
> 
> Integration with renesas-drivers-2016-04-26-v4.6-rc5, and minimal board
> integration for testing is available in the topic/gen3-latest branch.
> 
> This has received minimal testing on r8a7796/salvator-x.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   soc: renesas: rcar-sysc: Document r8a7796 support
>   soc: renesas: Add r8a7796 SYSC PM Domain Binding Definitions
>   soc: renesas: rcar-sysc: Add support for R-Car M3-W power areas
> 
>  .../bindings/power/renesas,rcar-sysc.txt           |  1 +
>  drivers/soc/renesas/Makefile                       |  1 +
>  drivers/soc/renesas/r8a7796-sysc.c                 | 48 +++++++++++++++++++
>  drivers/soc/renesas/rcar-sysc.c                    |  3 ++
>  drivers/soc/renesas/rcar-sysc.h                    |  1 +
>  include/dt-bindings/power/r8a7796-sysc.h           | 36 ++++++++++++++++
>  6 files changed, 90 insertions(+)
>  create mode 100644 drivers/soc/renesas/r8a7796-sysc.c
>  create mode 100644 include/dt-bindings/power/r8a7796-sysc.h

-- 
Regards,

Laurent Pinchart
