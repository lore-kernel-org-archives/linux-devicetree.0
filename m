From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 0/7] xilinxfb changes
Date: Thu, 6 Jun 2013 18:23:36 +0200
Message-ID: <20130606162336.GW19468@game.jcrosoft.org>
References: <cover.1370254386.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1370254386.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12:13 Mon 03 Jun     , Michal Simek wrote:
> Hi,
> 

Arnd can you take look on it again please

I'll take a look on it next week

Best Regards,
J.
> I have done more changes in the driver to support probing
> on little and big endian system where detection is done
> directly on the hardware.
> I have also done some cleanups to get it to the better shape.
> 
> Thanks for your review,
> Michal
> 
> Changes in v4:
> - Acked by Arnd
> - Remove "video: xilinxfb: Fix sparse warnings"
>   patch because it is trying to fix incorrect API
>   usage and sparse should warn about it.
> 
> Changes in v3:
> - fix commit message
> - Remove out_be IO name from function name
> - Change patch subject from "Do not use out_be32 IO function"
>   to "Do not name out_be32 in function name"
> - New patch in this patchset based on discussions
> - New patch in this patchset based on discussions
> - New patch in this patchset
> - New patch in this patchset based on discussions
> 
> Changes in v2:
> - use of_property_read_u32 helper function
> 
> Michal Simek (7):
>   video: xilinxfb: Fix OF probing on little-endian systems
>   video: xilinxfb: Do not name out_be32 in function name
>   video: xilinxfb: Rename PLB_ACCESS_FLAG to BUS_ACCESS_FLAG
>   video: xilinxfb: Use drvdata->regs_phys instead of physaddr
>   video: xilinxfb: Group bus initialization
>   video: xilinxfb: Add support for little endian accesses
>   video: xilinxfb: Use driver for Xilinx ARM Zynq
> 
>  drivers/video/Kconfig    |   2 +-
>  drivers/video/xilinxfb.c | 135 +++++++++++++++++++++++------------------------
>  2 files changed, 68 insertions(+), 69 deletions(-)
> 
> --
> 1.8.2.3
> 
