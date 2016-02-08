From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 04/10] ARM64: dts: rockchip: Add GMAC to GeekBox
Date: Mon, 8 Feb 2016 11:40:15 +0100
Message-ID: <56B8708F.50802@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
 <1454897859-7601-5-git-send-email-afaerber@suse.de> <5875277.Y7zJ7W9GkY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5875277.Y7zJ7W9GkY@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Am 08.02.2016 um 11:28 schrieb Heiko Stuebner:
> Am Montag, 8. Februar 2016, 03:17:33 schrieb Andreas F=E4rber:
>> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> is there some special reason that gmac, emmc, ir, etc are in separate=
=20
> patches? I guess I'll just fold them into the core patch otherwise.

Yes, feel free to squash. They are separate because they were not in v1=
,
it makes them easier to review and I didn't want errors in them to hold
up the base .dts. :) For example, SDIO I am still fighting with.

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
