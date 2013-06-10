From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/6] clocksource: add Marvell Orion SoC timer
Date: Mon, 10 Jun 2013 19:21:57 +0200
Message-ID: <51B60B35.8030201@linaro.org>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com> <1370856955-10514-1-git-send-email-sebastian.hesselbarth@gmail.com> <51B5F8FE.5090508@linaro.org> <51B5FF51.6090708@gmail.com> <51B60267.9000600@linaro.org> <51B6031B.4030204@gmail.com> <51B6079E.5090602@linaro.org> <20130610170921.GM23859@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130610170921.GM23859@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/10/2013 07:09 PM, Jason Cooper wrote:
> On Mon, Jun 10, 2013 at 07:06:38PM +0200, Daniel Lezcano wrote:
>> On 06/10/2013 06:47 PM, Sebastian Hesselbarth wrote:
>>> On 06/10/13 18:44, Daniel Lezcano wrote:
>>>> On 06/10/2013 06:31 PM, Sebastian Hesselbarth wrote:
>>>>> On 06/10/13 18:04, Daniel Lezcano wrote:
>>>>>> On 06/10/2013 11:35 AM, Sebastian Hesselbarth wrote:
>>>>>>> This patch add a DT enabled driver for timers found on Marvell =
Orion
>>>>>>> SoCs
>>>>>>> (Kirkwood, Dove, Orion5x, and Discovery Innovation). It install=
s a
>>>>>>> free-
>>>>>>> running clocksource on timer0 and a clockevent source on timer1=
=2E
>>>>>>> Corresponding device tree documentation is also added.
>>>>>>>
>>>>>>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gma=
il.com>
>>>>>>
>>>>>> It looks good for me.
>>>>>>
>>>>>> Sebastian,
>>>>>>
>>>>>> shall I take it through my tree (it will go to Thomas's tree) ?
>>>>>
>>>>> Daniel,
>>>>>
>>>>> I checked MAINTAINERS and thought clocksource, i.e. patch 2/6, wo=
uld go
>>>>> through Thomas' or John's tree? If you want to take it, I am fine=
 with
>>>>> it but guess I am not the one to choose here ;)
>>>>
>>>> Actually, I am giving a hand to John and Thomas. I take the patche=
s for
>>>> clockevents (and also for clocksource if both are mixed and John d=
id not
>>>> pick it yet) and Thomas pulls from my tree [1].
>>>>
>>>> If there is no dependency with any other patches of your patchset,=
 which
>>>> seems to be the case, I will queue it for 3.11.
>>>
>>> Ok, thanks!
>>
>> I have a lot of ^M in the patch ... dos2unix removed them but I am
>> wondering how they get there ?
>=20
> He sent it with git-send-mail, how are you extracting it from
> Thunderbird?

I use a script to extract the patch from my mailbox. I am using it for
years now I did not face these spurious characters before.

Anyway, it seems not related to the patch itself, I will handle that.

Thanks
  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
