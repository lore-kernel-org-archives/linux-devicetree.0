From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Tue, 16 May 2017 09:47:49 -0700
Message-ID: <87h90ku4sq.fsf@eliezer.anholt.net>
References: <20170511235625.22427-1-eric@anholt.net> <20170511235625.22427-3-eric@anholt.net> <1579603.xgvSgGFBs8@avalon> <87shk53bxq.fsf@eliezer.anholt.net> <CAL_Jsq+Pt5necK9cUPwFqmCbK5d-0NVNv-_LRVqyNgr5ajR8LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+Pt5necK9cUPwFqmCbK5d-0NVNv-_LRVqyNgr5ajR8LQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Mon, May 15, 2017 at 7:03 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>> Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:
>>
>>> Hi Eric,
>>>
>>> Thank you for the patch.
>>>
>>> On Thursday 11 May 2017 16:56:23 Eric Anholt wrote:
>>>> The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
>>>> DSI->DPI bridge and touchscreen controller integrated, that connects
>>>> to the Raspberry Pi through its 15-pin "DSI" connector (some lines are
>>>> DSI, some lines are I2C).
>>>>
>>>> This device is represented in the DT as three nodes (DSI device, I2C
>>>> device, panel).  Input will be left to a separate binding later, as it
>>>> will be a basic I2C client device.
>>>>
>>>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>>>> ---
>>>>  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68 +++++++++++++++++++
>>>>  .../panel/raspberrypi,7inch-touchscreen-panel.txt  |  7 +++
>>>>  2 files changed, 75 insertions(+)
>>>>  create mode 100644
>>>> Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchscr
>>>> een-bridge.txt create mode 100644
>>>> Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscre
>>>> en-panel.txt
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>>> creen-bridge.txt
>>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>>> creen-bridge.txt new file mode 100644
>>>> index 000000000000..a5669beaf68f
>>>> --- /dev/null
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>>> creen-bridge.txt @@ -0,0 +1,68 @@
>>>> +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
>>>> +
>>>> +This DSI panel contains:
>>>> +
>>>> +- TC358762 DSI->DPI bridge
>>>> +- Atmel microcontroller on I2C for power sequencing the DSI bridge and
>>>> +  controlling backlight
>>>> +- Touchscreen controller on I2C for touch input
>>>> +
>>>> +and this covers the TC358762 bridge and Atmel microcontroller, while
>>>> +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
>>>
>>> The TC358762 is a standalone bridge that doesn't depend on the ATTiny
>>> microcontroller used by the RPI. As it's usable standalone, I believe this
>>> binding should be split in two.
>>
>> Do you have a plan for how I would implement a driver on top of that
>> binding change, though?  Note that we don't program the Toshiba
>> directly, we only send commands to the Atmel.
>
> I agree. If it is a black box and the interface to the host is defined
> by the Atmel uC firmware, then that's what the DT should describe.
> Perhaps a diagram here or pointer to one would help and remove
> mentioning what kind of bridge chip it is.

It's a *very* black box.  I have some non-public schematics that don't
even say what panel is involved, and no documentation of the uc
interface.  The driver code is just replicating the firmware's
programming sequence.

I would certainly love to be building a generic TC358762 driver, which
would be a lot more satisfying.  I just don't think it's doable for this
panel.  Given that, what do I need to do to the DT?  Should I just drop
mention of the Toshiba and talk about this being a bridge with a custom
microcontroller firmware?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkbLTUACgkQtdYpNtH8
nuhD0RAAoyUZKCYtVx5DePA2RZGz4aF3hxmS783MMF6z+x3T59MFELMauXFP8wHX
JY2zTavX8Vh0cQ/wXPYSNOj5LW/wUkRx2kzoFgXSxH+kF9GvX4Raqzb4smxNm55W
lVS9sWZRN1E2lfcw5XQZDDu4tU/wapHuAXoutz0ajRL92pGB07ji/bad8HhbCiig
aaUahNTQjU4z/85Hr8dKlrOfaTSxWMvbk81xsAmrWcwGiRCvjSVk1/HJzwtH8Taz
2OwyoON/laekoxpu05ZuLdJ6WP9gva25n04nMSfIwMfUJysiYuaD85FwWxZocl2t
LFgWxIf/D15GJ+MtEC2zEHgwi2l9/ayCICcgtNXWogIom1iSslvKL6goqS4nIxjo
RxtgemHR6803VtWXfU38i30Myxqi7oxSZ8rqw4aqBbvBkyavUVkpB/FNIAGniNHL
slmdgEMQm+HQSoTamFjf9To2Y3wrPNGunAmWWzgDW1vS5O3mEccDiQv7k+9wjcJK
uqAjpeIm4c8LwktU5AaI2N9+i9O16Tq3nWA8mbvFmL9S9nayzHVxAcobRvQ3Bd3V
v1f9c/7krf5v8wC+qtKIPUfQb5AaUZx1i9F5V//toQi4iOju+AYUmp12jbvTYWa3
D71fKh4m6fdYSItX4TtLzcbY/8H3Bzt6dOE2IWXWSFEJs+XlaIM=
=yElQ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
