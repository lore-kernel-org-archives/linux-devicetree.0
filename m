From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] of: match the compatible in the order set by the dts
 file
Date: Wed, 10 Jul 2013 10:58:26 +0800
Message-ID: <51DCCDD2.707@freescale.com>
References: <1373013818-11365-1-git-send-email-b32955@freescale.com>	<20130709070541.GQ516@pengutronix.de>	<51DBBFDA.70302@freescale.com>	<20130709075124.GR516@pengutronix.de>	<51DBC58D.90002@freescale.com> <CAL_JsqL4ABJCQXveSAMZKOiHwJi=w8zFYjg3DV7kqEEcCXQJcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL4ABJCQXveSAMZKOiHwJi=w8zFYjg3DV7kqEEcCXQJcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA07=D4=C209=C8=D5 20:03, Rob Herring =D0=B4=B5=C0:
> the same and that is the assumption. Matching is not just based on
> compatible properties and your patch does not handle the other cases.
Could you show a example of "the other cases"?

After this patch,

[1] the matching will first check the @match->type and @match->name,
if we can match the @match->type or @match->name, return the match
immediately.

[2] If [1] fails, we will check the compatible properties.



thanks
Huang Shijie
