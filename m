From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: sun4i-usb-phy: Add property
 descriptions for H3
Date: Sat, 19 Aug 2017 10:34:34 +0800
Message-ID: <CAGb2v67cMzvmZGMFptkak-M1AT0FNFSX7p-1xqsczMAnO8UFHA@mail.gmail.com>
References: <20170803081411.22389-1-wens@csie.org> <20170803081411.22389-2-wens@csie.org>
 <20170810170855.txcvwjfb4kzx4q66@rob-hp-laptop> <CAGb2v65mKdQC40ASsmeWqCxnDWV4mmf9QFo5-t7spX9RRJBdbg@mail.gmail.com>
 <7a1889e0-6733-3f7d-4b34-b08e8bf3e2b5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7a1889e0-6733-3f7d-4b34-b08e8bf3e2b5-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 6:53 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Thursday 17 August 2017 10:35 PM, Chen-Yu Tsai wrote:
>> On Fri, Aug 11, 2017 at 1:08 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, Aug 03, 2017 at 04:14:04PM +0800, Chen-Yu Tsai wrote:
>>>> The Allwinner H3 SoC has 4 USB PHYs, so it needs four sets of pmu
>>>> regions, clocks, resets, and optional vbus properties. These were
>>>> not described when the H3 compatible string was added.
>>>>
>>>> Fixes: 626a630e003c ("phy-sun4i-usb: Add support for the host usb-phys
>>>>                     found on the H3 SoC")
>>>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Kishon, are the dt binding and driver parts of this series OK for
>> 4.14? I'd like to get an answer from you to be able to merge the
>> device tree parts.
>
> Yes. I merged the phy driver patches to phy tree. I'm not able to merge the
> dt-bindings patch due to conflicts. Can you resend the dt-binding patch based
> on linux-phy next or let me know if I'm missing any dependent patch.

That's weird. I just applied both patches on top of linux-phy/next and
there were no conflicts or issues. Note that there are two dt binding
patches, patches 1 and 2 in this series. Patch 1 has to be applied before
patch 2

Thanks
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
