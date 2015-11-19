From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: doc: dwc3-xilinx: Add devicetree bindings
Date: Wed, 18 Nov 2015 22:59:48 -0600
Message-ID: <87r3jmfut7.fsf@saruman.tx.rr.com>
References: <1447851031-16241-1-git-send-email-sbhatta@xilinx.com> <20151118225331.GA22325@rob-hp-laptop> <87ziyagbc2.fsf@saruman.tx.rr.com> <CAL_JsqKE6f8DwvJQok=JGuzj5=9g8vrwY+wscLJkhFaG4229Mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKE6f8DwvJQok=JGuzj5=9g8vrwY+wscLJkhFaG4229Mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Wed, Nov 18, 2015 at 5:02 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>>
>> Hi,
>>
>> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>> On Wed, Nov 18, 2015 at 06:20:31PM +0530, Subbaraya Sundeep Bhatta wrot=
e:
>>>> This patch adds binding doc for Xilinx DWC3 glue driver.
>>>>
>>>> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>
>>> I really dislike how the DWC3 binding has been done. The sub-node here
>>> is pointless. The only thing the outer node does is add clocks which
>>> should simply be part of the DWC3 node. Presumably the IP block needs
>>> some clocks...
>>>
>>> Anyway, it's self-contained within the DWC3, so I won't make you clean
>>> up the mess.
>>
>> heh, it's definitely not pointless. We get a lot of free goodies by
>> doing it that way. I'm just not going to repeat it once again. But in
>> summary:
>>
>> a) we force people to write glue layers for *only* their HW specific
>> details
>>
>> b) there's really no way to abuse dwc3 core because there's no symbol
>> exported from dwc3 core to glue
>
> Both are doable independent of DT.
>
>> c) PM (both system sleep and runtime) becomes a lot simpler with core
>> only caring about what PM details delivered by SNPS (e.g. Hibernation
>> mode from DWC3) and glue only has to consider the SoC integration parts
>> of PM (for OMAP that would be PRCM details, hwmod, etc).
>
> No doubt OMAP is special.

not only OMAP. Every single SoC will integrate a particular IP in its
own way.

>> I'm definitely not going to change dwc3 because it has made my life a
>> lot saner. Definitely a lot saner than MUSB. Besides, DTS is supposed to
>> describe the HW and that's, really, how the HW is.
>
> So reading the description, the DWC3 has no clocks?

of course it has, and you have registers in DWC3 to change some of the
parents of the clocks it uses internally.

>> There's a piece of HW which is somewhat platform agnostic and delivered
>> by SNPS as a black box (SNPS customers don't touch SNPS RTL) and there's
>> another piece of HW which bridges this dwc3 to the platform specific
>> details and integration context of the platform (for OMAP that would the
>> SYSCONFIG/SYSSTATUS registers, Clock autogating, PRCM, etc, etc etc).
>
> It is a black box, but with dozens of configuration options typically.

all of which are detected within the driver. For those which can't be,
we have bindings.

>> So you _do_ in fact, have two separate pieces of HW which are SW visible
>> and controllable independently. They each have their own IRQs (though in
>> some SoCs they share the same line), they're own address space, yada
>> yada yada.
>
> When that is the case, I have no problem with this split, but I don't
> see any of these examples in this particular case. So how should the
> binding look when there is no vendor specific glue? Are we supposed to
> keep the binding structure to appease the needs of the driver?

If there really is *no* vendor specific glue, nothing prevents them from
patching dwc3 to understand *OPTIONAL* clocks and use dwc3 directly. As
long as it doesn't break any of the platforms currently supported and
doesn't look ugly, fine with me.

In fact, there's one company which has been using dwc3 without a glue
layer. I forgot who told me they didn't need a glue layer, but it's in
the archives.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTVdGAAoJEIaOsuA1yqREA1QP/AjfS4KcCMO8DUME0r7SQAcX
t1qVTRYD7gbtoVu+BzTJaM7CCv8ERRbvyAD16DHjzSiveNuAJhPXeHX163fcXrZQ
WGKqp2NmrA7JNNigu7vutAQd7wqC4Bn1mzm9P9090ZkfqIzV6kB45II4hmVJ6NHc
g8Y+D2QoG3regZDeWbBVvVFxie5RtWWJTninW9Nk9vscQ0d2qoXQWsUBUjdLU9cq
2890P2HjtfOnUa4o1hyuOl4Fo1c/p9QI0b2DFhVKKGgSc6sYCPfhKPDECOmGHJm8
LgrZr4sJlXN9ZFUZIbG+vmGsWzLX40gfm3Pg/fAADOE2aptoyjC+X2dDMasPpzR1
xPBj9eJWJEq09V1Qmx0Q1QaxJvevIesfDKTTf3NTrQqjzj7aPYY7mGje919jOYlm
OXyU24LRw6NZ0rV1cp04UqMdm2jkmDiEB7Djmc/0fJo2mOFq0Jc5hqq0rIek4yk2
4PrqbTESZ0kOqavoAv/arTYQM6x+RnU2TFQmnuUCkHiaHZj2d79pM6hQZcuJch16
OAa4XOy6qUQYoP/Wi+Qu+RyMHHxKebgavHMd1bsl6hmlAVf3r5iMdZS+Pg4s220N
6KwASmWq+AVwyTSHv2EctAqOJZ9StoDDC4pu9TwnYk+spjrRbRdAN/AxDzhipe93
QMOMhvqQNuKJEOHCg8SH
=Qnfs
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
