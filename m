From: robert.jarzmik@free.fr
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Mon, 16 Feb 2015 14:27:28 +0100 (CET)
Message-ID: <1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
References: <20150216130549.GF14545@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150216130549.GF14545@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: devicetree@vger.kernel.org

----- Mail original -----
De: "Lee Jones" <lee.jones@linaro.org>
=C3=80: "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc: "Rob Herring" <robh+dt@kernel.org>, "Pawel Moll" <pawel.moll@arm.co=
m>, "Mark Rutland" <mark.rutland@arm.com>, "Ian Campbell" <ijc+devicetr=
ee@hellion.org.uk>, "Kumar Gala" <galak@codeaurora.org>, "Daniel Mack" =
<daniel@zonque.org>, "Haojian Zhuang" <haojian.zhuang@gmail.com>, "Samu=
el Ortiz" <sameo@linux.intel.com>, "Grant Likely" <grant.likely@linaro.=
org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-a=
rm-kernel@lists.infradead.org, "Arnd Bergmann" <arnd@arndb.de>, "Russel=
l King - ARM Linux" <linux@arm.linux.org.uk>, "Dmitry Eremin-Solenikov"=
 <dbaryshkov@gmail.com>
Envoy=C3=A9: Lundi 16 F=C3=A9vrier 2015 14:05:49
Objet: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board

On Sat, 24 Jan 2015, Robert Jarzmik wrote:

> ---
> Since v1: change the name from cottula to lubbock_io
>             Dmitry pointed out the Cottula was the pxa25x family name=
,
> 	    lubbock was the pxa25x development board name. Therefore the
> 	    name was changed to lubbock_io (lubbock IO board)

> Are you sure this is what you want to do?  We don't usually support
> 'boards' per say.  Instead we support 'devices', then pull each of
> those devices together using some h/w description mechanism.

Do you know that :
 1) anything under "---" in a commit message is thrown away
 2) after v2, we _both_ agreed that the accurate name is "cplds"
    which exactly what is in this patch
    (see device registering with lubbock_cplds).
 3) there is no more mention of "board" anywhere in the patch core

> Besides, this is MFD, where we support single pieces of silicon which
> happen to support multiple devices.  I definitely don't want to suppo=
rt
> boards here.
> You might want to re-think the naming and your (sales) pitch.
I might need help. As for the (sales), no comment.

>> +#include <linux/mfd/core.h>
> Why have you included this?  I don't see the use of the MFD framework
> anywhere.  So what makes this an MFD?
I thought cplds were to be handled by an MFD driver.

> I'm going to stop here, as I think I need more of an explanation so
> what you're trying to achieve with this driver.
Why ? I think things were clear that this driver handles the CPLDs on
lubbock board, namely u46 and u52. I don't understand what is wrong
with this patch so that you don't want to go forward.

--

Robert
