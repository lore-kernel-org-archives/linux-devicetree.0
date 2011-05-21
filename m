From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v4 1/6] of: Allow scripts/dtc/libfdt to be used from
	kernel code
Date: Sat, 21 May 2011 16:33:45 +1000
Message-ID: <20110521063345.GB14828@yookeroo.fritz.box>
References: <1305930343-31259-1-git-send-email-ddaney@caviumnetworks.com>
	<1305930343-31259-2-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1305930343-31259-2-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2011 at 03:25:38PM -0700, David Daney wrote:
> To use it you need to do this in your Kconfig:
> 
> 	select LIBFDT
> 
> And in the Makefile of the code using libfdt something like:
> 
> ccflags-y := -include linux/libfdt_env.h -I$(src)/../../../scripts/dtc/libfdt
> 
> Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/of/Kconfig          |    3 +++
>  drivers/of/Makefile         |    2 ++
>  drivers/of/libfdt/Makefile  |    3 +++
>  drivers/of/libfdt/fdt.c     |    2 ++
>  drivers/of/libfdt/fdt_ro.c  |    2 ++
>  drivers/of/libfdt/fdt_wip.c |    2 ++

No fdt_sw.c or fdt_rw.c?

>  include/linux/libfdt.h      |    8 ++++++++
>  include/linux/libfdt_env.h  |   13 +++++++++++++
>  8 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/of/libfdt/Makefile
>  create mode 100644 drivers/of/libfdt/fdt.c
>  create mode 100644 drivers/of/libfdt/fdt_ro.c

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
