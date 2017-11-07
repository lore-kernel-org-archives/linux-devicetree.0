From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] *** Fix warning from kbuild test robot ***
Date: Tue, 7 Nov 2017 09:31:45 +0100
Message-ID: <b874ae68-08d4-ba0d-f52a-b25d0f2ccc73@linaro.org>
References: <1510039193-32522-1-git-send-email-rickchen36@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510039193-32522-1-git-send-email-rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rick Chen <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/11/2017 08:19, Rick Chen wrote:
> *** Fix warnings when make with ARCH=x86_64 from auto build test ***
> 
> rick (3):
>   clocksource/drivers/atcpit100: Add andestech atcpit100 timer
>   clocksource/drivers/Kconfig: Support andestech atcpit100 timer
>   dt-bindings: timer: Add andestech atcpit100 timer binding doc
> 
>  .../bindings/timer/andestech,atcpit100-timer.txt   |  31 ++++
>  drivers/clocksource/Kconfig                        |   6 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-atcpit100.c              | 199 +++++++++++++++++++++
>  4 files changed, 237 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
>  create mode 100644 drivers/clocksource/timer-atcpit100.c

Hi Rick,

I'm not sure to get the 0/3 subject and description.

Is that a changelog ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
