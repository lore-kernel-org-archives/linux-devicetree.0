From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 13:33:57 +0200
Message-ID: <CAJKOXPe5AWTK+NuVpiObzjEG+CFWB5_AeYncNkbkSXRr+4RQUQ@mail.gmail.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap> <20170117093813.mxp2hgoxbgske6ru@lukather>
 <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4f5b8608-af6c-3ef5-aaf0-e7e034d006cd-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 12:22 PM, Neil Armstrong
<narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> On 01/17/2017 10:38 AM, Maxime Ripard wrote:
>> Hi,
>>
>> On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
>>> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
>>>> The ARM Mali Utgard GPU family is embedded into a number of SoCs from
>>>> Allwinner, Amlogic, Mediatek or Rockchip.
>>>>
>>>> Add a binding for the GPU of that family.
>>>>
>>>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++++++++++
>>>>  1 file changed, 76 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
>>>
>>> Do you have a driver in kernel which will implement these bindings?
>>
>> No, but we have bindings for out-of-tree drivers already.
>>
>>> Defining them for out-of-tree driver does not bring any benefits
>>> (3rd party driver will not respect them anyway).
>>
>> You could see it the other way around too. The out-of-tree drivers
>> don't respect it at the moment because there's no binding to respect.
>>
>> And at least for us, we definitely plan on doing that.
>>
>> Maxime
>
> Hi Maxime, Krzysztof,
>
> We hope this will be accepted so it will solve the same issue we have on Amlogic SoCs
> and all the other mali powered SoCs.

It will be helpful also for other SoCs using Mali 400 (e.g.
Exynos3250, Exynos4412).

> Having mainline bindings will forcre out-of-tree driver to respect those bindings
> and remove a dts out-of-tree patch aswell.

I would argue here over the word "force". Having bindings defined here
does not force anyone into anything. The out-of-tree can do whatever
they want. It is a wish from kernel side - it might be respected but
it might not.

Just to be sure - I am not opposed against. Some time ago I wanted
Mali400 to be upstreamed but with current policy about user-space side
it is not possible.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
