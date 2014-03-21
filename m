From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: add gpio pieces
Date: Fri, 21 Mar 2014 20:10:03 +0100
Message-ID: <532C8E8B.9080406@linutronix.de>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de> <1395345324-18299-4-git-send-email-bigeasy@linutronix.de> <20140321172434.GB3998@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20140321172434.GB3998@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@altera.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/21/2014 06:24 PM, Gerhard Sittig wrote:
> On Thu, Mar 20, 2014 at 20:55 +0100, Sebastian Andrzej Siewior wrote:
>>
>> The cycloneV has three gpio controllers, each one with 29 gpios. Thi=
s patch
>> adds the three controller with the gpio driver which is now sitting =
the
>> gpio tree.
>=20
> The third bank should have 27 pins, only the first two have 29.

It is not a bank it is a complete controller. Why 27 pins? The
reference manual says that there register 0=8528.

> The commit message probably should not discuss which git tree a
> driver currently resides in.  This is just a temporary detail
> which no longer applies to the mainline source base where your
> patch will end up in.

This patch adds a binding which is not in kernel. It is worth to
mention.

>=20
>=20
> virtually yours
> Gerhard Sittig
>=20
Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
