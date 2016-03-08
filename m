From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Tue, 8 Mar 2016 09:13:35 +0100
Message-ID: <CAMuHMdWuGPJuszXzOgXnyzn+PX=f9YYA8zReW9dC=1rb_qrRiA@mail.gmail.com>
References: <1457104420-18350-1-git-send-email-robh@kernel.org>
	<CAMuHMdVcM9KF0v_0Ejaph4TVC5BtGfOfs9MJ3KMtOL4Hp1qMmg@mail.gmail.com>
	<CAL_Jsq+cBNcHebxdrhn3nQOX4VikVodSBA3kSaWX+uERFNG8cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+cBNcHebxdrhn3nQOX4VikVodSBA3kSaWX+uERFNG8cw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Mar 8, 2016 at 9:00 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Mar 7, 2016 at 5:27 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Fri, Mar 4, 2016 at 4:13 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
>>> fdt_node_check_compatible()"). This adds the following commits from
>>> upstream:
>>>
>>> 53bf130 libfdt: simplify fdt_node_check_compatible()
>>> c9d9121 Warn on node name unit-address presence/absence mismatch
>>> 2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets
>>>
>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>> As usual, this is just an automated copy of upstream dtc into the kernel
>>> tree. The changeset is small enough that I have left it here.
>>>
>>> The main reason for this sync is to pick-up the new unit-address
>>> warnings.
>>
>> I gave this a try. Obviously it finds many abuses that should be fixed.
>>
>> However, I'm wondering about the following, where the unit-address is just
>> used to distinguish between multiple instances:
>>
>>     Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit
>> name, but no reg property
>>         compatible = "cache";
>
> Just add a reg property. The values should probably match the MPIDR in
> some way (e.g. 0 and 100).

it's not "just" adding a reg property.
It's also introducing a "cache" subnode with "#address-cells = <1>" and
"#size-cells = <0>", and perhaps adding code to make the subnode work.
Or moving them under the cpu node, which is actually what the example in
ePAPR shows.

>>     Warning (unit_address_vs_reg): Node /regulator@1 has a unit name,
>> but no reg property
>>         compatible = "regulator-fixed"
>
> Regulators are oddball in that the node names are generally supposed
> to be the regulator name not generic.

OK.

>>     Warning (unit_address_vs_reg): Node /i2c@2 has a unit name, but no
>> reg property
>>         compatible = "i2c-gpio"
>
> You all should have all the on-chip devices under a simple-bus, then
> you would not have this namespace collision here. Still you could have

Fair enough.

> 2 i2c-gpio devices. We can add reg in those cases.

Indeed.
And it's not "just" adding a reg property. More "#address-cells = <1>" and
"#size-cells = <0>" glue needed here, too.
And an update of Documentation/devicetree/bindings/i2c/i2c-gpio.txt

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
