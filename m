From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5] extcon: add Maxim MAX3355 driver
Date: Sun, 20 Dec 2015 20:15:00 +0300
Message-ID: <5676E214.2040009@cogentembedded.com>
References: <5948633.my3nAG6hRz@wasted.cogentembedded.com>
 <CAGTfZH34rfMfjsAFgyPeNue74-5iCi6ZwrdN26_jwOXE6R=hwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGTfZH34rfMfjsAFgyPeNue74-5iCi6ZwrdN26_jwOXE6R=hwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/20/2015 05:31 PM, Chanwoo Choi wrote:

> This patch depend on GPIOLIB configuration as following:
> I modified it with following diff and applied it.
>
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index ba4db7d..3d89e60 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -54,6 +54,7 @@ config EXTCON_MAX14577
>
>   config EXTCON_MAX3355
>          tristate "Maxim MAX3355 USB OTG EXTCON Support"
> +       depends on GPIOLIB || COMPILE_TEST

    If it won't compile w/o gpiolib, what's the use of COMIPLE_TEST?
    And no, it shouldn't depend on gpiolib. It has empty stubs for the case of 
CONFIG_GPIOLIB=n. Obviously something is wrong with the GPIO headers, I'll 
look into it.

[...]

> Thanks,
> Chanwoo Choi

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
