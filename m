From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH V12 3/3] ARM: dts: update watchdog device nodes for
 Exynos5250 and Exynos5420
Date: Mon, 20 Jan 2014 13:10:24 +0900
Message-ID: <CAL1wa8ejL-C-O5RH6wHws0JgeG1Xuv1Swkob5+6HB4R_goEwHA@mail.gmail.com>
References: <1386308868-30264-1-git-send-email-l.krishna@samsung.com>
	<1386308868-30264-4-git-send-email-l.krishna@samsung.com>
	<20131206194856.GC14464@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20131206194856.GC14464@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, wim@iguana.be, dianders@chromium.org, t.figa@samsung.com, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

On 12/7/13, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Dec 06, 2013 at 11:17:48AM +0530, Leela Krishna Amudala wrote:
>> In Exynos5 series SoCs, PMU has registers to enable/disable mask/unmask
>> watchdog timer which is not the case with s3c series SoCs so, there is a
>> need to have different compatible names for watchdog to handle these pmu
>> registers access.
>>
>> Hence this patch removes watchdog node from Exynos5.dtsi common file and
>> make it separate by updating existing node in Exynos5250 and adding new
>> node
>> to Exynos5420. This patch also makes the watchdog node enabled by default
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Tested-by: Doug Anderson <dianders@chromium.org>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Hi Kgene,

Driver changes has been merged to Wim's tree, so can you please pick
this patch into your tree.

Best Wishes,
Leela krishna.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
