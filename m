From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-binding: Add Qualcomm WCNSS control binding
Date: Thu, 31 Mar 2016 15:42:02 -0500
Message-ID: <CAL_JsqKoHOSVGMJfWrGwFi7BMTFp0P3t8W6e4VxtOS8j5aCHWw@mail.gmail.com>
References: <1459226126-16725-1-git-send-email-bjorn.andersson@linaro.org>
 <1459226126-16725-3-git-send-email-bjorn.andersson@linaro.org>
 <20160331142817.GA22092@rob-hp-laptop> <20160331171625.GZ8929@tuxbot>
 <CAL_JsqKbjUxOMbn00OOmwM1vvjRzC8RzX=4WA7WP+K2XYjOSMA@mail.gmail.com> <20160331182449.GA8929@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160331182449.GA8929@tuxbot>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 1:24 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 31 Mar 10:38 PDT 2016, Rob Herring wrote:
>
>> On Thu, Mar 31, 2016 at 12:16 PM, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>> > On Thu 31 Mar 07:28 PDT 2016, Rob Herring wrote:
>> >
>> >> On Mon, Mar 28, 2016 at 09:35:24PM -0700, Bjorn Andersson wrote:
>> > [..]
>>
>> [...]
>>
>> >> > +
>> >> > +== WiFi
>> >> > +The following properties are defined to the WiFi node:
>> >> > +
>> >> > +- compatible:
>> >> > +   Usage: required
>> >> > +   Value type: <string>
>> >> > +   Definition: must be one of:
>> >> > +               "qcom,wcn3620-wlan",
>> >> > +               "qcom,wcn3660-wlan",
>> >> > +               "qcom,wcn3680-wlan"
>> >
>> > Digging through documentation and trying to answer the questions above
>> > made me realize that these numbers are for the external rf component,
>> > not the variants of the logic inside the SoC; and as such wrong.
>>
>> Do you need to know both? Or only the firmware image needs to know?
>>
>
> So far I've only found cases where we need to know the register map for
> the DMA engine shuffling packets, so this is related to the SoC-internal
> part only.
>
> The differences in RF capabilities - at least for WiFi - seems to be
> acquired in runtime from the firmware.
>
> The other piece that depend on the RF part seems to be the availability
> of e.g. ANT support, so if anything that needs to go into the wcnss
> node, in some way (either compatible or the set of subnodes).
>
>> >> > +
>> >> > +- qcom,wcnss-mmio:
>> >> > +   Usage: required
>> >> > +   Value type: <prop-encoded-array>
>> >> > +   Definition: should specify base address and size of the WiFi related
>> >> > +               registers of WCNSS
>> >>
>> >> This is an address visible to the cpu?
>> >>
>> >
>> > Yes it is; the device is controlled both through SMD and mmio accessible
>> > registers, where the SMD interface is the primary interface.
>> >
>> > SMD being the primary "bus" I believe I can't use reg to denote this
>> > register range. Should I describe this in some other form?
>>
>> That's a tricky one. I would create a node for the memory-mapped
>> portion with proper compatible and reg properties, and then make this
>> a phandle to that node. Something similar to how we do phandles to
>> syscon's.
>>
>
> Okay, sounds reasonable. I don't see a need for a specific
> implementation, so I'll just back it with the generic syscon
> implementation (and a specific compatible).

I don't think I'd do syscon here as it is mainly designed to have
multiple users. You just need to look-up the phandle, perhaps check
the compatible, and call of_address_to_resource to get the address.
Actually, you could skip the phandle entirely and just find the node
by compatible (assuming there is only one).

Rob
