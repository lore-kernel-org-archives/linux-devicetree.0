From: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Thu, 20 Jul 2017 13:23:05 +0200 (CEST)
Message-ID: <652336354.3806.1500549785404@ox.hosteurope.de>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201707172156.DCyTyWc2%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

below you can see the report with the error on m68k. It was sent to me from a
test robot of intel.

According to my research, this problem occured, because there is no hardware
support for floating point on the m68k (or it was configured not to use it).
Therefore gcc uses an internal function, provided by libgcc. Obviously libgcc
wasn't linked...

I don't know how to come arround this problem by modifying my code (except
reducing the accuracy of the calculation by not using floating point).

Can we ignore the error or can I do something else?
Maybe a special include just in case of m68k can help??!?
I don't have an environment for building m68k.

Cheers,

Marcus

> kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> hat am 17. Juli 2017 um 15:26 geschrieben:
>
>
> Hi Marcus,
>
> [auto build test ERROR on staging/staging-testing]
> [also build test ERROR on v4.13-rc1 next-20170717]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system]
>
> url:
> https://github.com/0day-ci/linux/commits/Wolf-Entwicklungen/drivers-staging-pi433-New-driver/20170716-181617
> config: m68k-allyesconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 4.9.0
> reproduce:
> wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
> chmod +x ~/bin/make.cross
> # save the attached .config to linux build tree
> make.cross ARCH=m68k
>
> All errors (new ones prefixed by >>):
>
> drivers/staging/pi433/rf69.o: In function `rf69_set_frequency':
> >> rf69.c:(.text+0x9e2): undefined reference to `__udivdi3'
>
> ---
> 0-DAY kernel test infrastructure Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
