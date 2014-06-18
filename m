From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 11/21] mfd: use devm_irq_of_parse_and_map() where
 appropriate
Date: Wed, 18 Jun 2014 09:48:38 +0100
Message-ID: <20140618084838.GR21030@lee--X1>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
 <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru>
 <20140617151226.GM29841@lee--X1>
 <53A0606C.6030400@dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A0606C.6030400@dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lugovskoy@dev.rtsoft.ru
List-Id: devicetree@vger.kernel.org

On Tue, 17 Jun 2014, Nikita Yushchenko wrote:
> 17.06.2014 19:12, Lee Jones =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>From: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
> >>
> >>This avoids leak of IRQ mapping on error paths, and makes it possib=
le
> >>to use devm_request_irq() without facing unmap-while-handler-instal=
led
> >>issues.
> >>
> >>Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
> >>---
> >>  drivers/mfd/max8997.c |    4 +++-
> >>  drivers/mfd/max8998.c |    4 +++-
> >>  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> >Applied, thanks.
>=20
> Hmm...  probably it was too early to apply this?  I was just going
> to prepare v2, based on discussion...

Which discussion?

> Also, applying only 11/21, without 01/21, will just cause build error=
s ...

CC'ing me on this patch alone when you know you have build
dependencies on other patches in the set is a bad idea.  Failing to
mention that you wanted the patch to be handled in a special and/or
unconventional way is an even worse idea.

How are you expecting this patch(-set) to be handled?

> Confused.

Likewise!

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
