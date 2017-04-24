From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1374: Add trickle charger device tree binding
Date: Mon, 24 Apr 2017 14:28:35 -0700
Message-ID: <20170424212835.GA24096@tyrael.amer.corp.natinst.com>
References: <1492468810-17224-1-git-send-email-mdf@kernel.org>
 <20170420155634.gs7qkufw7j4mfqpx@rob-hp-laptop>
 <20170420172538.GA13892@tyrael.amer.corp.natinst.com>
 <CAAtXAHfNuRXninLWySAOdtV99ih4PBt=JPszn3UkNa08OvXLFQ@mail.gmail.com>
 <20170424171639.6vv5hxrejylloh3b@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <rtc-linux+bncBAABBBW47HDQKGQEKJQ65OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170424171639.6vv5hxrejylloh3b-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rtc-linux <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Alex,

On Mon, Apr 24, 2017 at 07:16:39PM +0200, Alexandre Belloni wrote:

> I think I would do something with MFD as you were suggesting on IRC. You
> can have a look at the flexcom driver (atmel-flexcom.c) which is simply
> selecting a mode and then using whatever IP driver already existed
> (UART, I2C or SPI).

That's an interesting approach, so the idea is to basically use the MFD
to switch an existing driver one way or another via pdata? That could work.

> 
> I didn't have a close look but maybe that fits. Then, as you are
> concerned wtih backward compatibility, you could enforce the mode from
> the MFD driver, depending on the CONFIG_RTC_DRV_DS1374_WDT value.

This is where I'm currently at:

https://git.kernel.org/pub/scm/linux/kernel/git/mdf/linux.git/log/?h=wip/mfd-ds1374-rfc

Still a WIP, maybe can get out a patchset by the end of the week ...

Thanks,
Moritz

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJY/m4BAAoJEL5CEHepFqovSesIAI2GEJFD0AZkimJRrMJ7UEFG
tdM0SLlrNj1iBf3o9hIFerAKC7sB+Xgx9IWAGK4ijgkegP4rRvk6q23eCjeBz1Mb
T3p/cgfKjVMmmZDGmHCgVmrqjtPfB+WWKMLun6K4AxdJK3Ipcdvlh70z7yk4NqFh
G1Xw4ZXWx3XF9k8g3MIKVT66+uyY7uLDfOdSWeCEcbCl3U7o6rF6wm4KQyHMGmkN
9AFr//ZadgADwy+JBqftSyX3p4Jn+uUP5KEn8hJ5IV29qeY8tqEwtSUaukwzMIEc
IwtFWNe7Qkh9+snApI0i9yPEPucgO0Mxnt98KFkSwW2WkaPrPINfExIh965YEKY=
=UdI7
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
