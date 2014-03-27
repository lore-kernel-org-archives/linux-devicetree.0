From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH] ARM: imx6/dt: add ccm dependency upon ckil, ckih1 and
 osc clocks
Date: Thu, 27 Mar 2014 14:27:37 +0100
Message-ID: <53342749.6060403@gmail.com>
References: <5333DA13.2080505@gmail.com>	<1395907913-23808-1-git-send-email-b.brezillon.dev@gmail.com> <CAOMZO5D+rinC8zDMGTS9ACA1nBQvy8X3PqXc7iyWToS54amesw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D+rinC8zDMGTS9ACA1nBQvy8X3PqXc7iyWToS54amesw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Boris BREZILLON <brezillonboris@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Le 27/03/2014 12:19, Fabio Estevam a =C3=A9crit :
> On Thu, Mar 27, 2014 at 5:11 AM, Boris BREZILLON
> <brezillonboris@gmail.com> wrote:
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> Please provide a commit message, thanks.

This was sent as a test to verify my assumptions.

But if you want a commit message, how about this one ?

Define ccm clocks dependencies upon ckil, ckih1 and osc fixed clocks
to enforce probing order.

Anyway this patch is buggy (see my previous answer) and I'm not sure
I'm one that should submit it :-).

Best Regards,

Boris
