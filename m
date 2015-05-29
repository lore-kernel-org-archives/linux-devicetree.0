From: Andrew <andrew@ncrmnt.org>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: Fix mapping of pin 63 (gpo -> gpio)
Date: Fri, 29 May 2015 12:55:44 +0300
Message-ID: <1e014a41f99caee6f054713546efdf20@mail.ncrmnt.org>
References: <1428784160-19431-1-git-send-email-andrew@ncrmnt.org>
 <1428784160-19431-2-git-send-email-andrew@ncrmnt.org>
 <20150529111002.7368ca50@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150529111002.7368ca50@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thomas Petazzoni =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 29.05.2015 12:10:
> Dear Andrew Andrianov,
>=20
> On Sat, 11 Apr 2015 23:29:19 +0300, Andrew Andrianov wrote:
>> Signed-off-by: Andrew Andrianov <andrew@ncrmnt.org>
>> ---
>>  drivers/pinctrl/mvebu/pinctrl-armada-370.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-370.c=20
>> b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
>> index c4f51d0..78c332d 100644
>> --- a/drivers/pinctrl/mvebu/pinctrl-armada-370.c
>> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-370.c
>> @@ -364,7 +364,7 @@ static struct mvebu_mpp_mode mv88f6710_mpp_modes=
[]=20
>> =3D {
>>  	   MPP_FUNCTION(0x5, "audio", "mclk"),
>>  	   MPP_FUNCTION(0x6, "uart0", "cts")),
>>  	MPP_MODE(63,
>> -	   MPP_FUNCTION(0x0, "gpo", NULL),
>> +	   MPP_FUNCTION(0x0, "gpio", NULL),
>>  	   MPP_FUNCTION(0x1, "spi0", "sck"),
>>  	   MPP_FUNCTION(0x2, "tclk", NULL)),
>>  	MPP_MODE(64,
>=20
> I know the patch has already been applied, but this is weird: I just
> checked the datasheet again, and it really says this pin is a "gpo".
> I'll try to get some more information.
>=20
> Best regards,
>=20
> Thomas

Yep, exactly. I've seen that in the public docs. It must be a typo,
unless there's something we don't know.

On DNS-327L this pin is wired as a button. Without th patch only
gpio-buttons driver fails probing, but you can still configure the pin
as input via sysfs gpio interface and even read sensible values from it=
=2E
If you have a board where this pin is broken out - it's easy to test.

--=20
Regards,
Andrew

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
