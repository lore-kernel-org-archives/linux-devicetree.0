From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 10/18] tegra: usb: fdt: Add additional
 device tree definitions for USB ports
Date: Fri, 3 Feb 2012 09:04:07 -0800
Message-ID: <CAPnjgZ3DjcwQ9T-3CgFGvFvmsWTWebMNRiHvG6ZtZuH2Ao8KAA@mail.gmail.com>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
	<1327447272-30182-11-git-send-email-sjg@chromium.org>
	<4F2B0907.8050708@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F2B0907.8050708@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Feb 2, 2012 at 2:07 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/24/2012 04:21 PM, Simon Glass wrote:
>> This adds clock references to the USB part of the device tree for U-Boot.
>>
>> The USB timing information may vary between boards sometimes, but for
>> now we hard-code it in C. This is because all current T2x boards use
>> the same values, we will deal with T3x later and we first need to agree
>> on the format for this timing information in the fdt and may in fact
>> decide that it has no place there.
>
> The patch below does more than what's covered by this description...
>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>> ---
>> Changes in v5:
>> - Add dr_mode property to control host/device/otg mode
>> - Add nvidia,has-legacy-mode property per review comments
>> - Change device tree comment style from // to /* */
>>
>> =A0arch/arm/dts/tegra20.dtsi | =A0 =A07 +++++++
>> =A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>> index ec75747..b2e3a40 100644
>> --- a/arch/arm/dts/tegra20.dtsi
>> +++ b/arch/arm/dts/tegra20.dtsi
>> @@ -176,6 +176,9 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xc5000000 0x4000>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 52 >;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 phy_type =3D "utmi";
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&periph_clk 22>; =A0 =A0 =A0/* PER=
IPH_ID_USBD */
>> + =A0 =A0 =A0 =A0 =A0 =A0 dr_mode =3D "otg";
>
> The dr_mode value is board-specific, so should be in tegra-seaboard.dts
> not tegra20.dtsi.

Done

>
> For example, on true Seaboard, perhaps USB3 could operate in "otg" mode
> since it's an external port, whereas on Springbank, USB3 is hard-wired
> to a keyboard controller, so should be marked "host" mode only.

OK. I was seeing it as an SOC capability rather than a board feature.

>
> Related, I assume that any port marked as "otg" needs to have a VBUS
> GPIO defined so that it can be turned off in device mode, or is VBUS
> controlled by some other mechanism in some cases? Given that, I /think/
> you can't actually mark USB3 as "otg" or "device" on Seaboard since
> there's no VBUS GPIO.

Done. In principle VBUS can be controlled by a bit in the peripheral
controller driving out a VBUS enable line, but that's not how it works
in this case.

>
> --
> nvpublic

Regards,
Simon
