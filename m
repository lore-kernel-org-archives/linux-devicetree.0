From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 02/20] clocksource: orion: Use atomic access for shared
 registers
Date: Thu, 06 Feb 2014 23:47:33 +0000
Message-ID: <52F41F15.307@linaro.org>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390836440-12744-3-git-send-email-ezequiel.garcia@free-electrons.com> <20140205191035.GZ8533@titan.lakedaemon.net> <20140205231903.GA30244@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140205231903.GA30244@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/05/2014 11:19 PM, Ezequiel Garcia wrote:
> On Wed, Feb 05, 2014 at 02:10:35PM -0500, Jason Cooper wrote:
>> On Mon, Jan 27, 2014 at 12:27:02PM -0300, Ezequiel Garcia wrote:
>>> Replace the driver-specific thread-safe shared register API
>>> by the recently introduced atomic_io_clear_set().
>>>
>>> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>   drivers/clocksource/time-orion.c | 28 ++++++++++-----------------=
-
>>>   1 file changed, 10 insertions(+), 18 deletions(-)
>>
>> The MMIO patch this depends on:
>>
>>    c5ca95b507c8 ARM: 7930/1: Introduce atomic MMIO modify
>>
>> made it in to v3.14-rc1.  It looks like this change is independent o=
f
>> the rest of the watchdog series, so:
>>
>> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>>
>
> Thanks, Jason.
>
> Daniel: If you can pick this I'll drop it from the next watchdog patc=
hset
> submission.

Yep, ok. I am out of the office for the moment, I will take care of it=20
Monday.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
