From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/2] video: ARM CLCD: Add DT support
Date: Tue, 17 Sep 2013 15:34:49 -0600
Message-ID: <5238CAF9.6040400@wwwdotorg.org>
References: <1379351934-25415-1-git-send-email-pawel.moll@arm.com>  <52376180.1090001@wwwdotorg.org> <1379435799.9205.16.camel@hornet> <1379436716.9205.25.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379436716.9205.25.camel@hornet>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/17/2013 10:51 AM, Pawel Moll wrote:
> Uh, sorry, missed one...
> 
> On Tue, 2013-09-17 at 17:36 +0100, Pawel Moll wrote:
>> On Mon, 2013-09-16 at 20:52 +0100, Stephen Warren wrote:
>>>> +- arm,pl11x,panel-data-pads: array of 24 cells, each of them describing
>>>> +				a function of one of the CLD pads,
>>>> +				starting from 0 up to 23; each pad can
>>>> +				be described by one of the following values:
>>>> +	- 0: reserved (not connected)
>>>> +	- 0x100-0x107: color upper STN panel data 0 to 7
>>> ...
>>>
>>> I assume those are the raw values that go into the HW?
> 
> No, they can be considered "labels", defining the way pads are used
> (wired). Then, basing on this information, the driver is configuring the
> cell, eg. selecting STN or TFT mode (thus switching the output between
> panel formatter and raw RGB data source).

Oh, why not just use the raw values from the HW registers for this?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
