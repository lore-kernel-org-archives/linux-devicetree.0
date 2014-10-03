From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Fri, 03 Oct 2014 17:41:23 +0200
Message-ID: <542EC3A3.1060605@gmail.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com> <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Masson <benoitm@perenite.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Benoit Masson <yahoo@perenite.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/03/2014 05:29 PM, Benoit Masson wrote:
> Le 3 oct. 2014 =E0 17:06, Sebastian Hesselbarth <sebastian.hesselbart=
h@gmail.com> a =E9crit :
>> On 10/03/2014 04:11 PM, Jason Cooper wrote:
>>> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.hess=
elbarth@gmail.com> a =E9crit :
[...]
>>>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am no=
t in
>>>>> a hurry. I only compile tested this, so a formal Tested-by from B=
enoit
>>>>> for the ix4 and any other Armada XP board would be great.
>>>>
>>>> I'm not sure what to test since I only receive some patch from the
>>>> series of 8. Should I get all 8 or only those you sent me. I'll be
>>>> able to test during next week.
>>>
>>> Did you ever get a chance to test this series?
>>
>> Uhm, I never prepared a branch for Benoit to test. I have pushed the
>> patches with Thomas Acked-by's and renamed eeprom node based on
>> v3.17-rc1 to
>>
>> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4
>>
[...]
> Also I've noted you did some other patch for Armada XP not related to=
 ix-4-300d,
 > are they included here or should I get them too ?

No, they are neither included nor is there any need to test. They are
about pcie-lanes property but it is more or less unused on Linux.

It is too late for v3.18 anyway, so I'll resend them once v3.18-rc1
drops.

> I'll test those over Sunday night.

Ok, great!

Sebastian
