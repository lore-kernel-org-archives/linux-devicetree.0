Return-Path: <SRS0=1rqC=JQ=free.fr=robert.jarzmik@kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 7/7] mmc: pxamci: let mmc core handle regulators
References: <20180629144738.446-1-daniel@zonque.org>
	<20180629144738.446-8-daniel@zonque.org>
Date: Sat, 30 Jun 2018 17:25:54 +0200
Message-ID: <87d0w8i9dp.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
To: Daniel Mack <daniel@zonque.org>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Daniel Mack <daniel@zonque.org> writes:

> Strip some code by letting the mmc core handle the regulators. The old
> .gpio_power pdata handling is kept around for now.
>
> This also set the voltage on the regulator and handles -EPROBE_DEFER
> correctly.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
I'll take it as it was tested, right ?

Therefore:
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

--
Robert
