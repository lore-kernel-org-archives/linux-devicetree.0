From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its
 rework called marvell_nand
Date: Sun, 24 Dec 2017 01:55:04 -0300
Message-ID: <CAAEAJfCFCAAeWNzK3+TTn3qq3-p1aQYZnJ=e4nf8SZ=T1qouKg@mail.gmail.com>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com> <87608ycwx5.fsf@belgarion.home>
 <20171222230444.2c952ea0@bbrezillon> <87bmipb10z.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bmipb10z.fsf-4ty26DBLk+jEm7gnYqmdkQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 December 2017 at 18:13, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> wrote=
:
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
>
>>> What I would propose instead is :
>>>  - keep both the new marvell nand driver and the old pxa3xx_nand driver
>>>  - switch pxa_defconfig to compile them both
>>
>> Didn't notice you were suggesting to compile both, which doesn't work
>> because both drivers match the same devices, and only one of them
>> can actually claim the device (likely the first one to register to the
>> device model). So, to make it safe you need to have a
>>
>>       depends on !MTD_NAND_PXA3xx
>>
>> in your MTD_NAND_MARVELL entry, which means only one driver can be
>> compiled.
> Mmm... that is I didn't explain to you what pxa_defconfig is designed for=
.
> This defconfig is not for any board actually, it rather is a build covera=
ge
> tool.
>
>> So let's find a way to fix the remaining issues you have instead of dela=
ying
>> the inevitable.
> It's up to you of course, as long as my boards don't break, and nothing b=
reaking
> them is merged, I'm fine with it. It's just not the approach I usually ch=
oose,
> I'm rather a 2-step guy, ie. merge the new one, then merge the switch (wh=
ich can
> be reverted easilly).
>

I agree with Boris on this. Let's get this new driver tested as much
as possible; then, once everyone is fairly happy with it, merge it.

It won't be completely stable on day-one, but that is why we
have -rc cycles. Plus, distributions and appliances use -stable.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
