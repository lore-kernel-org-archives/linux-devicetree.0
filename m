From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Fri, 4 May 2018 07:16:00 +0200
Message-ID: <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org> <20180424163458.11947-5-johan@kernel.org> <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com> <20180426091018.GU4615@localhost> <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com> <20180502081637.GE2285@localhost> <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com> <20180503205037.7be552c1@aktux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: multipart/signed; boundary="Apple-Mail=_616FFBD6-319C-45AC-80B9-58545B949B9C"; protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180503205037.7be552c1@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_616FFBD6-319C-45AC-80B9-58545B949B9C
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hi Andreas,

> Am 03.05.2018 um 20:50 schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> On Thu, 3 May 2018 11:35:21 +0200
> H. Nikolaus Schaller <hns@goldelico.com> wrote:
> 
> 
>> I have realized that the w2sg0004 is an exception (although a Sirf chip)
>> that it does not provide a WAKEUP signal. And another significant
>> difference is that we have to keep the serdev UART enabled even if there
>> is no user-space client. Otherwise we are not able to detect unexpected
>> activity. So we unfortunately can't move serdev open/close into the .open
>> and .close ops but need to open it in probe.
>> 
> how much power does it use to keep the uart enabled? Or should it
> better be reprogrammed as gpio?

I think it does not need much more (if at all) than a gpio controller on
the OMAP3 chip (I think the clocks are active anyways for use by the other
UARTs).

We had proposed years ago to reprogram the UART RX pin by pinmux-states
into an interrupt gpio but that was rejected because it was not general
enough and ugly in the device tree (an rx-gpios record where the rx-line
is already connected to the UART-rx).

Then we did experiment with tapping the UART driver and finally the
serdev API was developed to solve this problem. Hence we use it now this
way.

BR and thanks,
Nikolaus



--Apple-Mail=_616FFBD6-319C-45AC-80B9-58545B949B9C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJa6+yRAAoJEIl79TGLgAm6n9MP/ioJJNtWTpXLVcDKETg7CFxN
FirfrzbJU07z3SwTU9fPtf8VcC6Uu6835f+1LYUXS8QmYGGwZRSH2miwSQKfYwgy
TmEnDjNph5HfS8EP8ONnL6fcYndYsDyxdhqZ9joi6sjUyRriCjDIjtimZY9vddCW
XnRm/N92wIKxFoReCJXNOJxtGZ7Ashi0hIVW67o0d1EGbqyttdnzPWRo9BGw6/JU
4+HmgnW5JB8lX0Q5fk8BTni0h2GEWM3KVfqs8jtwKxehTixi7E2h5XfWTtl4swBY
Cp250gAZZTlo1QfFSOwS0B58AVO8fecL92zuC2C2tvwtpGZqnQ8UmtoMf3rgR4eo
Q+Ph6QVFrez0LdI+hOBvQzcAwX6k4rs3BwDYT5X4ZXRImYco2IJc6TwzEGBSp5vP
Arkwm5atWHqCU0qVCzmeAuiUEVb47vYMSQ9fUKYnu1e87NVgpMLP91CQ7xGnuFgw
9pNhsIpD+jS2l98/WP8jo9a9BywhvwniyVotWXKVSXC9+9zNUVMDfmE0vKZNWiX5
YD2vu0kcS7FH0E1te7BdbRUZVzVCl9w/tfBQfbqH0YqMulREEALb5GEBO38VqZDg
ExUg45Xu8/b1PjtJf4vUBVSBOGDP9VtF2XTCWUWtIu/Qs/9tZTlAUTdGRy69igAR
v+HkIxWuv2aCoTPh9jOK
=IwUu
-----END PGP SIGNATURE-----

--Apple-Mail=_616FFBD6-319C-45AC-80B9-58545B949B9C--
