From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 5/7] Watchdog: introduce "pretimeout" into framework
Date: Fri, 22 May 2015 06:23:57 -0700
Message-ID: <555F2DED.2010200@roeck-us.net>
References: <=fu.wei@linaro.org>	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>	<1432197156-16947-6-git-send-email-fu.wei@linaro.org>	<555ECD04.6000404@offcode.fi>	<CADyBb7sZWgNnEoTfaYm6=YcbWgEYRMcaNAdX9Y7B6W9pg+gOmg@mail.gmail.com>	<555EEFDB.2030907@offcode.fi> <CADyBb7uh-6=ihfrKHBVXDzAKAE-_GqLXTPJa5_7Gw2R71pyeUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADyBb7uh-6=ihfrKHBVXDzAKAE-_GqLXTPJa5_7Gw2R71pyeUg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fu Wei <fu.wei@linaro.org>, Timo Kokkonen <timo.kokkonen@offcode.fi>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>, Linaro ACPI Mailman List <linaro-acpi@lists.linaro.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Wei Fu <tekkamanninja@gmail.com>, G Gregory <graeme.gregory@linaro.org>, Al Stone <al.stone@linaro.org>, Hanjun Guo <hanjun.guo@linaro.org>, Timur Tabi <timur@codeaurora.org>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Arnd Bergmann <arnd@arndb.de>, vgandhi@codeaurora.org, wim@iguana.be, Jon Masters <jcm@redhat.com>, Leo Duran <leo.duran@amd.com>, Jon Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 05/22/2015 03:46 AM, Fu Wei wrote:
> Hi Timo,
>
[ ... ]

> So I am still trying to improve pretimeout support :-)

Is there anything still missing from it ?

> If I can make pretimeout merged, may be you can try pretimeout to
> implement early_timeout_sec function?

Not sure how one would or even could do that.

Do you mean "implement early_pretimeout_sec", by any chance ?

> It is up to the maintainers, I will try my best.
>

Please don't make the pretimeout concept more complicated than necessary.

The smaller the patch, the more likely it is to get accepted.
The more you change, the more difficult it is for the maintainer to,
for example, back-port later bug fixes into earlier kernel releases
when needed. This is why it is, for example, better to keep the
existing watchdog_init_timeout() function instead of just replacing
it with watchdog_init_timeouts().

Try to put yourself into the maintainer's perspective: If you were
the maintainer, would you rather accept a patch or patch set which
maintains the existing API and doesn't require any changes to existing
drivers, or would you accept one that changes, say, some function
or variable names and will require manual back-ports later on if
there is a bug fix ? Would you rather accept a patch that adds 50 lines
of code, or one that changes another 100+ lines and rearranges everything
along the line ?

Thanks,
Guenter
