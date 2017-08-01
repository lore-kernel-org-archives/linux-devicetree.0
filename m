From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] clk: meson: expose clk ids
Date: Tue, 1 Aug 2017 14:00:22 +0200
Message-ID: <6494a76f-7282-cc39-c02a-0f1b2a8d83ff@baylibre.com>
References: <20170731113832.26490-1-jbrunet@baylibre.com>
 <CAK8P3a28nb8QsJC8V4+SJM0gz70BDOv8jAczRWoCF+HfvkwJfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a28nb8QsJC8V4+SJM0gz70BDOv8jAczRWoCF+HfvkwJfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/31/2017 04:05 PM, Arnd Bergmann wrote:
> On Mon, Jul 31, 2017 at 1:38 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> In previous cycles, concerns have been raised about the way clocks are
>> exposed for the meson clock controller, only when validated and required
>> in DT.
>>
>> Instead, this patchset expose all the known clocks which may be needed in
>> DT later on. The clocks left out are internal clocks which should never be
>> used directly in DT. These are mostly internal muxes and dividers of
>> composite clocks.
>>
>> While this should reduce the patch flow on the related header files, It
>> won't stop it completely. There are still many clocks we don't know about
>> yet. We tend discover a few in every cycle.
>>
>> This patchset depends on these fixes [0] to avoid issues when adding new
>> clk ids.
>>
>> [0]: https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
> 
> Thanks a lot!
> 
>  Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 

Applied to clk-meson's next/headers with arnd's ack.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
