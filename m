From: "'Kishon Vijay Abraham I' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: sun4i-usb-phy: Add
 property descriptions for H3
Date: Fri, 18 Aug 2017 16:23:36 +0530
Message-ID: <7a1889e0-6733-3f7d-4b34-b08e8bf3e2b5@ti.com>
References: <20170803081411.22389-1-wens@csie.org>
 <20170803081411.22389-2-wens@csie.org>
 <20170810170855.txcvwjfb4kzx4q66@rob-hp-laptop>
 <CAGb2v65mKdQC40ASsmeWqCxnDWV4mmf9QFo5-t7spX9RRJBdbg@mail.gmail.com>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCOOP4VF5IDRB3UO3PGAKGQESRV3Q7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v65mKdQC40ASsmeWqCxnDWV4mmf9QFo5-t7spX9RRJBdbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 17 August 2017 10:35 PM, Chen-Yu Tsai wrote:
> On Fri, Aug 11, 2017 at 1:08 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Aug 03, 2017 at 04:14:04PM +0800, Chen-Yu Tsai wrote:
>>> The Allwinner H3 SoC has 4 USB PHYs, so it needs four sets of pmu
>>> regions, clocks, resets, and optional vbus properties. These were
>>> not described when the H3 compatible string was added.
>>>
>>> Fixes: 626a630e003c ("phy-sun4i-usb: Add support for the host usb-phys
>>>                     found on the H3 SoC")
>>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Kishon, are the dt binding and driver parts of this series OK for
> 4.14? I'd like to get an answer from you to be able to merge the
> device tree parts.

Yes. I merged the phy driver patches to phy tree. I'm not able to merge the
dt-bindings patch due to conflicts. Can you resend the dt-binding patch based
on linux-phy next or let me know if I'm missing any dependent patch.

Thanks
Kishon
