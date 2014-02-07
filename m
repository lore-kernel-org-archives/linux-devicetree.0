From: srinivas kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: STi: add stid127 soc support
Date: Fri, 7 Feb 2014 08:08:01 +0000
Message-ID: <52F49461.2020008@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com> <201401312115.33731.arnd@arndb.de> <52F22508.7080706@st.com> <201402061746.30248.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201402061746.30248.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, maxime.coquelin-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/02/14 16:46, Arnd Bergmann wrote:
> On Wednesday 05 February 2014, srinivas kandagatla wrote:
>> Currently l2cc bindings has few optional properties like.
>>
>> - arm,data-latency
>> - arm,tag-latency
>> - arm,dirty-latency
>> - arm,filter-ranges
>> - interrupts :
>> - cache-id-part:
>> - wt-override:
>>
>> These does not include properties to set "way-size", "associativity",
>> "enabling prefetching", "Prefetch drop enable", "prefetch offset",
>> "Double linefill" and few more in prefect control register and
>> aux-control register.
>>
>> This is not just a issue with STi SOCs, having a quick look, I can see
>> that few more SOCs have similar requirements to set these properties.
>>
>> We could do two things to get l2 setup automatically on STi SOCS.
>>
>> 1> Either define these properties case-by-case basic, which might be
>> useful for other SOCs too.
>>
>> 2> Or Add new compatible string for STi SoCs so that they can
>> automatically setup these values in cache-l2x0.c
>>
>> Am Ok with either approaches.
>>
> 
> I suggested 1 in the past, but the objection that I saw (can't
> find the email at the moment) was that the additional settings
> are "configuration" rather than "hardware properties". What I'd
> really need to know from you is which of properties you listed
> as missing above are actually needed for your platform, and whether
> they can be classified as hardware specific or just configuration.

On STi Platforms we need below properties to got for option 1.
arm,way-size;
arm,instruction-prefetch-enable;
arm,data-prefetch-enable;

we also want a property or a way to set
"Shareable attribute Override Enable" bit in the Auxiliary Control
Register, bit[22].

Thanks,
srini
> 
> 	Arnd
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
