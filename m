From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Wed, 21 Oct 2015 09:57:53 +0100
Message-ID: <87a8rcegz2.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <1444426068-15817-2-git-send-email-eric@anholt.net>
 <CAL_JsqKbAm1=70GaDRg1Z47A9d9FShwpWacMOjr+FE8bZuocVg@mail.gmail.com>
 <87lhb63a60.fsf@eliezer.anholt.net>
 <CAL_JsqJ3ErrFQxA9pLV7pvG3pCEkPFRfE6sGER5uBeFbmDEnxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0871983795=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqJ3ErrFQxA9pLV7pvG3pCEkPFRfE6sGER5uBeFbmDEnxA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-rpi-kernel@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0871983795==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Herring <robh@kernel.org> writes:

> On Tue, Oct 13, 2015 at 1:17 PM, Eric Anholt <eric@anholt.net> wrote:
>> Rob Herring <robh@kernel.org> writes:
>>
>>> On Fri, Oct 9, 2015 at 4:27 PM, Eric Anholt <eric@anholt.net> wrote:
>>>> ---
>>>>
>>>> v2: Extend the commit message, fix several nits from Stephen Warren.
>>>> v3: Rename the compatibility strings, clean up node names, drop the
>>>>     unnecessary lists of components.  Use compatibility strings for
>>>>     choosing CRTC HVS channel numbers.  Document the HDMI clock usage.
>>>>
>>>>  .../devicetree/bindings/gpu/brcm,bcm-vc4.txt       | 64 ++++++++++++++++++++++
>>>
>>> Can you put this in bindings/display/ instead? Things are moving there in 4.4.
>>
>> Sure.
>>
>>>>  1 file changed, 64 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt
>>>> new file mode 100644
>>>> index 0000000..175bcde
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt
>>>> @@ -0,0 +1,64 @@
>>>> +Broadcom VC4 GPU
>>>> +
>>>> +The VC4 device present on the Raspberry Pi includes a display system
>>>> +with HDMI output and the HVS scaler for compositing display planes.
>>>> +
>>>> +Required properties for VC4:
>>>> +- compatible:  Should be "brcm,bcm2835-vc4"
>>>
>>> reg property? interrupts? clocks?
>>
>> This is the subsystem node.  It has no other properties currently.
>
> In the example, it looks like the gpu. You also have a unit address
> which implies you need a reg property.

I'll drop the unit address.

>>>> +Required properties for Pixel Valve:
>>>> +- compatible:  Should be one of "brcm,bcm2835-pixelvalve0",
>>>> +               "brcm,bcm2835-pixelvalve1", or "brcm,bcm2835-pixelvalve2"
>>>> +- reg:         Physical base address and length of the PV's registers
>>>> +- interrupts:  The interrupt number
>>>> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>>>> +
>>>> +Required properties for HVS:
>>>> +- compatible:  Should be "brcm,bcm2835-hvs"
>>>> +- reg:         Physical base address and length of the HVS's registers
>>>> +- interrupts:  The interrupt number
>>>> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>>>> +
>>>> +Required properties for HDMI
>>>
>>> Is HDMI the only output possibility? If not, then you should have OF
>>> graph nodes describing the connection between HDMI block and HVS (or
>>> PV?).
>>
>> I'm using compatible strings for the different instances of the module:
>> brcm,bcm2835-pixelvalve0/1/2.  This lets the connections get wired up
>> cleanly and understandably within the driver.  I spent a long time
>> trying to come up with an OF graph-based implementation, and I
>> eventually gave up.
>
> I missed that before, but sorry, that's not how you should be using
> compatible strings. What was your issue with OF graph? It can be
> difficult to parse. I'd like to improve that with more common parsing
> code.

pv2 is definitely different hardware than pv0/1 (some different source
files, not just connections at hw module instantiation).  This seems to
be an obvious case for compatible strings.  I haven't looked enough into
pv0/1 to tell if they're different at a hardware level, since I haven't
added any support for the encoders using them yet.

OF graph: Doesn't appear to solve any problems that the driver has.  The
pv needs to know what kind of encoder is downstream to make choices
about its programming.  The bits in its documentation refer to encoders
by name.  I could write up a ton of DT bindings trying to generate an
abstraction so that the driver could map back to what it has today, but
it would just make the driver more obfuscated and error prone.  It's
much cleaner to let the two driver submodules talk to each other and
sort it out.

>>>> +- compatible:  Should be "brcm,bcm2835-hdmi"
>>>> +- reg:         Physical base address and length of the two register ranges
>>>> +                 ("HDMI" and "HD", in that order)
>>>> +- interrupts:  The interrupt numbers
>>>> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>>>> +- ddc:         phandle of the I2C controller used for DDC EDID probing
>>>> +- clocks:      a) hdmi: The HDMI state machine clock
>>>> +               b) pixel: The pixel clock.
>>>> +
>>>> +Optional properties for HDMI:
>>>> +- hpd-gpio:    The GPIO pin for HDMI hotplug detect (if it doesn't appear
>>>
>>> *-gpio is deprecated, so "hpd-gpios".
>>>
>>> Really, I think this and ddc should be in hdmi-connector binding node.
>>> What has been done for bindings so far is all over the map though.
>>
>> You say hpd-gpios is deprectated, but that I should use the
>> hdmi-connector binding that uses hpd-gpios.  Which one is it?  If
>> hpd-gpios deprecated, what is supposed to be used instead?
>
> No, I said "hpd-gpio" with no "s" is deprecated. In other words,
> always use -gpios whether it is 1 or more gpio.

Fixed.

> The connector part is a separate issue of the location of these
> properties. If you think about it, the gpio line and I2C bus have
> nothing to do with the HDMI node. That's different than cases of HDMI
> bridges which have a HPD signal and dedicated I2C controller. Most
> examples in the kernel have not followed this and do as you have. I
> only have a desire to have common binding and code to handle
> connectors at this point, but that is the direction I want to go.

If you come up with common code that makes driver development easier
instead of harder, I'll be interested to see.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWJ1ORAAoJELXWKTbR/J7oqbwP/irkrhcer24WYxOWh9uuukRG
RTThKfm1/PLGM9qUVafrygKRx8VUrEUU0i0bRe2ofroE7ztRl0ZpLW0iyh1/Xgyn
LBw1y9NqXaZ5JyLwB9I2n8w10psEKctF3ojWZy6HIG/CW/CncBWXwfYVrfwBrUcx
Legus8e8yLlc2OglrE/6HQ3H4Rr/IN7WZV2pmkiAs2nU+TPgG+khzo1yTRN9OTf5
hrn1XQ+ctN8uLFtsIVS+Zmw2/c2q2ToMUrd8wJbIRtSx7pGzHpxzGE7jdWypt0EG
0kafbY8rVxDjBKUI5ujE8tVwpKqRf8CA3bw5bYbmV2o38+qC8OgLSG7f+ngKFlYA
63uOLOYRfOOqhwcNrZXegVGjMaaAafwgUezCgTRy3RmS5TDAXQGqb62ktQRt5Rcp
8iVJcESjl0eZ+cjhyCHIKu6jy5W5K/99Q3qoTP3ooEz6Wfcl4xuxCskq90JgfFiH
B49+TRLx/E195dSFuOV+c3IHKVL74NOBYGa9pOM3ZTQZ4vCnzCqnPkJZMsgkiU4v
mt0FAf1h5Fcj1yf2c9Z/AhzAW1sfO2FHgH2a6mBbdOvZ0HvW3saLHF6Tjn8ehqUO
2l3zQjASepsaShehs7gMhNdsNruCHx5T8FqAm8pm0rQLDIvqeiCcOOc1kUVrBawz
L4IVTj8XFykOY6u7EpMZ
=61rV
-----END PGP SIGNATURE-----
--=-=-=--

--===============0871983795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0871983795==--
