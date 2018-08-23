From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Date: Thu, 23 Aug 2018 18:32:13 +0300
Message-ID: <81f3d73a-acce-6dad-2e65-49f499c60eb9@yadro.com>
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <CAL_JsqLZo-=7UkuvvUFYdCR4asBBiWyC=Q1ryH=-HLU6vzf9tA@mail.gmail.com>
 <ece91112ecfdc7218184c4c4519e455cf9397e11.camel@kernel.crashing.org>
 <CAL_JsqL_bMXLAA0091-g8PmhXR5g5Pf2y2=ey7Ss5ofHm46sWw@mail.gmail.com>
 <c69d0e7c3a95d83da87b566a62619462671a233b.camel@kernel.crashing.org>
 <1531967302.2140539.1445583600.0F5ED287@webmail.messagingengine.com>
 <9787b471abc49c0b3db60e3471473a7a5b45ade7.camel@kernel.crashing.org>
 <1532045276.1219110.1446722072.546C1F9D@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7471141153521117088=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532045276.1219110.1446722072.546C1F9D@webmail.messagingengine.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh@kernel.org>, Eugene.Cho@dell.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, stewart@linux.ibm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7471141153521117088==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="iM8iBkc75YSfqsLQktDfdMLnrPLa1OPFd"

--iM8iBkc75YSfqsLQktDfdMLnrPLa1OPFd
Content-Type: multipart/mixed; boundary="c0lFkrzp2zFaEVZ5fFUL92XCceQeTff0s";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rob Herring <robh@kernel.org>, Eugene.Cho@dell.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 stewart@linux.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <81f3d73a-acce-6dad-2e65-49f499c60eb9@yadro.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <CAL_JsqLZo-=7UkuvvUFYdCR4asBBiWyC=Q1ryH=-HLU6vzf9tA@mail.gmail.com>
 <ece91112ecfdc7218184c4c4519e455cf9397e11.camel@kernel.crashing.org>
 <CAL_JsqL_bMXLAA0091-g8PmhXR5g5Pf2y2=ey7Ss5ofHm46sWw@mail.gmail.com>
 <c69d0e7c3a95d83da87b566a62619462671a233b.camel@kernel.crashing.org>
 <1531967302.2140539.1445583600.0F5ED287@webmail.messagingengine.com>
 <9787b471abc49c0b3db60e3471473a7a5b45ade7.camel@kernel.crashing.org>
 <1532045276.1219110.1446722072.546C1F9D@webmail.messagingengine.com>
In-Reply-To: <1532045276.1219110.1446722072.546C1F9D@webmail.messagingengine.com>

--c0lFkrzp2zFaEVZ5fFUL92XCceQeTff0s
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

20.07.2018 03:07, Andrew Jeffery wrote:
>> Andrew, can you start with a list that shows what you expect us to nee=
d
>> on our systems ?
>>
> Okay, our Witherspoon and Romulus platforms containing the ASPEED AST25=
00 currently need the following tuneables exposed:
>
> From the SCU:
> - Debug UART enable
> - VGA DAC mux
> - VGA scratch registers 0-7
> - LPC SuperIO decode enable
> - VGA MMIO decode enable
>
> From the LPC controller:
> - iLPC2AHB enable
> - SuperIO scratch registers 0x20-0x2f
>
> (The LPC controller is just as much of a collection of random bits as t=
he SCU)
>
> Lastly, our Palmetto platform uses an AST2400 which has fewer features =
compared to the AST2500. Its tuneable list is the same as the above with =
the exception of "Debug UART enable".
>
> Tuneables that we may need to expose in the future include:
>
> From the SCU:
> - PCI VID/DID for the BMC PCIe device
> - VGA device enable (may need to be disabled if the platform contains a=
 discrete graphics processor)
>
> From the LPC controller:
> - UART mux
>
> Alexander, Eugene, can you chime in with your platforms' needs?
In addition to what you've mentioned, we also need (and I believe you nee=
d it too) the SCU3C register (reset control/status) to determine the BMC =
reset reason and only perform certain actions on cold boots (see https://=
github.com/openbmc/openbmc/issues/3031). Although, this could probably be=
 handled by a separate driver, don't know which though.

Alexander.


--c0lFkrzp2zFaEVZ5fFUL92XCceQeTff0s--

--iM8iBkc75YSfqsLQktDfdMLnrPLa1OPFd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbftN9AAoJEOiTWHtbdBeNIXQQALW1FcU7PGgQzkQKjRy1gDYI
Q0UM3LRiQ+iw5qVlgR265yGXRBRiio+cjUJqEc7pA5TRo56eoNg4jRXq9oHiGFTZ
qI0WQSESP/kYwcyVqEPyudbKzL+Itu3KdnDLz2FFFwxq+IXSpFuNPB28hAFBdkvY
ev3Mf3Zo9vwPDP84E/6xR2E5uKNYICTEEhDcFvFCgrd4g4NFo/gAMJ9VnU89c/9J
VnlKOZxzn4AnmKUcAZFN82nDMCLmPnUJfjz6wayKbb+P2ZDiz31DxC2O8OzUn2uZ
uZfZWoP91xoF9hSn/IBO7UvWyne8+uE0ynal7vliqUPSKMkapjDPCpYZfnxEosKB
2K1wgzbcs7FPkP56ualqhGNUmh6ygmvbf8lB/TNhI5NUmNqraYjP2Z3CcvAx/T/y
tw55AiMAXSAoqgGxhzg4tt3hnP8uKKBqQJ8XbR/PzF3vmddYxhSrp7h2wEYl3V1/
yNDBsnbJjcTzfyztKggpz7NYNPpLmmJ7tr3pz8A4RPaPOiaJRDIkCRbNlTuO9d/w
dKPU4u02iPb3n/aiStVNzG9licu0dLXP4UGlYpyq8azd94OLUy8wm5p3j8EP9sTf
GyJrH+gpmLjekXs8KID/SLyYuONmJHnZb6rxTeB4CW1Gym/7q81jW5wy8U9qbu0h
YgZRlXeLcCvU6xV8nc7M
=ifRg
-----END PGP SIGNATURE-----

--iM8iBkc75YSfqsLQktDfdMLnrPLa1OPFd--


--===============7471141153521117088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7471141153521117088==--
