From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH RFC 0/3] Implement refcounting for OF GPIO chips
Date: Tue, 9 Feb 2010 10:29:07 -0700
Message-ID: <fa686aa41002090929i12b4db72we17ed52aa17bc567@mail.gmail.com>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru> <4B712DA5.4000802@petalogix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B712DA5.4000802@petalogix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: michal.simek@petalogix.com
Cc: avorontsov@ru.mvista.com, David Brownell <dbrownell@users.sourceforge.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Tue, Feb 9, 2010 at 2:40 AM, Michal Simek <michal.simek@petalogix.co=
m> wrote:
> Anton Vorontsov wrote:
>>
>> Hi all,
>>
>> OF GPIO infrastructure is using dynamic GPIO bases, so it is possibl=
e
>> that of_get_gpio()'s returned GPIO number will be no longer valid, o=
r
>> worse, it may point to an unexpected GPIO controller.
>>
>> This scenario is possible:
>>
>> driver A: =A0 =A0 =A0 =A0 =A0 =A0 =A0 driver B: =A0 =A0 =A0 =A0 =A0 =
=A0 =A0driver C:
>> --------- =A0 =A0 =A0 =A0 =A0 =A0 =A0 --------- =A0 =A0 =A0 =A0 =A0 =
=A0 =A0---------
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpiochip_add()
>> gpio =3D of_get_gpio()
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpiochip_remove()
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 gpiochip_add()
>> gpio_request(gpio);
>> gpio_set_value(gpio);
>>
>> That is, driver A assumes that it is working with GPIO from driver B=
,
>> but in practice it may disappear and driver C will take its GPIO bas=
e
>> number, so it will provide the same GPIO numbers.
>>
>> The above situation is hard to trigger, but the issue is there
>> nonetheless, and so needs fixing.
>
>
> I tested xilinx gpio driver, heartbeat trigger and access through sys=
fs and
> I haven't found any problem. There is only small part of code for Mic=
roblaze
> and it is the same with PowerPC. If is Ben OK with it, I am ok too.

I'm not convinced the changes take the best approach, so I'm not okay
with it yet.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
