From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Thu, 20 Jul 2017 14:27:41 +0200
Message-ID: <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170720113705.d65hxm3jbki2ynqd@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>, driverdevel <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Dan,

On Thu, Jul 20, 2017 at 1:37 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Jul 20, 2017 at 01:23:05PM +0200, Marcus Wolf wrote:
>> below you can see the report with the error on m68k. It was sent to me from a
>> test robot of intel.
>>
>> According to my research, this problem occured, because there is no hardware
>> support for floating point on the m68k (or it was configured not to use it).
>> Therefore gcc uses an internal function, provided by libgcc. Obviously libgcc
>> wasn't linked...
>>
>> I don't know how to come arround this problem by modifying my code (except
>> reducing the accuracy of the calculation by not using floating point).
>
> I don't see any floating point?  You're not allowed to use floating
> point in the kernel.

Indeed. __udivdi3 is used for 64-bit by 32-bit division.

>> Can we ignore the error or can I do something else?
>> Maybe a special include just in case of m68k can help??!?
>> I don't have an environment for building m68k.

https://www.kernel.org/pub/tools/crosstool/

> I think the answer is to use div_u64() and div64_u64 instead of
> do_div()?

do_div() is fine
The link error is not caused by do_div(), but by not using do_div() where
needed.

> Or you could just add a depend in the Kconfig.

Depend on what? !M68K? It's gonna fail on several 32-bit platforms.
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
