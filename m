From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: dwc3: description of incr burst type
Date: Tue, 02 Oct 2018 10:40:56 +0300
Message-ID: <877ej0aj93.fsf@linux.intel.com>
References: <1532341959-3478-1-git-send-email-pengbo.mu@nxp.com> <1532341959-3478-3-git-send-email-pengbo.mu@nxp.com> <20180724232018.GA16709@rob-hp-laptop> <CADRPPNQQE1ESJ5WkMxySstxpaQir-w5XOdiwDe3qTTQ_cim5Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADRPPNQQE1ESJ5WkMxySstxpaQir-w5XOdiwDe3qTTQ_cim5Xw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb-owner@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc: pengbo.mu@nxp.com, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkml <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

linux-usb-owner@vger.kernel.org writes:

> On Tue, Jul 24, 2018 at 6:23 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Jul 23, 2018 at 06:32:38PM +0800, Pengbo Mu wrote:
>> > Add description of 'snps,incr-burst-type-adjustment' to binding
>> > so that configuring devicetree.
>> >
>> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
>> > Signed-off-by: Pengbo Mu <pengbo.mu@nxp.com>
>> > ---
>> >  Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>
> Hi Felipe,
>
> What do you think about this patch?  The patch title prefix should be
> updated from "arm64: dts: dwc3" to "dt-bindings: usb: dwc3" though.

Can you resend the series so I can apply?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAluzIQgACgkQzL64meEa
mQbSEhAAvdDwFI5j5rxxGGRDAllP9Ha9nEOuuG84KjiEX6bBTQGhHX4aDoPwQ4to
AT7dX97D2359hVXnkPzhHDV2f5jKSfkrFhiufUft2zREYX+J7aPeQcGsX79oXKQo
ivoumKniaKjowRJy7easI++FKmDFKID9WBvDQ7nedDrwO5jxw+I9WqNO1vdfRGOe
yWIgtCMIWYGvDV3WacRBSi3tPOunehQ4RKm+sQYIpLU309eg858YK2ACJi3uFGOL
+pKHC2GpGguUHDufMLJeGjF97y5lSUXRjUlfA8aebr3/i6Sl1KFb3X2zZ7KsS6fk
HTW7YYNjm1+jWVRGe72Sd/sAzAG1UOQJNnJ80Aj/PGjk9Q1dz5tVE8TA//CPHRFQ
M+JBobt4HxI0XVwumUrsOEODwbzjmgoK+J5J99tTb4Qb+nMhfFsBPa2OfSPGIyIu
J/jSheTa8LWSHF6W9lDa9iEqS9vHGzdlRmLvdx6OTw52x6SZXkrm4ZS9IpBLF95p
yMZmQDcXF/mHp2WfyUEDWbkenpDyj27svwcNW66vtX3eYiEtzAXeqKTS8XK1AMFY
NZP1AnDtjNg2K2i+kgFQspvnxM2TxpB17aEgv9vJmQS7pLLxGwk1yYszbL7/iW3F
iGs1kyGJLvHQHhgUIIRozuhaytLts61tnJUR093dLQOsSHgDNe4=
=m67N
-----END PGP SIGNATURE-----
--=-=-=--
