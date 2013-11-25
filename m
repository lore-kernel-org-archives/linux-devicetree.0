From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: Do not drop unheld reference on device node
Date: Mon, 25 Nov 2013 09:57:39 +0100
Message-ID: <52931103.7030107@linaro.org>
References: <1382136588-15320-1-git-send-email-treding@nvidia.com> <20131122161607.GA5088@ulmo.nvidia.com> <528F86F2.40706@linaro.org> <20131122192257.GX28642@pengutronix.de> <52926F6F.3050104@linaro.org> <20131125072923.GB28642@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131125072923.GB28642@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <davidb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 11/25/2013 08:29 AM, Uwe Kleine-K=C3=B6nig wrote:
> Hello Daniel,
>
> On Sun, Nov 24, 2013 at 10:28:15PM +0100, Daniel Lezcano wrote:
>> On 11/22/2013 08:22 PM, Uwe Kleine-K=C3=B6nig wrote:
>>> On Fri, Nov 22, 2013 at 05:31:46PM +0100, Daniel Lezcano wrote:
>>>> On 11/22/2013 05:16 PM, Thierry Reding wrote:
>>>>> On Sat, Oct 19, 2013 at 12:49:48AM +0200, Thierry Reding wrote:
>>>> Yes. Sounds like I missed it.
>>>>
>>>> This regression has been introduced by:
>>>>
>>>> commit 326e31eebe61dc838e031ea16968b2cfb43443e3
>>>> Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>>>> Date:   Tue Oct 1 11:00:53 2013 +0200
>>>>
>>>>      clocksource: Put nodes passed to CLOCKSOURCE_OF_DECLARE
>>>> callbacks centrally
>>>>
>>>>      Instead of letting each driver call of_node_put do it central=
ly in the
>>>>      loop that also calls the CLOCKSOURCE_OF_DECLARE callbacks. Th=
is is less
>>>>      prone to error and also moves getting and putting the referen=
ces
>>>> into the
>>>>      same function.
>>>>
>>>>      Consequently all respective of_node_put calls in drivers are =
removed.
>>>>
>>>>      Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutr=
onix.de>
>>>>      Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>      Acked-by: David Brown <davidb@codeaurora.org>
>>> Still all but the hook in clocksource_of_init of this commit was
>>> correct, right? (Well, but this buggy hunk makes the commit log wro=
ng.)
>>
>> I don't understand your comment, can you elaborate ?
> My patch added an of_node_put in clocksource_of_init and dropped seve=
ral
> of_node_puts in drivers. This thread is about the first being wrong. =
My
> question was if dropping the others was correct.

Yes, Thierry's patch removes the of_node_puts but I am also wondering i=
f=20
we shouldn't just revert the patch 326e31eebe61dc838e instead.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
