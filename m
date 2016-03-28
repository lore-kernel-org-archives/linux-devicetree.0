From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v14 3/4] ARM64: add SBSA Generic Watchdog device node in amd-seattle-soc.dtsi
Date: Mon, 28 Mar 2016 21:12:08 +0800
Message-ID: <CADyBb7shY-A-DTKEvNQS71SUtNmE6tkURfWDEb-_9eB-4htGWA@mail.gmail.com>
References: <1456735610-22012-1-git-send-email-fu.wei@linaro.org>
	<1456735610-22012-4-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456735610-22012-4-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Richard Ruigrok <rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Abdulhamid, Harb" <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wim, Guenter:

Great thanks for reviewing and applying this patchset :-)
Now I can see almost all the patches of this patchset have been merged
into the master branch of mainline kernel.
But only this one is still out of any branch or repo. It seems that
it's applied on linux-watchdog for a while, then disappeared.


So any thing I can do for this patch? Do I need to resubmit it?
Maybe I miss it in some repo? Could you help me ?
Great thanks ! :-)

On 29 February 2016 at 16:46,  <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This can be a example of adding SBSA Generic Watchdog device node
> into some dts files for the Soc which contains SBSA Generic Watchdog.
>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> index 2874d92..0a8ca1d 100644
> --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> @@ -84,6 +84,14 @@
>                         clock-names = "uartclk", "apb_pclk";
>                 };
>
> +               watchdog0: watchdog@e0bb0000 {
> +                       compatible = "arm,sbsa-gwdt";
> +                       reg = <0x0 0xe0bc0000 0 0x1000>,
> +                               <0x0 0xe0bb0000 0 0x1000>;
> +                       interrupts = <0 337 4>;
> +                       timeout-sec = <15>;
> +               };
> +
>                 spi0: ssp@e1020000 {
>                         status = "disabled";
>                         compatible = "arm,pl022", "arm,primecell";
> --
> 2.5.0
>



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
