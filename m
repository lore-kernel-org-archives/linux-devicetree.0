From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Tue, 04 Oct 2011 11:15:05 -0500
Message-ID: <4E8B3109.2020705@gmail.com>
References: <1317410880-24828-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1317410880-24828-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

On 09/30/2011 02:27 PM, Rob Herring wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Another round of GIC devicetree support.
> 
> This moves the tracking of the starting hwirq number into the irq domain
> code. Doing this makes hwirq == GIC interrupt ID and simplifies the GIC
> code removing irq_offset.
> 
> The full series is available here. This includes Russell's devel-stable and
> for-next branches and Nico's vmalloc branch:
> 
> git://git.jdl.com/software/linux-3.0.git gic-v2
> 
> Tested on highbank and Realview 11MPCore qemu (2 GICs).
> 
> Rob
> 
> Rob Herring (3):
>   irq: support domains with non-zero hwirq base
>   ARM: gic: add irq_domain support
>   ARM: gic: add OF based initialization
> 
>  Documentation/devicetree/bindings/arm/gic.txt |   55 ++++++++++
>  arch/arm/common/Kconfig                       |    1 +
>  arch/arm/common/gic.c                         |  142 +++++++++++++++++++------
>  arch/arm/include/asm/hardware/gic.h           |    5 +-
>  include/linux/irqdomain.h                     |   16 +++-
>  kernel/irq/irqdomain.c                        |   12 +-
>  6 files changed, 189 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
> 

Ping. Can you please comment on this series.

Rob
