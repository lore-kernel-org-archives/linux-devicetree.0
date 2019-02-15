From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v4 4/4] gnss: add driver for mediatek receivers
Date: Fri, 15 Feb 2019 13:25:20 +0100
Message-ID: <86d0ntfdcf.fsf@baylibre.com>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com> <1550070569-18588-5-git-send-email-lollivier@baylibre.com> <20190214100019.GA4197@Red> <20190214101212.GJ28278@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190214101212.GJ28278@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Thu 14 Feb 2019 at 10:12, Johan Hovold <johan@kernel.org> wrote:

> On Thu, Feb 14, 2019 at 11:00:19AM +0100, Corentin Labbe wrote:
>> On Wed, Feb 13, 2019 at 04:09:29PM +0100, Loys Ollivier wrote:
>> > Add driver for serial-connected Mediatek-based GNSS receivers.
>> > 
>> > These devices typically boot transmitting vendor specific NMEA output
>> > sequences. The serial port bit rate is read from the device tree
>> > "current-speed".
>> > 
>> > Note that the driver uses the generic GNSS serial implementation and
>> > therefore essentially only manages power abstracted into three power
>> > states: ACTIVE, STANDBY, and OFF.
>> > 
>> > For mediatek receivers with a main supply and no enable-gpios, this simply
>> > means that the main supply is disabled in STANDBY and OFF (the optional
>> > backup supply is kept enabled while the driver is bound).
>> > 
>> > Note that the timepulse-support is left unimplemented.
>> > 
>> > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>
>> > +static int mtk_set_active(struct gnss_serial *gserial)
>> > +{
>> > +	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
>> > +	int ret;
>> > +
>> > +	ret = regulator_enable(data->vcc);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	return 0;
>> > +}
>> 
>> Hello
>> 
>> This could be simplified to return regulator_enable(data->vcc);
>
> Indeed, but I prefer this style which clearly separates the error path
> from the success path while making the success return value explicit.
>

It respects the coding style/standard and I prefer the original version.
It's also easier to debug if you want to add extra code on error.

>> Furthermore, after this simplification, the function seems useless.
>
> Why do you think so? You still need to retrieve the regulator from the
> driver data. Sure, this could be folded into mtk_set_power(), but that
> would be less ideal if there are more resources that need to be managed
> (e.g. an external lna supply).

I would be in favor to keep mtk_set_active. It clearly shows when the
regulator is enabled.
It also seems logic to have an enable/standby function in the driver.
Even if those are trivial (for now).

>
> Thanks,
> Johan


-- 
-L
