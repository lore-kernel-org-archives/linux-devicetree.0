From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
Date: Mon, 07 Jan 2019 17:21:58 +0100
Message-ID: <86ftu41lqx.fsf@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com> <86bm4x6830.fsf@baylibre.com> <20190104091937.GA4737@localhost>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190104091937.GA4737@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Loys Ollivier <lollivier@baylibre.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org


On Fri 04 Jan 2019 at 09:19, Johan Hovold wrote:

> On Thu, Jan 03, 2019 at 05:04:35PM +0100, Loys Ollivier wrote:
>> 
>> As suggested by Neil Armstrong - this GNSS device seems to behave like
>> most generic GNSS receivers.
>> I'll send a v2 with a generic driver that works for both GlobalTop and
>> u-blox.
>
> That doesn't sound right to me. Judging from a quick look, this device
> appears to be based on a mediatek chipset, so I suggest reworking
> (renaming) this as a Mediatek driver (gnss type would be MTK, reflecting
> the vendor protocol) even if it happens to look a lot like the current
> u-blox driver.
>
OK, agreed - will rename the driver as Mediatek.
Would you recommend keeping any reference to Globaltop ? Such as in the
devicetree gnss bindings.
Or only keep "mediatek,mt3339" for any solution based on that chipset.
> If we ever add more features, like support for some part of the vendor
> protocol or maybe 1pps, things will start diverging. As you noticed you
> already have the generic serial gnss implementation to handle a lot of
> the common bits.
Yes, I would like indeed to look into 1pps after that patch series.
>
>> Loys Ollivier writes:
>> 
>> > Hello !
>> >
>> > This patch series adds a new GNSS driver for the globaltop GNSS
>> > receivers.  These receivers transmits NMEA output sequence as soon
>> > as they have booted.  Power management can be done via the main
>> > supply and optional backup supply as defined in the device tree.
>> >
>> > The driver has been tested using a GlobalTop pa6h chipset on a
>> > Libretech-cc board using the expansion header. Changes made in the
>> > board device tree can be found below for reference and testing.
>
> Thanks,
> Johan

Will send a v2.

-- 
-L
