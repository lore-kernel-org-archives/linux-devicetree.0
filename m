From: <Andrei.Stefanescu@microchip.com>
Subject: Re: [RESEND PATCH v3 3/3] regulator: mcp16502: add regulator driver
 for MCP16502
Date: Thu, 13 Dec 2018 12:19:16 +0000
Message-ID: <2f24d81a-5271-6ea7-32a2-bc2e708521fa@microchip.com>
References: <1544522876-15967-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181211164706.GL6686@sirena.org.uk>
 <6a35df06-1309-f069-9b22-8c2cc5cca56e@microchip.com>
 <20181212155502.GD6920@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212155502.GD6920@sirena.org.uk>
Content-Language: en-US
Content-ID: <FC19A310035B2F4FBA7E4FC6E3B9DA7D@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andr3i.stefanescu@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 12.12.2018 17:55, Mark Brown wrote:
> On Wed, Dec 12, 2018 at 08:01:07AM +0000, Andrei.Stefanescu@microchip.com=
 wrote:
>
>>> This puts the device into low power mode when the suspend function gets
>>> called but this might not be safe - devices using the regulator may not
>>> be suspended yet so could still need full regulation.  Normally a GPIO
>>> triggered transition like this would be being done by hardware as part
>>> of the process of suspending the SoC.  Is there some reason to do this
>>> manually?
>> There is a line from the MPU (SHDN) which goes low only when the MPU
>> turns off. That line is already connected to the PMIC and it differentia=
tes
>> between suspend-to-mem and standby. To switch to low-power, the PMIC mus=
t
>> be controlled by the GPIO pin LPM.
>> The suspend sequence is:
>> - LPM pin goes high (PMIC enters Low-Power <-> Linux standby)
>> - SHDN goes low (if target suspend state is mem) and then PMIC enters
>> HIBERNATE
> This feels like it should be being controlled somewhere else, if it's
> actually causing a change in the PMIC state it seems like it wants to be
> done as late as possible in suspend to minimize the risks.  At the very
> least suspend_late() for the driver seems appropriate.
I tried with both suspend_late/resume_early and suspend_noirq/resume_noirq.
Everything seems to work ok.

Which one do you think is more appropriate? I am guessing that during
suspend_late some devices may still need to be turned on and that it would
be the safest during suspend_noirq.

Note: the GPIO pin used for LPM is a special one (it maintains its=20
voltage during
suspend-to-mem). It is part of the SoC and its methods for setting the=20
values
do not sleep.

>
> Could you submit a version with this feature at least split out into a
> separate patch please so we can apply the rest of the code while this is
> discussed?
Sent one patch series and another patch with the current suspend/resume
implementation.

Best regards,
Andrei
