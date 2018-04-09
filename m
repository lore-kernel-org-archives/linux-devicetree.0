Return-Path: <SRS0=o6D7=G6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:62177 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751875AbeDIHlX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Apr 2018 03:41:23 -0400
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Add clock support
In-Reply-To: <1522736887-17079-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1522736887-17079-1-git-send-email-shubhrajyoti.datta@gmail.com>
Date: Mon, 09 Apr 2018 10:40:33 +0300
Message-ID: <87muycn7ym.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
To: shubhrajyoti.datta@gmail.com, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, michal.simek@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

shubhrajyoti.datta@gmail.com writes:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Currently the driver depends on the  bootloader to enable the clocks.
> Add support for clocking. The patch enables the clock at  probe and
> disables them at remove.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

which platform uses this? Isn't zynq using the chipidea core? Why don't
you switch this board to the generic chipidea driver instead?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlrLGPEACgkQzL64meEa
mQb2mw/9Fg0v4cb/TtKwQAu9R+ROzR3ZI3Ih/Y7xEY5ErkcEAh19NUD7pjoVArgI
9EFZweSaM2PDbBs9PT3KgSDJqrHUrfqpUomAHV944iclfugGn83czrKvqvmtCuQE
uMiUZNJxuG812G81TLUpkXWjvGlipvRzekE0Emk8XssFQxrM6tGL0kp5YFNS9WE+
RniXohWdxjGNeU1XKIEfwrjMpAPIHgZu7VVjZ8cCjwX+h6wk5gPVAFKE8k8NRrg/
PfEHzZmw45o1ngDTdLVTMiECB9ihGf703EfKHi/lu+sJZBKcRrk9oKa8neExHq0l
A89n2RHDAMEwmyLCnEhFkT5Tq7OiQzqvh+AFWc4EoOdlFSOVV4a6+yh7hM4/Vups
Hq//YECRNpGJszHL3jThj2u9+vKXTCZl0ECzaVpOmiV0aFvYbBrIO+YfkqREpgcv
n+J02uTLpCBwsLPCBjCEIDQd3t9t4DF5gOFdBe9J29nuYkW+/IGOtFz05zfSMEXt
28lVkfJtZ7xWzLJd2MnWJJ4s+eGHuXzmqMlAJGtINDWP85DvhPG/ifx+qWd0D/eZ
KbS6uhO8qXz70Tmq78hP56jSPpYIOPX0rGWcQ1Zg0b9Y3Bg+BuC00AJc4VnPCULQ
OUESf7fA7XVK5DvmbkErWp30cxC79rVK93wrdGShVP6bZfWywt0=
=OWCg
-----END PGP SIGNATURE-----
--=-=-=--
