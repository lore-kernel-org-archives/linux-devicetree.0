From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH] drm/exynos: Add device tree based discovery support for
	Exynos G2D
Date: Thu, 3 Jan 2013 16:07:12 +0530
Message-ID: <CAEC9eQO9VqE1VCd_yULtsjDdX5SgktnNOZdkBtRgoF0QmGYU6g@mail.gmail.com>
References: <1356667208-22372-1-git-send-email-ajaykumar.rs@samsung.com>
	<CAOesGMgDgdVpNsRpOqM76-ZjhfV61x0d4AUdkS9B5CfvB=6vWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAOesGMgDgdVpNsRpOqM76-ZjhfV61x0d4AUdkS9B5CfvB=6vWg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Olof Johansson <olof@lixom.net>
Cc: devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Olof,

On Sun, Dec 30, 2012 at 11:57 AM, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Thu, Dec 27, 2012 at 8:00 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
>> This patch adds device tree match table for Exynos G2D controller.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
>> index 6ffa076..aa3d2e4 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/workqueue.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dma-attrs.h>
>> +#include <linux/of.h>
>>
>>  #include <drm/drmP.h>
>>  #include <drm/exynos_drm.h>
>> @@ -1240,6 +1241,14 @@ static int g2d_resume(struct device *dev)
>>
>>  static SIMPLE_DEV_PM_OPS(g2d_pm_ops, g2d_suspend, g2d_resume);
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id exynos_g2d_match[] = {
>> +       { .compatible = "samsung,exynos-g2d-41" },
>
> What does -41 signify here?
This driver only supports G2D 4.1 version and not any lower versions of G2D!
>
>> +       {},
>> +};
>> +MODULE_DEVICE_TABLE(of, exynos_g2d_match);
>> +#endif
>> +
>>  struct platform_driver g2d_driver = {
>>         .probe          = g2d_probe,
>>         .remove         = __devexit_p(g2d_remove),
>> @@ -1247,5 +1256,6 @@ struct platform_driver g2d_driver = {
>>                 .name   = "s5p-g2d",
>>                 .owner  = THIS_MODULE,
>>                 .pm     = &g2d_pm_ops,
>> +               .of_match_table = of_match_ptr(exynos_g2d_match),
>
> Please provide bindings update, and cc devicetree-discuss for these
> kind of patches.
Ok. I will update with the Documentation for bindings, soon.
>
> -Olof

Thanks and Regards,
Ajay
