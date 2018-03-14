From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
Date: Wed, 14 Mar 2018 10:06:51 +0100
Message-ID: <20180314090651.GA16424@w540>
References: <1520951425-13843-1-git-send-email-jacopo+renesas@jmondi.org>
 <CGME20180313143056epcas4p28ad52892b943d0800c6f77337a40f5f0@epcas4p2.samsung.com>
 <1520951425-13843-2-git-send-email-jacopo+renesas@jmondi.org>
 <ebe90ad4-60f4-4ac1-c337-df840b754d53@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483399065=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ebe90ad4-60f4-4ac1-c337-df840b754d53@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sergei.shtylyov@cogentembedded.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org


--===============1483399065==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Andrzej,
    sorry for the mess :(

On Wed, Mar 14, 2018 at 09:15:42AM +0100, Andrzej Hajda wrote:
> On 13.03.2018 15:30, Jacopo Mondi wrote:
> > Document Thine THC63LVD1024 LVDS decoder device tree bindings.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/display/bridge/thine,thc63lvd1024.txt | 63 ++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > new file mode 100644
> > index 0000000..5b5afcd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > @@ -0,0 +1,63 @@
> > +Thine Electronics THC63LVD1024 LVDS decoder
> > +-------------------------------------------
> > +
> > +The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS streams
> > +to parallel data outputs. The chip supports single/dual input/output modes,
> > +handling up to two two input LVDS stream and up to two digital CMOS/TTL outputs.
> > +
> > +Required properties:
> > +- compatible: Shall be "thine,thc63lvd1024",
> > +
> > +Optional properties:
> > +- vcc-supply: Power supply for TTL output and digital circuitry
> > +- cvcc-supply: Power supply for TTL CLOCKOUT signal
> > +- lvcc-supply: Power supply for LVDS inputs
> > +- pvcc-supply: Power supply for PLL circuitry
>
> I wonder if it wouldn't be better to make them required (at least VCC) -
> it is closer to reality.

In cases like our Eagle board, where VCC is directly connected to the
powering rail and not through a controllable regulator, I feel like
making this mandatory requires more effort (not much, I agree, just a
"fixed-regulator" more) with no additional benefits.

But I understand your point, and I'm open to whatever fits better with
the already existing DRM bridges bindings

>
> > +- pwnd-gpios: Power down GPIO signal. Active low.
>
> As I said before, specs[1] says about "/PDWN" pin. Is it your typo, or
> different docs?

I didn't notice the typo in first review, and I thought you were referring to
the initial '/' which I found weird to be part of the gpio name... Then I now
realized I badly typed in "pwnd" in place of "pwdn", which is not even correct
because it has to be "pdwn"... Sorry about this mess, I will fix in v4

> Moreover there are already bindings for THC63LVDM83D with the same
> dichotomy [2].

Seems like this is 'wrong' as well.. The chip manual says the pin is
named "pdwn" here too..

>
> Out of curiosity I have googled for "pwnd pin" and it looks like some
> vendors use this form.
> For me both forms are quite misleading: power down signal, active low,
> why they couldn't call it just 'enable, active high'.
>

It's not much the actual physical active level that bugs me, but the fact
that the GPIO name defines if it has to be set to "active" or
"inactive" logical state in enable/disable routines that I don't
like..

> [1]: http://www.thine.co.jp/files/topics/179_ext_12_0.pdf
> [2]:
> https://elixir.bootlin.com/linux/v4.16-rc5/source/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
>
> > +- oe-gpios: Output enable GPIO signal. Active high.
> > +
> > +The THC63LVD1024 video port connections are modeled according
> > +to OF graph bindings specified by Documentation/devicetree/bindings/graph.txt
> > +
> > +Required video port nodes:
> > +- Port@0: First LVDS input port
> > +- Port@2: First digital CMOS/TTL parallel output
> > +
> > +Optional video port nodes:
> > +- Port@1: Second LVDS input port
> > +- Port@3: Second digital CMOS/TTL parallel output
> > +
> > +Example:
> > +--------
> > +
> > +	thc63lvd1024: lvds-decoder {
> > +		compatible = "thine,thc63lvd1024";
> > +
> > +		vcc-supply = <&reg_lvds_vcc>;
> > +		lvcc-supply = <&reg_lvds_lvcc>;
> > +
> > +		pwdn-gpio = <&gpio4 15 GPIO_ACTIVE_LOW>;
> And here another variation :), should be pdwn-gpios.

Next time it will be "pndw".. Is there a prize if I do insert all
permutations of the same name in a single bindings document? :)

Will fix this shortly.

Thanks
   j

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaqOYqAAoJEHI0Bo8WoVY8GP4QAKDluTlTAksCMNmVXBO81W3g
bBog7F/RM5yEi4OFBqtutwxB8v48kNQufDC/Twm/JPo1hf1H6vSvEwTr+52PK/Nd
nnLpd5eJ0kvklDPQ1vAKt45hvYl6zm933VmxBmncBrUgHnjUqcbhovMUh7+NGDHB
KIJgqAbeTpSdkVwg5j7vHXrVBpW5i2kmIXKYPwIfhcqh3eDbXbwauTSSjx9N3PSk
x5FVke3zQLDYKpsLDLlYJIhKPGDCN/xA/tB6Uu7wdccwTYg/9auwvU+et5JIe8U6
NIURFNOWuRToSZc3MmG6j1NNaAN04TTGtWvr4H1UAeYpBq+gdOp7h1de3pzDlsvF
nsnrYzwYIYpzT0zuOziw7V3bd9cEH7wbPyTSYrddZeow7yOnMSs1A1T5Fuennmie
/3dG+z/2gbDe6m+NIgHifHjN9dUfoqwXr0WcqpsKHIKutrfN8ghRstj+Jy+PlGBl
BN/NvpRT3RhfFF/5h+Ni8hdXmEWTzOliPdRRMBszOqjWviQ9Qet2MJM8OPt1ndZl
9sIlkUW3wKf20XikQ2BL/48XRzHW7ExY8q4YzsqRNyykLRjmAc3+0aZlR6Ydq8ii
AM9ZCVVF/Zo8I0w5Zw9wXWWFdj3oBhI7PEdBlZBpjq9HKOZcfk2I6wAPJjdPRfSR
a9OCv9YCR+2cnk/1y3OH
=Mghv
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============1483399065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1483399065==--
