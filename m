From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: [PATCH 04/11] arm64: dts: Initial DTS files for Broadcom Stingray SOC
Date: Mon, 15 May 2017 10:39:54 +0530
Message-ID: <CAALAos_O_dpN8o0C4cUOGmP+UfRSHWep2P-j0ueMP3o7hZcgmQ@mail.gmail.com>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
 <1494071686-19098-5-git-send-email-anup.patel@broadcom.com> <38356358-cfd1-9a29-2b53-80ed495573c6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <38356358-cfd1-9a29-2b53-80ed495573c6@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Oza Pawandeep <oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, Device Tree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 8, 2017 at 5:00 AM, Florian Fainelli <f.fainelli@gmail.com> wro=
te:
> Le 05/06/17 =C3=A0 04:54, Anup Patel a =C3=A9crit :
>> The Broadcom Stingray SoC is a new member in Broadcom iProc
>> SoC family.
>>
>> This patch adds initial DTS files for Broadcom Stingray SoC
>> and two of its reference boards (bcm958742k and bcm958742t).
>>
>> We have lot of reference boards and large number of devices
>> in Broadcom Stingray SoC so eventually we will have quite
>> a few DTS files for Stingray. To tackle, we have added a
>> separate directory for Stingray DTS files.
>>
>> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> Reviewed-by: Ray Jui <rjui@broadcom.com>
>> ---
>
>> +
>> +     scr {
>> +             compatible =3D "simple-bus";
>> +             #address-cells =3D <1>;
>> +             #size-cells =3D <1>;
>> +             ranges =3D <0 0 0 0xffffffff>;
>
> Sorry for missing that during the internal review, the ranges property
> here should include the 6300_0000 offset such that everything else under
> the "scr" node is relative to that base address. This makes it a lot
> easier to understand the different physical addresses involved and the
> bus topology.

Sure, I will do this.

Regards,
Anup
