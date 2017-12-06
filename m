From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] add Meson8/Meson8b serial core clock handling
Date: Wed, 06 Dec 2017 11:36:16 -0800
Message-ID: <7hindjsl73.fsf@baylibre.com>
References: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
        <1509445230.13838.26.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509445230.13838.26.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's message
        of "Tue, 31 Oct 2017 11:20:30 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hgkr.klein-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> On Sat, 2017-10-28 at 14:34 +0200, Martin Blumenstingl wrote:
>> This patchset adds the tty/serial core clock handling to the UARTs
>> on Meson8 and Meson8b.
>> 
>> Basically this is the Meson8 and Meson8b version of a patchset from
>> Helmut Klein and Neil Armstrong, who implemented this for Meson GX
>> (see [0]). Back then I asked Neil to drop Meson8b from his patchset
>> because I was working on the Meson8 clock controller at that time.
>> 
>> This also removes the last users that rely on the "amlogic,meson-uart"
>> binding. Removing that binding from the meson_uart driver is not part
>> of this series though.
>> 
>> 
>> [0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004173.html
>> 
>
> Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Applied to v4.16/dt with Jerome's ack.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
