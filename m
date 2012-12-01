From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Sat, 1 Dec 2012 17:35:39 +0100
Message-ID: <CACRpkdYR-GVm0ZXXO=Y7SwiK=nWaL5kkeLkXUzf_8p7jG+digA@mail.gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
	<20121123103400.GO17471@gmail.com>
	<CAKohponW-Wd+Vrnj8mbdFMmJvwQgPq1jFCZRipBFoEhTknStHQ@mail.gmail.com>
	<20121123121413.GB22268@gmail.com>
	<20121123123048.GM5384@localhost.localdomain>
	<20121126112823.GI12782@gmail.com>
	<20121126113230.GT5384@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126113230.GT5384@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Shiraz Hashim <shiraz.hashim@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2012 at 12:32 PM, Shiraz Hashim <shiraz.hashim@st.com> wrote:
> On Mon, Nov 26, 2012 at 11:28:23AM +0000, Lee Jones wrote:
>>
>> Doesn't pinctrl normally handle this kind of stuff?
>
> Yes, but I think it is only for managing the SoC and its pads.

No pinctrl is also for off-SoC pin controllers, you can have
pinctrl0, pinctrl1 ... pinctrlN on a system. The number space is
local per-pincontroller too.

Yours,
Linus Walleij
