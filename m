From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Tue, 8 Mar 2016 02:00:12 -0600
Message-ID: <CAL_Jsq+cBNcHebxdrhn3nQOX4VikVodSBA3kSaWX+uERFNG8cw@mail.gmail.com>
References: <1457104420-18350-1-git-send-email-robh@kernel.org> <CAMuHMdVcM9KF0v_0Ejaph4TVC5BtGfOfs9MJ3KMtOL4Hp1qMmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVcM9KF0v_0Ejaph4TVC5BtGfOfs9MJ3KMtOL4Hp1qMmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 7, 2016 at 5:27 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Rob,
>
> On Fri, Mar 4, 2016 at 4:13 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
>> fdt_node_check_compatible()"). This adds the following commits from
>> upstream:
>>
>> 53bf130 libfdt: simplify fdt_node_check_compatible()
>> c9d9121 Warn on node name unit-address presence/absence mismatch
>> 2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> As usual, this is just an automated copy of upstream dtc into the kernel
>> tree. The changeset is small enough that I have left it here.
>>
>> The main reason for this sync is to pick-up the new unit-address
>> warnings.
>
> I gave this a try. Obviously it finds many abuses that should be fixed.
>
> However, I'm wondering about the following, where the unit-address is just
> used to distinguish between multiple instances:
>
>     Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit
> name, but no reg property
>         compatible = "cache";

Just add a reg property. The values should probably match the MPIDR in
some way (e.g. 0 and 100).

>     Warning (unit_address_vs_reg): Node /regulator@1 has a unit name,
> but no reg property
>         compatible = "regulator-fixed"

Regulators are oddball in that the node names are generally supposed
to be the regulator name not generic.

>     Warning (unit_address_vs_reg): Node /i2c@2 has a unit name, but no
> reg property
>         compatible = "i2c-gpio"

You all should have all the on-chip devices under a simple-bus, then
you would not have this namespace collision here. Still you could have
2 i2c-gpio devices. We can add reg in those cases.

>
> How should these be fixed?
>
> BTW, there seems to be a missing dependency of the DTBs on the dtc itself.
> Applying your patch and running "make dtbs" didn't rebuilt any DTBs.

Should probably fix, but It is rare that that would actually matter.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
