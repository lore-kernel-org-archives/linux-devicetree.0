From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/2] clk: Support for DT assigned clock parents and
 rates
Date: Fri, 21 Mar 2014 15:56:26 +0100
Message-ID: <532C531A.3050904@samsung.com>
References: <1393870533-20845-1-git-send-email-s.nawrocki@samsung.com>
 <53187C13.3040202@st.com> <532AE239.9000800@samsung.com>
 <532C206E.1020907@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <532C206E.1020907-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/03/14 12:20, Maxime Coquelin wrote:
> On 03/20/2014 01:42 PM, Sylwester Nawrocki wrote:
>> On 06/03/14 14:45, Maxime Coquelin wrote:
>>> Hi Sylwester,
>>>
>>> 	I like the principle of your implementation, but I have two questions:
>>> 	1 - How can we manage PM with this solution, as the parent/rate will be
>>> set only once at probe time?
>>> 	2 - How to set the parent of a parent clock (which can be shared with
>>> other devices)? Same question about the parent rates.
>>
>> Thanks for your feedback and apologies for late reply.
>
> No problem! Apologies accepted ;)

:)
>> IIUC your first concern is about a situation when clocks need to be
>> reconfigured upon each resume from system sleep or runtime PM resume ?
> 
> Yes. This is the case of the STi SoCs.
> When resuming from system sleep, the clocks-related registers are 
> restored at their boot state.

Couldn't this be handled at the clocks controller driver suspend/resume
operations ?

>> As I mentioned in v1 of the RFC I was considering having individual
>> drivers calling explicitly the clocks set up routine. Presumably this
>> would allow to resolve the power management related issue.
>
>  From a functional point of view, that would indeed resolve the PM 
> related issue.
> But I'm not sure that on a performance point of view, parsing the DT at 
> each driver's resume call is an efficient way.

Right, it might not indeed be a good idea to do the parsing repeatedly.

>> One example I'm aware the approach as in this RFC wouldn't work is
>> when a device in a SoC belongs to a power domain, which needs to be
>> first switched on before we can start setting up and the clocks'
>> configuration get lost after the power domain switch off.
>
> Yes, that's another case to handle.
> I don't know which platforms are in that case, but not STi SoCs for your 
> information.

OK, this could still hopefully be resolved in a clock controller driver,
making it aware it belongs to same power domain as the clock consumer
devices.

>> OTOH I suspect devices for which one-time clocks setup is sufficient
>> will be quite common. And for these there would need to be a single
>> call to the setup routine in probe() I guess, since it wouldn't be
>> possible to figure out just from the DT data when the actual call
>> should be made.
>>
>> For a global clocks configuration, I thought about specifying that
>> in the clocks controller node, and then to have the setup routine
>> called e.g. from of_clk_init(). I think that could work well enough,
>> together with the patch [1], adding clock dependencies handling.
>> But then the clock frequency set up function would need to be
>> modified to respect the clock parent relationships, similarly as
>> in patch series [2]. A just noticed [2] recently, after posting
>> this RFC (adding Tero at Cc).
>
> OK, I agree with the approach.
> There is still the PM issue remaining with these clocks, but I think 
> that is not related to your series as we already have the issue currently.

>> [1] http://www.spinics.net/lists/arm-kernel/msg310507.html
>> [2] http://www.spinics.net/lists/linux-omap/msg103069.html

--
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
