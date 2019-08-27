Return-Path: <SRS0=TzlV=WX=outlook.com=leiwang_git@kernel.org>
From: Lei Wang <leiwang_git@outlook.com>
Subject: Re: [PATCH v5 2/2] EDAC: add EDAC driver for DMC520
Date: Tue, 27 Aug 2019 01:49:29 +0000
Message-ID: 
 <BY5PR04MB65996BD47D541327F8F1BE4A86A00@BY5PR04MB6599.namprd04.prod.outlook.com>
References: 
 <BN6PR04MB1107CE3C2D666A806E62851B86C10@BN6PR04MB1107.namprd04.prod.outlook.com>
 <20190807144016.GA24328@zn.tnic>
 <BY5PR04MB659914AC91EBB3EAF72977BD86D20@BY5PR04MB6599.namprd04.prod.outlook.com>
 <20190819093147.GE4841@zn.tnic>
In-Reply-To: <20190819093147.GE4841@zn.tnic>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <939E72DF3413FE46891FBAEDDAEC0501@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Borislav Petkov <bp@alien8.de>
Cc: "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>, "scott.branden@broadcom.com" <scott.branden@broadcom.com>, "yuqing.shen@broadcom.com" <yuqing.shen@broadcom.com>, "ray.jui@broadcom.com" <ray.jui@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

>> These comments tell how to potentially expand the driver functions to
>> support more interrupts besides what are already here.
>=20
> I can read that - the question is why are they there and for whom? For
> your future colleagues who'll take over this driver or what is those
> comments' purpose?
>=20

Yes, this is to help open source developers who potentially might want=20
to expand this driver, most likely colleagues, and possibly other=20
developers.

>> After edac_mc_alloc(), if succeeds, the above code updates dmc520_edac
>> struct data. If moving edac_mc_alloc as suggested, I will need to use
>> local variables to store the data,
>=20
> Yes, do that pls.
>=20
>> Do you mean having an array to keep all the irq_id, and then only
>> devm_request_irq on them if all of the platform_get_irq are success?
>=20
> No, move it before edac_mc_alloc().
>=20
> In general, do *all* initialization of your hardware first and only
> then, when it succeeds, allocate the EDAC structures.
>=20

Thanks! I'll address this feedback.

-Lei
