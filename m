From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Synopsys USB 2.0 Device Controller (UDC) Driver
Date: Thu, 01 Dec 2016 10:53:58 +0200
Message-ID: <87eg1sm3mh.fsf@linux.intel.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com> <1480485910-7797-3-git-send-email-raviteja.garimella@broadcom.com> <874m2pntdh.fsf@linux.intel.com> <CAEHZuqNgDwJL7HCP18R_M8TZcW-mENQsfyChv0_Zmm4M2ZTOkg@mail.gmail.com> <87k2blm8yx.fsf@linux.intel.com> <7de6b970-c88c-b277-eaae-d9c0067b590f@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7de6b970-c88c-b277-eaae-d9c0067b590f-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> On 11/30/2016 4:47 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
>>> Hi Balbi,
>>>
>>> On Wed, Nov 30, 2016 at 4:10 PM, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
>>>>> This is driver for Synopsys Designware Cores USB Device
>>>>> Controller (UDC) Subsystem with the AMBA Advanced High-Performance
>>>>> Bus (AHB). This driver works with Synopsys UDC20 products.
>>>>>
>>>>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>>
>>>> use drivers/usb/dwc2 instead of duplicating it.
>>>
>>> The ones we have in drivers/usb/dwc2 is for Designware high speed OTG
>>> controller IP. The one that I submitted for review is for USB Device
>>> controller IP (UDC). The IPs are different.
>>=20
>> I'll wait for John's confirmation that this really isn't compatible with
>> dwc2. John?
>>=20
>
> Hi Felipe,
>
> This is our older UDC IP, not compatible with HSOTG.
>
> It is also no longer supported by Synopsys and considered EOL.

Is it the same one used by amd5536udc.c? If it is, then it's much better
to refactor that driver so it can be used as a library of sorts by PCI
and non-PCI systems. We really don't want duplicated drivers upstream.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg/5SYACgkQzL64meEa
mQaWXw/+M9PdbI6FRerNsNVzk6w8aDfrV69iJy/TmUmZ6VlYnjsetGsEvbbYrR94
OdQvt+BvZ2TueQGj+0hLkItG2ESNePLVAIa6+JhgUrY2KBDmY+VTGFljjFOUWRF5
qqvdIHsHEP0+AHZxmYt6tEs9RYWDQaXMkrnZ8ZEj/9foEDl3ws++24agabsnThYO
d+QW/OSdnqMphkhwAGQ7IGnvTia7+ipL/dVNSWmpu38vOYMbCWjUXYDkPwqeT+yz
yP3mu1kcQ1B6fMUImdpCinpHrwIWFs1wiFqturXDR2jtB37iweav6uFXVmYCpZB0
Hhc253iIAVh21ps+YxquPY8b2kF7nfoFQKpQuqVuZKziaTfMN/Y2kV/bhDg/PyKe
8E+q1rvXy8G5qc3jx6s2al0/NPqwSh0P+y2rR3uyy/jBvCrCNCGJ2iKw9WXBiX7V
yWYFM5VYA1FsLUqsmwFiC6shnNzRr0X9oCCn7td0X6HYQgftGYVbJeKhg8ySGvEu
jcG+wM1MMwAT/dz8RD+m3xXwBllDQ7Pp4JZr8sGlUgxf/+WyF2apje2MWtISuxfe
sRSad0msoMVAel7uZZghg8SfHorCJZ8Ab0/ea8eMytDEqOFARnLsbP6PnopVdeSm
poSfRq+QOcLifWTFk2X+q88d01d2ug3kh00/50G2JQalt7gyGDI=
=mIYw
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
