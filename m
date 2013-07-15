From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/5] of: introduce of_parse_phandle_with_fixed_args
Date: Mon, 15 Jul 2013 17:06:38 -0600
Message-ID: <51E4807E.3090505@wwwdotorg.org>
References: <1373913629-32179-1-git-send-email-swarren@wwwdotorg.org>
 <1373913629-32179-3-git-send-email-swarren@wwwdotorg.org>
 <51E44688.3050805@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51E44688.3050805-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
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
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/15/2013 12:59 PM, Sergei Shtylyov wrote:
> On 07/15/2013 10:40 PM, Stephen Warren wrote:
> 
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
>> This is identical to of_parse_phandle_with_args(), except that the
>> number of argument cells is fixed, rather than being parsed out of the
>> node referenced by each phandle.

>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 23e7073..ad799d9 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1106,7 +1106,8 @@ EXPORT_SYMBOL(of_parse_phandle);
>>
>>   static int __of_parse_phandle_with_args(const struct device_node *np,
>>                       const char *list_name,
>> -                    const char *cells_name, int index,
>> +                    const char *cells_name,
>> +                    int cells_count, int index,
> 
>    The correct grammar would be 'cell_name' and 'cell_count' I think.

I guess I can see the argument for cell_count, but "cells_name" is named
based on the DT property named "gpio-cells", so "cells" seems correct
here (and is a pre-existing issue anyway).

I'll fix up cell_count and the brace issue locally, but hold off reposting.
