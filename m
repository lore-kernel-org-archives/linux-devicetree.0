Return-Path: <SRS0=SoUM=JP=free.fr=robert.jarzmik@kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/7] mmc: pxamci: remove irq from private context
References: <20180629144738.446-1-daniel@zonque.org>
	<20180629144738.446-2-daniel@zonque.org>
Date: Fri, 29 Jun 2018 23:14:07 +0200
In-Reply-To: <20180629144738.446-2-daniel@zonque.org> (Daniel Mack's message
	of "Fri, 29 Jun 2018 16:47:32 +0200")
Message-ID: <87wouhjnxc.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
To: Daniel Mack <daniel@zonque.org>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Daniel Mack <daniel@zonque.org> writes:

> This seems to be a left-over from times before the IRQ was handled by devm
> functions. Remove it.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
