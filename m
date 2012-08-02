From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] regulator: tps6586x: add support for SYS rail
Date: Thu, 02 Aug 2012 10:44:05 -0600
Message-ID: <501AAE55.3080504@wwwdotorg.org>
References: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1343906193-8309-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/02/2012 05:16 AM, Laxman Dewangan wrote:
> Device have SYS rail which is always ON. It is system
> power bus. LDO5 and LDO_RTC get powered through this rail
> internally. Add support for this rail and make the
> LDO5/LDO_RTC input supply to "sys".
> Update document accordingly.

I believe you need to following patch on top of this, or the sys-supply
property is not used:

> diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulator/tps6586x-regulator.c
> index 0c15ef8..a0ddc9f 100644
> --- a/drivers/regulator/tps6586x-regulator.c
> +++ b/drivers/regulator/tps6586x-regulator.c
> @@ -258,6 +258,7 @@ static const unsigned int tps6586x_dvm_voltages[] = {
>  #define TPS6586X_SYS_REGULATOR()                                       \
>  {                                                                      \
>         .desc   = {                                                     \
> +               .supply_name = "sys",                                   \
>                 .name   = "REG-SYS",                                    \
>                 .ops    = &tps6586x_sys_regulator_ops,                  \
>                 .type   = REGULATOR_VOLTAGE,                            \

BTW, this patch touches both the regulator and MFD trees. I'm not sure
who will apply it. I think it relies on the patch to this driver Mark
recently applied in the regulator tree (for 3.7 I think) doesn't it, at
least for context?
