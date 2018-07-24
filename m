From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 00/18] JZ4780 DMA patchset v3
Date: Tue, 24 Jul 2018 13:09:34 +0200
Message-ID: <1532430574.2610.0@smtp.crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
        <20180723175846.udmjtkx7fsaf52wa@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723175846.udmjtkx7fsaf52wa@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

Le lun. 23 juil. 2018 =E0 19:58, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul & Vinod,
>=20
> On Sat, Jul 21, 2018 at 01:06:25PM +0200, Paul Cercueil wrote:
>>  This is the version 3 of my jz4780-dma driver update patchset.
>>=20
>>  Apologies to the DMA people, the v2 of this patchset did not make=20
>> it to
>>  their mailing-list; see the bottom of this email for a description=20
>> of
>>  what happened in v2.
>>=20
>>  Changelog from v2 to v3:
>>=20
>>  - Modified the devicetree bindings to comply with the specification
>>=20
>>  - New patch [06/18] allows the JZ4780 DMA driver to be compiled=20
>> within a
>>    generic MIPS kernel.
>=20
> Would you prefer to take the MIPS .dts changes in patches 16-18=20
> through
> the DMA tree with the rest of the series?

I think it would make sense yes.

> If so then for patches 16-18:
>=20
>     Acked-by: Paul Burton <paul.burton@mips.com>
>=20
> Thanks,
>     Paul
=
