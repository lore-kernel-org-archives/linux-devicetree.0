From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 2/3] arm: mvebu: add .dts file for Synology DS213j
Date: Tue, 18 Nov 2014 00:23:53 +0100
Message-ID: <871tp1pg1i.fsf@natisbad.org>
References: <cover.1416095841.git.arno@natisbad.org>
	<1eb26f8c1946622910a7e2318c895a7082fea7e5.1416095841.git.arno@natisbad.org>
	<20141116020024.GC15870@lunn.ch> <87d28nb83u.fsf@natisbad.org>
	<546931E1.5070909@killerwolves.net> <878ujas07o.fsf@natisbad.org>
	<546A7997.1040603@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546A7997.1040603-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org> (Ben Peddell's message of
	"Tue, 18 Nov 2014 08:41:27 +1000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ben,

Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org> writes:

>>> The 5000RPM was interpolated from my measured RPM pulse rate (4200PPM)
>>> of the 80mm fan in my DS211j (which uses the 150-32-35 fan config) at
>>> maximum RPM.
>> 
>> Then, I think I need to change the speed map to have 1900 RPM as max
>> speed. Out of curiosity, how did you measured the RPM pulse rate
>> exactly?
>
> I hooked a logic analyzer to the sense pin and measured the pulse rate.
>
> Looking at the specifications of the fan in this unit (an EC7025L12ER),
> it has a maximum fan speed of 3000RPM, so it looks like it uses two
> pulses per revolution and not one as I had assumed when I created the
> speed map.

Thanks for this feedback.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
