From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/1] Platform driver support for 'amd5536udc' driver
Date: Mon, 16 Jan 2017 15:51:46 +0200
Message-ID: <87tw8zkt8t.fsf@linux.intel.com>
References: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com> <1861880.7pouM4E6RB@wuerfel> <CAEHZuqNK07Xku9SmFhV0DJ4apV0m8yWznuFDwjr33CDP_OcXew@mail.gmail.com> <6422487.mhqDBHHcCr@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6422487.mhqDBHHcCr@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> On Friday, January 6, 2017 12:29:12 PM CET Raviteja Garimella wrote:
>> Hi Arnd,
>>=20
>> On Fri, Jan 6, 2017 at 3:33 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Thursday, January 5, 2017 1:53:16 PM CET Raviteja Garimella wrote:
>> >> The UDC is based on Synopsys Designware core USB (2.0) Device control=
ler
>> >> IP.
>> > ...
>> >> This is a request for comments from maintainers/others regarding appr=
oach
>> >> on whether to have 2 different drivers (one each for AMD and Broadcom)
>> >> with a common library (3 files in total), or have a single driver like
>> >> it's done in this patch and have the driver filename changed to some
>> >> common name based on ther underlying IP, like snps_udc.c.
>> >
>> > I have not looked at the code at all, so sorry for my ignorance, but
>> > isn't the IP block you describe the one that drivers/usb/dwc2/ is for?
>> > Could you add support for the Broadcom hardware there instead?
>>=20
>> The current driver I submitted is for a different Synopsys IP (USB
>> Device Controller IP,
>> not the HS OTG). It's confirmed by John Youn (from Synopsys) earlier.
>>=20
>
> Ok, sounds fine the. I'd suggest taking the current driver than and
> splitting out the pci_driver front-end into a separate module that
> calls exported symbols of the main driver, with the new platform
> driver in a third file that also calls the same exported symbols.

right, that's the best idea.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlh8z/IACgkQzL64meEa
mQaiehAAjFFCEkGZOqj2EdJEG7FVEvrOfzfx2ylzXZkzgafkIeg/O8HRgD3YrX4/
qq7bhoZXQnjpVNe3AxuY/HDDJjgI7FiBeJ/zrR/Bbgds0+6eJbCttl9jhWvZEB+G
1ggHOqCI+B6c7yfrK0fCTWSxI15e2CqPrtFptLaG5jW8gaZw+3s5flRTfxIy4e7/
mEF4n9RW1hvqMbZRx8q+sJwLCCU1dI9vWdYJRgKZ8aiB8SLQyCVj5KA3rwDZOCj6
fnYBVn7G842Qdr1ATr8UT2BeTXXuU7H95oi4zNTq4/bWMnhvCD703tC7IwowTEwC
EZaRvHReYwpxym5lquGRbPEdoOlEy+lGOQ693fhkanOc3TPhT+vcDITm9w0hC5wb
2KWgHrVHkuB6DyLdjk6xczaIM4+zEh1F49juAshuNoJv8SESOHfobzYTMgWxD/U5
y4iQJYhW7+E+swlcv7mzo3o135xigEITA9iRztG6VZY+Cfz1KwSk30nPpD3/3I9o
LnBL3EjwTsaa7Dy5sphQ5zzXA8Xb3D9Os0uGNjNqhijWSIWMo+HobGUmbr5udNiL
KUUOC/flS+I9p6LcT+Z39HD6iR4SUUS9DmsnRQ3uf2RlUKSRTQ8keh4LfL91yi/I
2f58EHuv0KkCBxwroIhATWUXv2vWQq3KIwibJvWtUI/qi4usj5E=
=vD8k
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
