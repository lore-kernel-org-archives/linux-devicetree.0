From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 17/19] ARM: dts: armada: replace isil,irq2-can-wakeup-machine with wakeup-source property
Date: Tue, 15 Dec 2015 17:56:05 +0100
Message-ID: <8760zzvefu.fsf@free-electrons.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
	<1445422216-29375-18-git-send-email-sudeep.holla@arm.com>
	<5670422D.7020404@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5670422D.7020404@arm.com> (Sudeep Holla's message of "Tue, 15
	Dec 2015 16:39:09 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,
=20
 On mar., d=C3=A9c. 15 2015, Sudeep Holla <sudeep.holla@arm.com> wrote:

> On 21/10/15 11:10, Sudeep Holla wrote:
>> Though the driver will continue to check for and support the legacy
>> "isil,irq2-can-wakeup-machine" boolean property to wakeup source,
>> "wakeup-source" is the new standard binding.
>>
>> This patch replaces the legacy "isil,irq2-can-wakeup-machine" with t=
he
>> unified "wakeup-source" property in order to avoid any futher copy-p=
aste
>> duplication.
>>
>> Cc: Jason Cooper <jason@lakedaemon.net>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Gregory Clement <gregory.clement@free-electrons.com>
>> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>>
>
> Ping, do you prefer taking via your tree or should I send to armsoc
> directly ?

Sorry for the delay it was in my inbox since too many time. I didn't ge=
t
the time to check it. This looks ok for me, so I've just applied it on
mvebu/dt,

Thanks,

Gregory

>
> --=20
> Regards,
> Sudeep

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
