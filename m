From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv3 01/12] of: add "micron" vendor prefix for Micron
Date: Tue, 18 Nov 2014 19:32:55 +0100
Message-ID: <87vbmcbbqg.fsf@natisbad.org>
References: <cover.1416266432.git.arno@natisbad.org>
	<9cfc5635b14f36e68c499015c6a722804b407f29.1416266432.git.arno@natisbad.org>
	<CAL_JsqKrEoRvt97k+7UHBsNFU739w7BeQbXf5V2TZ2OrmS1Afg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKrEoRvt97k+7UHBsNFU739w7BeQbXf5V2TZ2OrmS1Afg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Rob Herring's message of "Tue, 18 Nov 2014 11:00:21 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Nov 17, 2014 at 5:26 PM, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org> wrote:
>>
>> Micron vendor prefix is not listed yet in vendor-prefixes.txt file. Even
>> if the expected vendor prefix should be the NASDAQ symbol ("mu" in that
>> case), it seems reasonable to use "micron" here because it is what is
>> already found at various locations (e.g. under arch/arm/boot/dts/ for
>> instance).
>
> Already have the same patch queued up.

Perfect, I'll drop mine.

Cheers,

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
