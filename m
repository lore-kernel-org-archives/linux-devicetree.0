From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 0/4] mfd/regulator: tps65090: add DT support and
 suspend/resume cleanups
Date: Sun, 3 Feb 2013 18:01:16 +0100
Message-ID: <20130203170116.GK8476@sortiz-mobl>
References: <1356686981-4152-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1356686981-4152-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laxman,

On Fri, Dec 28, 2012 at 02:59:37PM +0530, Laxman Dewangan wrote:
> The patch series add DT support on TPS65090 device.
> 
> Also remove the suspend/resume implementation as it duplicates with
> irq_suspend/irq_resume().
> 
> Laxman Dewangan (4):
>   mfd: tps65090: add DT support for tps65090
>   regulator: tps65090: add DT support
>   mfd: tps65090: Pass irq domain when adding mfd sub devices
>   mfd: tps65090: remove suspend/resume callbacks
> 
>  .../devicetree/bindings/regulator/tps65090.txt     |  121 ++++++++++++++++++++
>  drivers/mfd/tps65090.c                             |   77 ++++++++----
>  drivers/regulator/tps65090-regulator.c             |   96 +++++++++++++++-
>  include/linux/mfd/tps65090.h                       |    1 +
>  4 files changed, 266 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/tps65090.txt
All 4 patches applied to my for-next branch, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
