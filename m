From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 0/2] mfd: dt: add power off support for Tegra20/Tegra30
Date: Tue, 11 Sep 2012 18:25:14 +0800
Message-ID: <A7051F87A141B744BCAF487D48E5B3BDF5BBE83B1A@HKMAIL02.nvidia.com>
References: <1345424876-4365-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345424876-4365-1-git-send-email-bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
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
To: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: "kyle.manna-CaKDIOJzjcgAvxtiuMwx3w@public.gmane.org" <kyle.manna-CaKDIOJzjcgAvxtiuMwx3w@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Xin Xie <xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all, 

Could somebody review this?

Thanks,
Bill

> 
> This patch series add new property into regulator DT for telling whether or not to hook pmic's power off routine to system call
> "pm_power_off".
> 
> Patch 1 add power off support for Tegra20 boards using TPS6586x Patch 2 add power off support for Tegra30 boards using TPS65910
> 
> Verified on Seaboard (Tegra20) and Cardhu (Tegra30)
> 
> V2:
> * Take multiple pmic instances into consideration while assigning global variables
>   as per suggestion from Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> 
> V1:
> * Based on master branch of sameo/mfd-2.6.git
> 
> Bill Huang (2):
>   mfd: dt: tps6586x: Add power off control
>   mfd: dt: tps65910: add power off control
> 
>  Documentation/devicetree/bindings/mfd/tps65910.txt |    4 +++
>  .../devicetree/bindings/regulator/tps6586x.txt     |    6 +++++
>  drivers/mfd/tps6586x.c                             |   19 +++++++++++++++++
>  drivers/mfd/tps65910.c                             |   22 ++++++++++++++++++++
>  include/linux/mfd/tps6586x.h                       |    1 +
>  include/linux/mfd/tps65910.h                       |    3 ++
>  6 files changed, 55 insertions(+), 0 deletions(-)
> 
> --
> 1.7.4.1
nvpublic
