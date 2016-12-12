From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: usb:xhci: support disable usb2 LPM Remote Wakeup
Date: Mon, 12 Dec 2016 10:37:58 +0200
Message-ID: <87lgvliluh.fsf@linux.intel.com>
References: <1480855321-5047-1-git-send-email-tqnguyen@apm.com> <20161209213629.76ixdmr24ln72uaw@rob-hp-laptop> <CAKrQpStd4+ZZjdYyq93zq-wnqQCiQmSi5jJrYbuiZX5kVH74YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKrQpStd4+ZZjdYyq93zq-wnqQCiQmSi5jJrYbuiZX5kVH74YA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Vu Nguyen <vnguyen-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

"Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org> writes:
> On Sat, Dec 10, 2016 at 4:36 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Sun, Dec 04, 2016 at 07:42:01PM +0700, Thang Q. Nguyen wrote:
>>> From: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
>>>
>>> As per USB 2.0 link power management addendum ECN, table 1-2, page 4,
>>> device or host initiated via resume signaling; device-initiated resumes
>>> can be optionally enabled/disabled by software. This patch adds support
>>> to control enabling the USB2 RWE feature via DT/ACPI attribute.
>>>
>>> Signed-off-by: Vu Nguyen <vnguyen-qTEPVZfXA3Y@public.gmane.org>
>>> Signed-off-by: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>>>  drivers/usb/host/xhci-plat.c                       | 3 +++
>>>  drivers/usb/host/xhci.c                            | 5 ++++-
>>>  drivers/usb/host/xhci.h                            | 1 +
>>>  4 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Docum=
entation/devicetree/bindings/usb/usb-xhci.txt
>>> index 966885c..9b4cd14 100644
>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>> @@ -25,6 +25,7 @@ Required properties:
>>>
>>>  Optional properties:
>>>    - clocks: reference to a clock
>>> +  - usb2-rwe-disable: disable USB2 LPM Remote Wakeup capable
>>
>> Remote wakeup has been around since USB 1.0 days. Does this need to be
>> USB2 or XHCI specific?
> This is XHCI specific. Per XHCI specification 1.1, remote wakeup is
> optional for XHCI 1.0 and required for XHCI 1.1. This patch provides
> ability for software to disable RWE for USB2 in XHCI1.0 controller.

is there no way of detecting this in runtime?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhOYeYACgkQzL64meEa
mQaqcA/8DT8Tf3F48nxzybiqVlMCQv/gr3rcyrfjNCg1lYD5oZSVe+1rjrhBbgH1
uAMvjvL71ujaFpITWX5ONCsTbN6+7M10o6QsoZAYTGdbq0IA5hsz726wRwIIbz2V
EA7jG41VpgQQanjA3B+khRmOT8MAPniZor63ufPtQSLa1PGtsUsbbzNuudEH4i9U
JffCXtCI7wzUoZbwiEBafIKKtrUHl0v7Zwl63uwA18pkAhUAJ4m6AP/C1zEc5UpJ
YJTwaBBe/0UGUY8eeG9Sg+aMzqMFgNE7S8u4gHOGhP763LuHTg3RhnHL/BCsd7fN
2E5oTMuRfoVpMIG50a5hfW7DZapAO7dbrKXBiCXkl3a/5PpZGPmAs0AtvdVFDWbh
HzRo8w487m+49qBrndamFjdUTJyUoEciMJRhhEYoedZXiCU+BTd1/CDpWGU3B+Wm
LVS6TVx34FD9hmi8DFcI1MmgEP8kCXewfbdixwQkwvs96WVrOHNsBp37DUs/iPPd
L+Tb03dlXdPnec9MpIfOJHOER0tpJ9KwaI74zto71mIvG4CUPDEQj2U0WA1CUE80
SZ38kBeW9+dHJG30oBGyXlvWowSqyoTSP+8+qV8PQLzJgdTGVoIxT3Gj9/zRpitZ
FmJ8+8IY7bcB3KrDYmyiO5H8AejZsP5MBeUwZ5vp6PV/CCtBgZQ=
=dw59
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
