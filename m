From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: spear600: Add missing interrupt-parent of rtc
Date: Sun, 14 Jan 2018 12:17:23 +0100
Message-ID: <CACRpkdYtzWewTWrtWTaPWspHzRY6Y7MBNfm1wmy6yvLD_J8hFg@mail.gmail.com>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
 <20180112020711.6gp2pnsxxjzelidq@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180112020711.6gp2pnsxxjzelidq@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 3:07 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Thu, Jan 11, 2018 at 11:28:51AM +0530, Viresh Kumar wrote:
>> The interrupt-parent of rtc was missing, add it.
>>
>> Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
>> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Applied to next/dt. Is stable really needed on this? It's been broken since
> pretty much forever, and nobody has complained... :)

The SPEAr architecture is widely used (in modified variants) by
a large industrial automation company, 20+ years of support cycle.

However I think they have a forked both kernel and hardware, so they
will not notice any time soon, and when they eventually upgrade they
can simply pick the latest I guess.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
