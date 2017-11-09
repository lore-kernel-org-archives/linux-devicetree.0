From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Cavium OCTEON-III network driver.
Date: Thu, 9 Nov 2017 10:16:08 -0800
Message-ID: <6b9d2ea8-157d-61ec-5878-334a00485d7c@caviumnetworks.com>
References: <20171109005126.21341-1-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109005126.21341-1-david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I need to send v3.  With this v2 set, there is a small bug in the RX 
initialization that causes failure on little-endian kernels.

David.


On 11/08/2017 04:51 PM, David Daney wrote:
> We are adding the Cavium OCTEON-III network driver.  But since
> interacting with the input and output queues is done via special CPU
> local memory, we also need to add support to the MIPS/Octeon
> architecture code.  Aren't SoCs nice in this way?
> 
> The first six patches add the SoC support needed by the driver, the
> last two add the driver and an entry in MAINTAINERS.
> 
> Since these touch several subsystems (mips, staging, netdev), I would
> propose merging via netdev, but defer to the maintainers if they think
> something else would work better.
> 
> A separate pull request was recently done by Steven Hill for the
> firmware required by the driver.
> 
> Changes from v1:
> 
> o Cleanup and use of standard bindings in the device tree bindings
>    document.
> 
> o Added (hopefully) clarifying comments about several OCTEON
>    architectural peculiarities.
> 
> o Removed unused testing code from the driver.
> 
> o Removed some module parameters that already default to the proper
>    values.
> 
> o KConfig cleanup, including testing on x86_64, arm64 and mips.
> 
> o Fixed breakage to the driver for previous generation of OCTEON SoCs (in
>    the staging directory still).
> 
> o Verified bisectability of the patch set.
> 
> Carlos Munoz (5):
>    dt-bindings: Add Cavium Octeon Common Ethernet Interface.
>    MIPS: Octeon: Enable LMTDMA/LMTST operations.
>    MIPS: Octeon: Add a global resource manager.
>    MIPS: Octeon: Add Free Pointer Unit (FPA) support.
>    netdev: octeon-ethernet: Add Cavium Octeon III support.
> 
> David Daney (3):
>    MIPS: Octeon: Automatically provision CVMSEG space.
>    staging: octeon: Remove USE_ASYNC_IOBDMA macro.
>    MAINTAINERS: Add entry for
>      drivers/net/ethernet/cavium/octeon/octeon3-*
> 
>   .../devicetree/bindings/net/cavium-bgx.txt         |   61 +
>   MAINTAINERS                                        |    6 +
>   arch/mips/cavium-octeon/Kconfig                    |   35 +-
>   arch/mips/cavium-octeon/Makefile                   |    4 +-
>   arch/mips/cavium-octeon/octeon-fpa3.c              |  364 ++++
>   arch/mips/cavium-octeon/resource-mgr.c             |  371 ++++
>   arch/mips/cavium-octeon/setup.c                    |   22 +-
>   .../asm/mach-cavium-octeon/kernel-entry-init.h     |   20 +-
>   arch/mips/include/asm/mipsregs.h                   |    2 +
>   arch/mips/include/asm/octeon/octeon.h              |   47 +-
>   arch/mips/include/asm/processor.h                  |    2 +-
>   arch/mips/kernel/octeon_switch.S                   |    2 -
>   arch/mips/mm/tlbex.c                               |   29 +-
>   drivers/net/ethernet/cavium/Kconfig                |   55 +-
>   drivers/net/ethernet/cavium/octeon/Makefile        |    6 +
>   .../net/ethernet/cavium/octeon/octeon3-bgx-nexus.c |  698 +++++++
>   .../net/ethernet/cavium/octeon/octeon3-bgx-port.c  | 2028 +++++++++++++++++++
>   drivers/net/ethernet/cavium/octeon/octeon3-core.c  | 2068 ++++++++++++++++++++
>   drivers/net/ethernet/cavium/octeon/octeon3-pki.c   |  833 ++++++++
>   drivers/net/ethernet/cavium/octeon/octeon3-pko.c   | 1719 ++++++++++++++++
>   drivers/net/ethernet/cavium/octeon/octeon3-sso.c   |  309 +++
>   drivers/net/ethernet/cavium/octeon/octeon3.h       |  411 ++++
>   drivers/staging/octeon/ethernet-defines.h          |    6 -
>   drivers/staging/octeon/ethernet-rx.c               |   25 +-
>   drivers/staging/octeon/ethernet-tx.c               |   85 +-
>   25 files changed, 9065 insertions(+), 143 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt
>   create mode 100644 arch/mips/cavium-octeon/octeon-fpa3.c
>   create mode 100644 arch/mips/cavium-octeon/resource-mgr.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-nexus.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-core.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pki.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pko.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-sso.c
>   create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3.h
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
