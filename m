Return-Path: <SRS0=1rqC=JQ=free.fr=robert.jarzmik@kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 5/7] mmc: pxamci: call mmc_of_parse()
References: <20180629144738.446-1-daniel@zonque.org>
	<20180629144738.446-6-daniel@zonque.org>
Date: Sat, 30 Jun 2018 17:25:41 +0200
Message-ID: <87r2koi9e2.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
To: Daniel Mack <daniel@zonque.org>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Daniel Mack <daniel@zonque.org> writes:

> Call into mmc_of_parse() from pxamci_of_init(). As it needs a pointer to a
> struct mmc_host, refactor the code a bit.
>
> This allows all generic MMC properties to be set that are described in
> Documentation/devicetree/bindings/mmc/mmc.txt.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>

I'm a bit worried about this one :
 - mmc_of_init() will request the gpios from "cd-gpios" and "wp-gpios"
 - pdata->gpio_card_detect will be used to request the same gpio in
 pxa_mci_of_init()

So the gpio is acquired twice, isn't it ? Do you know this works by test proof,
and doesn't it make sense to remove the "pdata->gpio* =" statements from
pxamci_of_init() ?

Cheers.

-- 
Robert
