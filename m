From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 3/7] tegra: fdt: Add extra I2C bindings for
	U-Boot
Date: Sun, 22 Jan 2012 09:41:05 -0800
Message-ID: <CAPnjgZ0cOquTwqg4wx3Cz1+OKXUzYoBvUi2PMA7oHN=2riOHmQ@mail.gmail.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
	<1326394818-32227-4-git-send-email-sjg@chromium.org>
	<4F188261.4060607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F188261.4060607@nvidia.com>
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

On Thu, Jan 19, 2012 at 12:51 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/12/2012 12:00 PM, Simon Glass wrote:
>> Add U-Boot's peripheral clock information to the Tegra20 device tree fil=
e.
>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>> index ca7b523..963cf27 100644
>> --- a/arch/arm/dts/tegra20.dtsi
>> +++ b/arch/arm/dts/tegra20.dtsi
>> @@ -45,6 +45,8 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-i2c";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000C000 0x100>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 70 >;
>> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <100000>;
>
> That's board-specific information. I'd rather not include it in the SoC
> .dtsi file even as a default; that way, it forces people to think about
> the correct value and put it in their board file, whereas including a
> default means people probably won't think about it.

OK I moved this into the board file - sadly this means everyone will
need to specify it here. Or should we have a default?

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&periph_clk 12>; =A0 =A0 =A0// PER=
IPH_ID_I2C1
>
> Of course, that'll need updating based on the resolution of the clock
> binding thread I started.

Yes we can come back to this when resolved.

Regards,
Simon

>
> --
> nvpublic
