From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Mon, 06 Oct 2014 18:13:37 +0200
Message-ID: <5432BFB1.2060300@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com> <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com> <542EC3A3.1060605@gmail.com> <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8@perenite.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8@perenite.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Masson <benoitm@perenite.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/06/2014 01:11 AM, Benoit Masson wrote:
> Le 3 oct. 2014 =E0 17:41, Sebastian Hesselbarth <sebastian.hesselbart=
h@gmail.com> a =E9crit :
>> On 10/03/2014 05:29 PM, Benoit Masson wrote:
>>> Le 3 oct. 2014 =E0 17:06, Sebastian Hesselbarth <sebastian.hesselba=
rth@gmail.com> a =E9crit :
>>>> On 10/03/2014 04:11 PM, Jason Cooper wrote:
>>>>> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>>>>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.he=
sselbarth@gmail.com> a =E9crit :
>> [...]
>>>>>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am =
not in
>>>>>>> a hurry. I only compile tested this, so a formal Tested-by from=
 Benoit
>>>>>>> for the ix4 and any other Armada XP board would be great.
>>>>>>
>>>>>> I'm not sure what to test since I only receive some patch from t=
he
>>>>>> series of 8. Should I get all 8 or only those you sent me. I'll =
be
>>>>>> able to test during next week.
>>>>>
>>>>> Did you ever get a chance to test this series?
>>>>
>>>> Uhm, I never prepared a branch for Benoit to test. I have pushed t=
he
>>>> patches with Thomas Acked-by's and renamed eeprom node based on
>>>> v3.17-rc1 to
>>>>
>>>> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4
>>>>
>> [...]
> Maybe I missed something ? is this branch you sent me a bare fork
> from mainline 3.17 ? does it includes the armada XP step A0 patch ?

Benoit,

I prepared more branches with the series
- on top of v3.17 release:
https://github.com/shesselba/linux-dove.git devel/mvebu-ix4_v3.17

- on top of next-20141003 (i.e. what will become v3.18-rc1):
https://github.com/shesselba/linux-dove.git devel/mvebu-ix4_next-201410=
03

It would be great, if you can test in this order:
- vanilla v3.17
- mvebu-ix4_v3.17
- mvebu-ix4_next-20141003

If any branch fails, you can stop and please report back.

I also have the ix4 but I need more time for a full setup like you
already seem to have ready. Again, there is no hurry, take your time.

Thanks!

Sebastian
