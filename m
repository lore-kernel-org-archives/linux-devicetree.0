From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 0/2] regulator: Add regulator driver for the MC34708
 PMIC
Date: Fri, 1 May 2015 12:26:09 +0200 (CEST)
Message-ID: <62238108.776606.1430475969692.JavaMail.open-xchange@oxbaltgw07.schlund.de>
References: <20150428141736.16243.57292.stgit@localhost>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150428141736.16243.57292.stgit@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Fuzzey <mfuzzey@parkeon.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Martin,

> Martin Fuzzey <mfuzzey@parkeon.com> hat am 28. April 2015 um 16:17
> geschrieben:
>
>
> Add regulator driver and associated DT bindings for the regulators in the
> Freescale MC34708 PMIC.

from my understanding this PMIC is used typically for i.MX50/53 SoCs. So in this
case
it would make sense to mention it here and CC this patch series also to the IMX
maintainers.

Btw 

git format-patch --cover-letter

is your friend.

Stefan

>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
