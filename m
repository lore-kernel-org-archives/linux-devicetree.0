Return-Path: <SRS0=V9/Z=FV=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru <pchandru@nvidia.com>
Subject: RE: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Date: Tue, 27 Feb 2018 12:03:49 +0000
Message-ID: <eedf17909bd049789e1706399605a53f@bgmail102.nvidia.com>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
 <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop> <20180219142433.GB11455@ulmo>
In-Reply-To: <20180219142433.GB11455@ulmo>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>
Cc: "tj@kernel.org" <tj@kernel.org>, "cyndis@kapsi.fi" <cyndis@kapsi.fi>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "preetham260@gmail.com" <preetham260@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Pavan
List-ID: <devicetree@vger.kernel.org>



>-----Original Message-----
>From: Thierry Reding [mailto:thierry.reding@gmail.com]
>Sent: Monday, February 19, 2018 7:55 PM
>To: Rob Herring <robh@kernel.org>
>Cc: Preetham Chandru <pchandru@nvidia.com>; tj@kernel.org; cyndis@kapsi.fi=
;
>mark.rutland@arm.com; devicetree@vger.kernel.org; preetham260@gmail.com;
>linux-tegra@vger.kernel.org; linux-ide@vger.kernel.org; Venu Byravarasu
><vbyravarasu@nvidia.com>; Pavan Kunapuli <pkunapuli@nvidia.com>
>Subject: Re: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documenta=
tion
>
>* PGP Signed by an unknown key
>
>On Sun, Feb 18, 2018 at 08:46:35PM -0600, Rob Herring wrote:
>> On Mon, Feb 12, 2018 at 10:56:40PM +0530, Preetham Chandru Ramchandra
>wrote:
>> > From: Preetham Ramchandra <pchandru@nvidia.com>
>> >
>> > This adds bindings documentation for the AHCI controller on Tegra210
>> >
>> > Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
>> > ---
>> > v7:
>> > * For Aux register set drop the Tegra210 since this register
>> >   set also works on Tegra124
>> > * rephrase the sentence for cml1 clock
>> > * change the commit subject to include ahci-tegra
>> > * drop pll_e since CCF handles it automatically as
>> >   CML1 is a child clock of it.
>> > v4:
>> > * changed the commit message
>> > * changed 'sata-cold' reset to mandatory for t210 and t124
>> > * Removed the regulators for T210 since these regulators
>> >   will be enabled in phy driver.
>> > v3:
>> > * Add AUX register.
>> > v2:
>> > * change cml1, pll_e and phy regulators as optional
>> >   for T210.
>> > ---
>> >  .../bindings/ata/nvidia,tegra124-ahci.txt          | 35 +++++++++++++=
+--------
>> >  1 file changed, 22 insertions(+), 13 deletions(-)
>> >
>> > diff --git
>> > a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> > b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> > index 66c83c3e8915..0f4520a00716 100644
>> > --- a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> > +++ b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> > @@ -1,20 +1,19 @@
>> > -Tegra124 SoC SATA AHCI controller
>> > +Tegra SoC SATA AHCI controller
>> >
>> >  Required properties :
>> > -- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".
>> > Otherwise,
>> > -  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"',
>> > where <chip>
>> > -  is tegra132.
>> > -- reg : Should contain 2 entries:
>> > +- compatible : Must be one of:
>> > +  - Tegra124 : "nvidia,tegra124-ahci"
>> > +  - Tegra210 : "nvidia,tegra210-ahci"
>>
>> Are you dropping T132?
>>
>> > +- reg : Should contain 3 entries:
>>
>> You can't just add more entries to existing compatibles. Does this
>> apply to T124?
>
>I'd consider this a bug in existing DTSs. The SATA AUX registers exist as =
far back as
>Tegra30. The reason why they were never included in the DTS in because the
>driver never programmed those registers.
>
>However, the driver change in patch 5/7 which uses this has a comment that=
 AUX
>registers are optional, so perhaps we can just add that fact to the bindin=
gs as
>well.
>
Okay, will make it optional

>Thierry
>
>* Unknown Key
>* 0x7F3EB3A1
