From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCHv5] drivers/amba: add reset control to amba bus probe
Date: Wed, 28 Aug 2019 08:34:20 -0500
Message-ID: <46bcf493-9dd6-bf5b-089a-be158739a13f@kernel.org>
References: <20190826154252.22952-1-dinguyen@kernel.org>
 <30608.1566933924@turing-police>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30608.1566933924@turing-police>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux@armlinux.org.uk, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, daniel.thompson@linaro.org, linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512



On 8/27/19 2:25 PM, Valdis Kl?tnieks wrote:
> On Mon, 26 Aug 2019 10:42:52 -0500, Dinh Nguyen said:
>> The primecell controller on some SoCs, i.e. SoCFPGA, is held in
>> reset by default. Until recently, the DMA controller was brought
>> out of reset by the bootloader(i.e. U-Boot). But a recent change
>> in U-Boot, the peripherals that are not used are held in reset
>> and are left to Linux to bring them out of reset.
>> 
>> Add a mechanism for getting the reset property and de-assert the
>> primecell module from reset if found. This is a not a hard fail
>> if the reset properti is not present in the device tree node, so
>> the driver will continue to probe.
> 
> Does this DTRT for both old and new U-Boots? My naive reading of
> this patch

What is a DTRT?

> says on an old U-Boot, we end up attempting to bring it out of
> reset even though they had already been brought out.
> 

If the peripheral is already out of reset, de-asserting the reset has
no affect.

Dinh

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEoHhMeiyk5VmwVMwNGZQEC4GjKPQFAl1mgtYACgkQGZQEC4Gj
KPRKMRAArFO9bQ7FCE4oiVgO/sOLm2M/ngGD3Czi6Y8TcAbIk4EylBGVw634Gs4Z
v5vuyxShlfApBb0PqfhLOo5cXrTyMdpWOq9AQ4vEcEU2MPKN8QcyLczvEagyYcwA
ianhTLR21v1Gdfm5MHqpKrNxSrb6Nt6cWmYCXjpabLYZg0gKJnsYl2XheHIdUJ02
kD2P6sQC3mf3OC5Gou4JXZGvDMgEwLG9lHsb7YoFq6tzZW3YQvAi3HcxIZZh4J8b
jFcPR3RxxQgGwESEGDWQu2EzY/d9qStEQ9VYHl/v6QIL77S1oXUAXLbh3e6ZoSgt
M93eK2G9wGCL5JlUbHXQ402OfewHchgQW1bDpjkaZLL+d9jUiGLqALAj0Az2FqX1
HtPPtifB4z6TuaLkxNTZ1Oz7UR0cWtKeSYjsuIwi0XzQMXopgH7oKdzJajNlAfRJ
In6fSVuwp47p43wj2dmUtuCSYvzKTHAg/sVGaufEfsT8ZINSOZJY9ivDqkJIzlDR
nsOclhfOGs5PgL4NPFW5U5O58DzZ5yl9NEotB4ahacuOqJv1PUdT3gABbL5hUogx
QTAPNREbYesG3osFLeEXeachiNChyJ7r+NyWFly7RXA/ukxoer2Rkxt3h0hQib6Q
/jhAsa1ar1NEk8dJJfNO7R5pZkG7ZCbhzuSDKPB2yRZPDeQGol8=
=SFzc
-----END PGP SIGNATURE-----
