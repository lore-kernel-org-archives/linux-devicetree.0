From: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Sun, 2 Dec 2012 00:01:02 +0530
Message-ID: <CAPub149j12KmED8PkeFA2Xk8Sj-RoMojSS4g1G8W8=Nx0H=ctQ@mail.gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
	<20121123103400.GO17471@gmail.com>
	<CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
	<20121123121413.GB22268@gmail.com>
	<20121123123048.GM5384@localhost.localdomain>
	<20121126112823.GI12782@gmail.com>
	<20121126113230.GT5384@localhost.localdomain>
	<CACRpkdYR-GVm0ZXXO=Y7SwiK=nWaL5kkeLkXUzf_8p7jG+digA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYR-GVm0ZXXO=Y7SwiK=nWaL5kkeLkXUzf_8p7jG+digA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 1, 2012 at 10:05 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Nov 26, 2012 at 12:32 PM, Shiraz Hashim <shiraz.hashim@st.com> wrote:
>> On Mon, Nov 26, 2012 at 11:28:23AM +0000, Lee Jones wrote:
>>>
>>> Doesn't pinctrl normally handle this kind of stuff?
>>
>> Yes, but I think it is only for managing the SoC and its pads.
>
> No pinctrl is also for off-SoC pin controllers, you can have
> pinctrl0, pinctrl1 ... pinctrlN on a system. The number space is
> local per-pincontroller too.

OK. Thanks for correcting.

-- 
regards
Shiraz Hashim
