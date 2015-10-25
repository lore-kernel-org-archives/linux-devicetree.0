From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Sun, 25 Oct 2015 15:45:43 -0500
Message-ID: <562D3F77.5040205@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <562A2C2F.1020808@ti.com>
 <20151023231822.GQ29919@sirena.org.uk> <562ACCCC.503@ti.com>
 <20151024221457.GS29919@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151024221457.GS29919-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2015 05:14 PM, Mark Brown wrote:
> On Fri, Oct 23, 2015 at 07:11:56PM -0500, Andrew F. Davis wrote:
>> On 10/23/2015 06:18 PM, Mark Brown wrote:
>
>>> mt6397 doesn't do this, it doesn't have a compatible string at all (it's
>>> doing what I'm recommending that you do).  The SPMI devices are
>>> standalone devices, their parent device is actually functioning as a bus
>>> controller here (it's really a microcontroller inside the SoC).  The
>>> Palmas is part of how we realised this was a problem.
>
>> mt6397: Documentation/devicetree/bindings/mfd/mt6397.txt
>> Doing exactly what I'm doing,
>
> Tbe binding document is buggy and doesn't reflect the code, there's no
> compatible string in the driver.
>

Sure there is:

drivers/mfd/mt6397-core.c:48:
.of_compatible = "mediatek,mt6397-regulator",

Then mfd_add_devices uses this to find the regulator node and fill
in .of_node, then in the regulator driver:

drivers/regulator/mt6397-regulator.c:48:
.of_match = of_match_ptr(match),

which uses your helper to match the nodes in the filled in .of_node.

>> The Palmas is a great example of why this is a good idea, there are
>> so many spins on this common base, and look how we can re-use sub-nodes:
>
> There's no real reuse here, we have to have a table in both the MFD and
> regulator listing every variant.

That's not true, the only variant that needs its own table is the tps65917,
and that's for the IRQ and regulator differences. The RTC, pwrbutton, and
GPIO nodes are completely variant agnostic and their drivers are reused
by just adding their subnode to a new PMIC device node.

> Remember that the only reason the user
> is having to type most of those subnodes at all is that we pushed things
> into the DT, if someone forgot to include one of the nodes in their
> board DT then they won't be able to use the relevant feature even if
> it's there.
>

This is what DT is for, we want to push this kind of thing into DT, the
driver should not have to know the devices hardware configuration anymore
that in needs to.

>>> The fact that the SoC DT is not distinct from the board DT is actually
>>> one of the problems with the way we're using DT at the minute, it means
>>> that DTBs are much less stable than they should be since we can enhance
>>> support for SoCs but DTBs need regenerating to take advantage of it.  It
>>> would be much better if the boards just referenced the SoC they use and
>>> pulled in a separate definition of the SoC (DT overlays will make it
>>> much more tractable to implement that if someone has time...).
>
>> I figured this can already be done by keeping the SoC stuff in dtsi files?
>
> That doesn't help with the above issue, include files get processed at
> the time the binary is generated.
>

Yeah so the board DT and the SoC DT are already mostly separate, it would
then just be a matter enforcing where nodes are defined.

>> Well I have to match the sub-devices on something, it's ether the node name
>> or the compatible string, so they might have to get used to typing :)
>
> No, that's not the case - remember, users don't have to write a new
> driver every time they instantiate a device on a board.  They're going
> to have to list the in-use regulators one way or another but if we have
> the extra compatible for regulators they have to bind both the core
> device (which is going to be required anyway due to the control bus) and
> the subnode saying that it has regulators (which we knew anyway as soon
> as we knew we had the core device).
>

We don't know what sub-devices the core device has, PMICs are more like
SoCs on a bus than a regular device, the sub-parts change with every spin and
we can represent this in DT like we do with SoCs. Else we would have to have
a new core binding for every spin. We know what devices are on a particular
SoC too, but we still list them and match them in DT so some SoC driver
doesn't have to.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
