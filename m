From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 03 Mar 2015 11:28:09 -0800
Message-ID: <87vbih98za.fsf@eliezer.anholt.net>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150303080550.GF6976@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Mon, 02 Mar 2015, Eric Anholt wrote:
>
>> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>>=20
>> v2: Split into a separate patch for submitting to the devicetree list.
>
> When you say that you've split them, do you mean each DT doc, as I
> don't think this is the way to go.  I'm happy to listen to other
> people's opinions, but I think all of the .../mailbox/brcm,bcm2835-
> files should be amalgamated.

I just meant that I split this patch out of the patch that followed
(because of review feeback and
Documentation/devicetree/bindings/submitting-patches.txt rules).

>> ---
>>  .../devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt | 19 ++++++++++++=
+++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm28=
35-mbox.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox=
.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>> new file mode 100644
>> index 0000000..f5741a0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
>
> Rename these files to conform to the current naming convention.  In
> -next we currently have 'altera-mailbox.txt' and 'omap-mailbox.txt',
> so 'bcm2835-mbox.txt' seems appropriate.

Will do.

>> @@ -0,0 +1,19 @@
>> +Broadcom BCM2835 VideoCore mailbox IPC
>> +
>> +Required properties:
>> +
>> +- compatible : Should be "brcm,bcm2835-mbox"
>> +- reg : Specifies base physical address and size of the registers.
>> +- interrupts : The interrupt number. See
>> +  bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
>> +- #mbox-cells : Specifies the number of cells needed to encode a
>> +  mailbox channel. The value shall be 1.
>
> Binding documents are much easier to read if the property names and
> descriptions are seperated with tabs.
>
> - compatible		: Should be "brcm,bcm2835-mbox"
> - reg			: Specifies base physical address and size of the registers
> - interrupts 		: The interrupt number
> 			  [See ../interrupt-controller/brcm,bcm2835-armctrl-ic.txt]
> - #mbox-cells		: Specifies the number of cells needed to encode a
> 			  mailbox channel. The value shall be 1
>
> ... don't you think?  Also notice the consistency of no '.'s and the
> bracketing of the [See ...] statement.

The tree seems inconsistent on formatting of these files, but I like
your suggestion for nicer formatting so I'll do it.

>> +Example:
>> +
>> +mailbox: mailbox@7e00b800 {
>> +	compatible =3D "brcm,bcm2835-mbox";
>> +	reg =3D <0x7e00b880 0x40>;
>> +	interrupts =3D <0 1>;
>> +	#mbox-cells =3D <1>;
>> +};
>
> It would be good to see the client examples here as well.  Please consider
> pulling in brcm,bcm2835-mbox-power.txt and brcm,bcm2835-mbox-property.txt.

Oh, so have those two just smashed into this file as one set of
documentation for everything to do with mailbox on bcm2835?  That seems
good to me.  When I was adding the client drivers, the fact that the
other brcm file was named after the compatible string made me generate
new files under then new compatible strings, but the other drivers
already in the tree obviously aren't formatted that way.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJU9gtJAAoJELXWKTbR/J7oljcQAKeg1ALWLt/9c9inb5dI3BEj
qYdKlvLWCbFiRG5vuwW/evTh+8C4ySfaUKGcp/aPu5RiWV6qSrFHRnzTYLZQpIUH
pf8ToFOi/VT11qH7PVmEsvSmUw5/5TLD5K7I0VV/EZo/i9sHj8dJ1z82Q/J1BDPV
ZyxPPR3KtR3cfiAJu6yqEAVZuOWR3nBh4La2J3TnfCi4wTEwxpT8mnK/c2TnH3GT
L5XCKSkA+eTWXqrT0+/Hxep3ZzMxQb8xr541NoAFx2LOdN5/jcquGp2zAJzhAZRy
0jALSos5oBvo4TUZeaPAwn9P9r+MffI0fsbN8mvtlGMtjt104n85bZ/L4RsiaS1g
sWsQm4ZWIHgW4PqaPgCHwLNl7doLlubjW1n5fFJB2cmboHeZB/t1nzEGumRuHpxS
mhd2ZE1tdwlxUYVBxXPTdpXoGn3vsDwBRq5ti4Rw+jRen4H/uVePjQ8FvAPNgEtE
EvWN7ssvVLst0AdGJw+bFz6roXWkumOp4g9keYAjJNITXN6MrPmCk/J/MKChQ2tE
odJ9whbESoA0lpxoijMOgfvL9jOS4E0gmheWcML2mqRnlmqW1qIK5vY/P8el+B6I
WxXqA/MMzYQ5kWH1fTULl8qbEP+aa0hwc4NSGrs4kNQ9Ch2EyN6y0sblO6iZRYkK
6HOxjR+RQXD4WU/6HsnL
=hu5L
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
