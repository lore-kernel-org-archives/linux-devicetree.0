From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Synopsys USB 2.0 Device Controller (UDC) Driver
Date: Wed, 30 Nov 2016 14:46:14 +0200
Message-ID: <87k2blm8yx.fsf@linux.intel.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com> <1480485910-7797-3-git-send-email-raviteja.garimella@broadcom.com> <874m2pntdh.fsf@linux.intel.com> <CAEHZuqNgDwJL7HCP18R_M8TZcW-mENQsfyChv0_Zmm4M2ZTOkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEHZuqNgDwJL7HCP18R_M8TZcW-mENQsfyChv0_Zmm4M2ZTOkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
> Hi Balbi,
>
> On Wed, Nov 30, 2016 at 4:10 PM, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> Hi,
>>
>> Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:
>>> This is driver for Synopsys Designware Cores USB Device
>>> Controller (UDC) Subsystem with the AMBA Advanced High-Performance
>>> Bus (AHB). This driver works with Synopsys UDC20 products.
>>>
>>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> use drivers/usb/dwc2 instead of duplicating it.
>
> The ones we have in drivers/usb/dwc2 is for Designware high speed OTG
> controller IP. The one that I submitted for review is for USB Device
> controller IP (UDC). The IPs are different.

I'll wait for John's confirmation that this really isn't compatible with
dwc2. John?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg+yhYACgkQzL64meEa
mQZNXQ/9Gw/ZlOVIPgo2CF+AHZy073KSuRO14/S6JHBQ9aoQdyAlwyA5wqE7dmCq
4Q1B0sUWKnWfQ5vGng8L7llGr3g428kM5GfkVAdqF2KSfqlf7RdLcBkmoBO2eCPc
Z3jwy07jxG4gNuv22Y84O39v1R42X0nIYKf/M/59A+DvwG9ji/lPhGmli21kyOiJ
wzHnWCcsPTQyh2972aKws6wmV1pCkwXP2zwqp4C8JIK+vw9CrIR0paB6+oYG9VK5
os/cnctgdDDyr8IXV8TRK7RyEOrlhWLOyLtzkpT4GusF6STwbfVDhAnBFhjAfHcr
uFpzxDQWvXCk0FC+fgjGF33e+HyPLpz4DtUvMVtVUF9eZcP25Ft92ATZtdftm+/h
kOhE+5hl4ndxPxg3ydv4bxU1Y7DlvVJo7ZxFPWHSd0rFdpp+a/H7xx8ZE3zvTc42
qRquoGyPz4Ok1ByfHFZdxveY8q5upWMr9n7SIg5k6y6qU3rkjbar091TTG4NRDah
PSRUJlprwVr0XnS+Hjc9ijTzRc0ROd4ngC3/vEnWs0Zyk9/Pkxw3jxuHiKJDPiXr
o9eBdnhNBdnQXRFg+fphdiZ8LlkjHiG+AvqUar0dKrCr8oMUIGZuVm9UU67M7xko
dYzZSp8UpmOgJaSrACubx5BrVww4iIEA+6nHwS05wZXEp2D/g/0=
=qW/9
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
