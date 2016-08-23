From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] MIPS: OCTEON: fix platform bus probing
Date: Tue, 23 Aug 2016 18:03:06 -0500
Message-ID: <CAL_JsqK-jLR9A80=Th1GW5-X1i+RSoJMaKeiU4=zPkcWVhZx1w@mail.gmail.com>
References: <20160823183943.20888-1-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160823183943.20888-1-aaro.koskinen@iki.fi>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney@caviumnetworks.com>, Linux-MIPS <linux-mips@linux-mips.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 1:39 PM, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> Commit 44a7185c2ae6 ("of/platform: Add common method to populate
> default bus") added new arch_initcall of_platform_default_populate_init()
> that will override device_initcall octeon_publish_devices(). This broke
> many OCTEON boards as important devices are not getting probed anymore
> (e.g. on EdgeRouter Lite the USB mass storage/rootfs is missing).

They are getting probed, but the order probably changed causing probe to fail.

> Fix by changing octeon_publish_devices() to arch_initcall.
>
> Fixes: 44a7185c2ae6 ("of/platform: Add common method to populate default bus")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  arch/mips/cavium-octeon/octeon-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
> index b31fbc9..37a932d 100644
> --- a/arch/mips/cavium-octeon/octeon-platform.c
> +++ b/arch/mips/cavium-octeon/octeon-platform.c
> @@ -1059,7 +1059,7 @@ static int __init octeon_publish_devices(void)
>  {
>         return of_platform_bus_probe(NULL, octeon_ids, NULL);
>  }
> -device_initcall(octeon_publish_devices);
> +arch_initcall(octeon_publish_devices);
>
>  MODULE_AUTHOR("David Daney <ddaney@caviumnetworks.com>");
>  MODULE_LICENSE("GPL");
> --
> 2.9.2
>
