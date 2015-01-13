From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 1/8] dt-bindings: use isil prefix for Intersil in vendor-prefixes.txt
Date: Tue, 13 Jan 2015 17:31:29 -0600
Message-ID: <CAL_JsqJMQ=8_sQhCRR+f-6v0Ac3hme3Tsom0x1GuA=FaZkgdnA@mail.gmail.com>
References: <cover.1418763328.git.arno@natisbad.org> <e32fe98a511e3ab8aeed9849bcac33ba14fd8986.1418763328.git.arno@natisbad.org>
 <CAL_JsqLt7BuG9eccqR4CELPsOO+o3NGP6c4aqKDXbJfT0O0=5w@mail.gmail.com> <87ppaib72j.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ppaib72j.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Hayato Suzuki <hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 5:21 PM, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org> wrote:
> Hi Rob,
>
> Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Tue, Dec 16, 2014 at 3:18 PM, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org> wrote:
>>>
>>> This patch fixes DT vendor-prefixes.txt documentation to reference
>>> isil (NASDAQ symbol and the most used prefix inside the kernel) for
>>> Intersil.
>>>
>>> It reverts 7c75c1d5e72b ("dt-bindings: Document deprecated device
>>> vendor name to fix related warning").
>>>
>>> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
>>
>> Applied for 3.20. Thanks.
>>
>> While there are not interdepencies here, it probably would have been
>> better to keep this series all together.
>
> This was the main reason my v0 was in a single patch. I think I then got
> some comment to split things in different patches so that the various
> maintainers have their words to say. But I'll try and follow your
> approach next time.

I didn't say a single patch, but merge the series together. A separate
commit per maintainer is generally preferred. You just have to be
clear whether you are looking for just acks or to take individual
patches.

I should have chimed in earlier as well, but I missed this initially.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
