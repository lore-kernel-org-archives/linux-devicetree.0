From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 06/20] tegra: fdt: Add Tegra2x device tree
	file from kernel
Date: Thu, 19 Jan 2012 15:51:07 -0800
Message-ID: <CAPnjgZ2Qfuhds3xK=ADiSx_7wprp-AXkreSOhZzPPFe8E54Q=g@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-7-git-send-email-sjg@chromium.org>
	<4F174691.1040007@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F174691.1040007@nvidia.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Jan 18, 2012 at 2:24 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/11/2012 09:32 PM, Simon Glass wrote:
>> This was taken from commit b48c54e2 at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>>
>> config.mk is updated to provide this file to boards through the
>> built-in mechanism:
>>
>> /include/ ARCH_CPU_DTS
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
> ...
>> + =A0 =A0 i2c@7000d000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-i2c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000D000 0x200>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 85 >;
>> + =A0 =A0 };
>
> This is slightly out-of-date now; in next-20120118, that node's
> compatible flag is nvidia,tegra20-i2c-dvc. The HW register layout is
> somewhat different for this I2C controller, and the different compatible
> flag is how the driver this.
>
> Still, you can always apply that fix in a later patch before you add I2C
> support.

This series was original submitted 24 November, so of course things
change. The changes you mention relate to I2C and I think I picked
these up in the later I2C patches.

But since we are chasing a moving target, I really don't want to get
too worried about redoing all the patches every time the kernel burps
:-) The changes you mention are not even in mainline yet and don't
relate to USB (this series).

Is it ok to adopt this sort of thinking throughout these series? As
you know it is easy to pick up a new fdt file later and make any
changes that are needed. I am well aware that things are still in
flux.

Regards,
Simon

>
> --
> nvpublic
