From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 4/4] arm: pxa: add non device-tree timer link to clocksource
Date: Fri, 26 Sep 2014 09:52:07 +0200
Message-ID: <54251B27.909@linaro.org>
References: <1405356724-32207-1-git-send-email-robert.jarzmik@free.fr>	<1405356724-32207-4-git-send-email-robert.jarzmik@free.fr>	<53CD25A4.7030606@linaro.org> <87oawivarv.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87oawivarv.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 07/21/2014 08:15 PM, Robert Jarzmik wrote:
> Daniel Lezcano <daniel.lezcano@linaro.org> writes:
>
>> On 07/14/2014 06:52 PM, Robert Jarzmik wrote:
>>> As clocksource pxa_timer was moved to clocksource framework, the
>>> pxa_timer initialization needs to be a bit amended, to pass the
>>> necessary informations to clocksource, ie :
>>>    - the timer interrupt (mach specific)
>>>    - the timer registers base (ditto)
>>>    - the timer clockrate
>>>
>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>>
>>> ---
>>> Since V2: Arnd's comment : moved extern declaration into .h file
>>> ---
>>
>> Shall I take the patches 4-5 also ?
> Mmm you mean patch 4 I think.
> Then I'd like you too, because it's linked in the serie, and without =
it the
> former non-DT platforms break, hence I'd like all the serie to go thr=
ough 1
> tree.
>
> Yet we'd need Haojian's ack here. Haojian, would you give your blessi=
ng on the
> serie and agree that Daniel carries all the patches including patch 4=
/4 ?

Hi,

May be I missed it but I don't see the Haojian's ack.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
