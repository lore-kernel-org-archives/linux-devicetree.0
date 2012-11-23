From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 17:55:28 +0530
Message-ID: <CAKohpom1RMUzSk2+GRFS-yh8bWt7J-jkF_LJP1iSdL=gLCYPsw@mail.gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
 <CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
 <20121123121413.GB22268@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121123121413.GB22268-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23 November 2012 17:44, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> I'm saying, just leave it where it is.

So you are suggesting this code:

        stmpe_gpio->chip.base = pdata ? pdata->gpio_base : -1;

       if (pdata)
               stmpe_gpio->norequest_mask = pdata->norequest_mask;
       else if (np)
               of_property_read_u32(np, "st,norequest-mask",
&pdata->norequest_mask);

Right? Then yes i can do it.

>> >> +             if (np)
>> >> +                     of_property_read_u32(np, "st,norequest-mask",
>> >> +                                     &pdata->norequest_mask);
>> >
>> > Can you explain to me what this does?
>>
>> You mean pdata->norequest_mask?  It marks few gpios as unusable.
>> Because these pads might be used by other blocks of stmpe.
>
> I'm not sure if that should be set with DT or not.
>
> Second opinion anyone?

Why i kept it in DT is because it is board dependent and there is no better
way of communicating this from board to driver.

--
viresh
