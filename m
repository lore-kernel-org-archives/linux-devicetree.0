From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Mon, 9 Jan 2017 12:40:38 -0600
Message-ID: <20170109184038.bz3oqyvtbua562pl@rob-hp-laptop>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170106041517.9589-3-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 05:14:59PM +1300, Chris Packham wrote:
> Compared to the armada-xp the 98DX3336 uses different registers to set
> the boot address for the secondary CPU so a new enable-method is needed.
> This will only work if the machine definition doesn't define an overall
> smp_ops because there is not currently a way of overriding this from the
> device tree if it is set in the machine definition.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>     Changes in v2:
>     - Document new enable-method value
>     - Correct some references from 98DX4521 to 98DX3236
>     
>     Changes in v3:
>     - Simplify mv98dx3236_resume_init by using of_io_request_and_map()
> 
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  .../bindings/arm/marvell/98dx3236-resume-ctrl.txt  | 18 ++++++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  arch/arm/mach-mvebu/Makefile                       |  1 +
>  arch/arm/mach-mvebu/common.h                       |  1 +
>  arch/arm/mach-mvebu/platsmp.c                      | 43 ++++++++++++++++++
>  arch/arm/mach-mvebu/pmsu-98dx3236.c                | 52 ++++++++++++++++++++++
>  6 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236-resume-ctrl.txt
>  create mode 100644 arch/arm/mach-mvebu/pmsu-98dx3236.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
