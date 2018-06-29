Return-Path: <SRS0=SoUM=JP=free.fr=robert.jarzmik@kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 3/7] mmc: pxamci: remove dead code from pxamci_remove()
References: <20180629144738.446-1-daniel@zonque.org>
	<20180629144738.446-4-daniel@zonque.org>
Date: Fri, 29 Jun 2018 23:17:49 +0200
In-Reply-To: <20180629144738.446-4-daniel@zonque.org> (Daniel Mack's message
	of "Fri, 29 Jun 2018 16:47:34 +0200")
Message-ID: <87o9ftjnr6.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
To: Daniel Mack <daniel@zonque.org>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Daniel Mack <daniel@zonque.org> writes:

> These gpio assignments don't make sense, as they are not used anywhere.
> Remove the dead code.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
