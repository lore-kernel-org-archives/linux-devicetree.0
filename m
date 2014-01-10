From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mfd: Add support for S2MPA01 device
Date: Fri, 10 Jan 2014 15:45:27 +0530
Message-ID: <CAK9yfHx2peeKT1Z6RELp6BzSPY7Srt3x_ves=tenRGmJrsRE7Q@mail.gmail.com>
References: <1389266554-23463-1-git-send-email-sachin.kamat@linaro.org>
	<20140110100342.GC28141@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140110100342.GC28141@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10 January 2014 15:33, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Add the necessary entries required for S2MPA01 multi-function
>> device. While at it also convert whitespaces to tabs in core.h.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> * Fixed nits pointed out by Lee.
>> ---
>>  drivers/mfd/sec-core.c              |   45 +++++++-
>>  include/linux/mfd/samsung/core.h    |   16 ++-
>>  include/linux/mfd/samsung/irq.h     |   50 +++++++++
>>  include/linux/mfd/samsung/s2mpa01.h |  192 +++++++++++++++++++++++++++++++++++
>>  4 files changed, 295 insertions(+), 8 deletions(-)
>>  create mode 100644 include/linux/mfd/samsung/s2mpa01.h
>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks Lee.
Btw, how do you plan to handle these patches? Mark has already ack'd
the regulator patch.


-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
