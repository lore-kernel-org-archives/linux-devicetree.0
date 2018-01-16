From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: sun9i: SMP and CPU hotplug support
Date: Tue, 16 Jan 2018 12:24:02 +0800
Message-ID: <CAGb2v66Kn6RDqj7Pjmj_vJ9ivU6PoSiVHdJqHTh9_Q4tUrk+iw@mail.gmail.com>
References: <20180115071450.18355-1-wens@csie.org> <nycvar.YSQ.7.76.1801151502050.13881@knanqh.ubzr>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6X46XJAKGQE52TMVUQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <nycvar.YSQ.7.76.1801151502050.13881-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 5:00 AM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 15 Jan 2018, Chen-Yu Tsai wrote:
>
>> Changes since v2:
>>   - Do away with the MCPM framework, directly implement smp_ops
>>   - Some debug messages were clarified
>>   - New ARCH_SUNXI_MCPM Kconfig symbol for this feature
>
> You should use ARCH_SUNXI_SMP instead to avoid confusion with the actual
> MCPM code. Ditto for function names as Dave mentioned.

All switched to "MC_SMP". There is existing, albeit deprecated, SMP code
for single cluster SoCs, so "multi cluster" is desired to differentiate
from the old stuff.

> For the ARM to Thumb switch you could add something like this at the
> beginning of your entry code:
>
> #ifdef CONFIG_THUMB2_KERNEL
>         .arm
>         mov     ip, #1
>         bx      ip
>         .thumb
> #endif
>         [your code follows here]
>
> And make sure that code is word aligned.

Thanks for the tip. As I mentioned in my reply to Dave,
this wasn't really needed.

Thanks again!
ChenYu
