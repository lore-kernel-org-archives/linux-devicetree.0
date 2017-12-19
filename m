From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] mfd: syscon: Add hardware spinlock support
Date: Tue, 19 Dec 2017 19:05:06 +0800
Message-ID: <CAMz4kuLMpAaiFCBJM2YJE_73KqiXO-k_tymJwVHRY3JuotCrKw@mail.gmail.com>
References: <87ec50c846bbc7afc09ba0855aba1cdea6473308.1512048582.git.baolin.wang@linaro.org>
 <20171215104204.p7i27sen77ohbmzi@dell> <CAK8P3a0Eu4zaVrSEMps06ZZmFs=6026WZ7ze5V2k=nu0zL0bxQ@mail.gmail.com>
 <CAMz4ku+KfQRoLTO-T3ciS-1Z9oD=y0LJ25n-YDUMr+aYetbt9A@mail.gmail.com>
 <CAK8P3a3JTV0z0ua_xbbf8eJFGsgOEai4RC9Ny5-JL80MPuKFSA@mail.gmail.com>
 <CAMz4kuK2JRSZt6BiYu+YRy_+kXNen+NTgayqpXy1n3qL-T9OzQ@mail.gmail.com> <20171219092149.GB8563@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171219092149.GB8563-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19 December 2017 at 17:21, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 19, 2017 at 02:55:47PM +0800, Baolin Wang wrote:
>
>> Um, why regmap doesn't accept a zero lock-id, that because regmap will
>> reguest hwlock depending on the 'regmap_config->hwlock_id' is not
>> zero, if regmap regard a zero lock-id as valid which will affect other
>> 'struct regmap_config' definition. So users should not assign the zero
>> lock-id to regmap.
>
>> Now of_hwspin_lock_get_id() can return 0 as valid, which depend on
>> what is the base id registered by hwspinlock driver. So you think we
>> should not regard 0 as valid from of_hwspin_lock_get_id(), I can try
>> to send another patch to fix.
>
> If 0 is a valid hwspinlock ID you need to add a flag to the regmap
> config to say if a hwspinlock should be used.  That way we're not
> rejecting valid values.

Fine, that seems reasonable if you prefer another new flag to indicate
if a hwspinlock should be used. Thanks Arnd and Mark's comments.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
