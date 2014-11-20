From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv4 01/10] arm: mvebu: fix vendor prefix typo in kirkwood-synology.dtsi
Date: Thu, 20 Nov 2014 09:28:49 +0100
Message-ID: <871toytgvy.fsf@natisbad.org>
References: <cover.1416351425.git.arno@natisbad.org>
	<20141120015519.GA22670@titan.lakedaemon.net>
	<20141120050213.GB2596@lunn.ch> <7770322.bXz9M2IL1d@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7770322.bXz9M2IL1d@wuerfel> (Arnd Bergmann's message of "Thu, 20
	Nov 2014 08:35:43 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

>> > Should the driver now support both variants for backward compatibility?
>> 
>> Hi Jason
>> 
>> This is an i2c device. i2c totally ignores the vendor. It is optional.
>> So there is no backward compatibility issues.
>> 
>
> This question keeps coming up, so I'd suggest explaining it in the
> patch changelog.

Granted ;-)

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
