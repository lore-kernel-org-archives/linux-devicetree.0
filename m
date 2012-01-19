From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 12/20] tegra: usb: fdt: Add additional
 device tree definitions for USB ports
Date: Thu, 19 Jan 2012 15:53:48 -0800
Message-ID: <CAPnjgZ1PhBmDh7_C9jF78Qi2RW7SHtco=ho9LN_WGJihY1=P-Q@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-13-git-send-email-sjg@chromium.org>
	<4F17619A.7060108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F17619A.7060108@nvidia.com>
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

On Wed, Jan 18, 2012 at 4:19 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/11/2012 09:33 PM, Simon Glass wrote:
>> This adds clock references to the USB part of the device tree for U-Boot.
>>
>> The USB timing information may vary between boards sometimes, but for
>> now we hard-code it in C. This is because all current T2x boards use
>> the same values, we will deal with T3x later and we first need to agree
>> on the format for this timing information in the fdt and may in fact
>> decide that it has no place there.
>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&periph_clk 22>; =A0 =A0 =A0// PER=
IPH_ID_USBD
>
> Typically /* */ rather than // I think

Yes will fix. Looking forward to your symbolic stuff so that I can
remove the comment.

Regards,
Simon

>
> --
> nvpublic
