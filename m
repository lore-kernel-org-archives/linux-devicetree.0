From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 09/10] Documentation: devicetree: rockchip: Document
 Landingship
Date: Mon, 8 Feb 2016 11:51:04 +0100
Message-ID: <56B87318.9020007@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
 <1454897859-7601-10-git-send-email-afaerber@suse.de>
 <6744409.i2u8076vm4@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6744409.i2u8076vm4@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am 08.02.2016 um 11:29 schrieb Heiko Stuebner:
> Am Montag, 8. Februar 2016, 03:17:38 schrieb Andreas F=E4rber:
>> Use "geekbuying,landingship" compatible string, plus those of GeekBo=
x.
>=20
> I do believe this would be better as geekbuying,geekbox-landingship .=
 They=20
> might reuse the landingship naming for future baseboards as well ;-)

Well, the question is: Is this MXM3 interface as generic as Qseven so
that it could be used as is for other modules (and baseboards from othe=
r
manufacturers could be used for the module)? Then my thought was
landingship as identifier for the baseboard and geekbox as identifier
for the contained module.

I agree that if this Landingship is specific to the GeekBox then
geekbox-landingship would be more appropriate. We could also do both.

Can you tell? Unfortunately I spot no real documentation of the MXM3
connector pins in the schematics we could compare, only an on-board
documentation of the three-row pins.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
