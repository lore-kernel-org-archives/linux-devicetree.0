From: Zach Pfeffer <zach.pfeffer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Fix babbage.dts memory node
Date: Sat, 23 Apr 2011 16:39:15 -0500
Message-ID: <BANLkTikNodocgONEpqASBy1iAZzu50w3vQ@mail.gmail.com>
References: <1303453526-27523-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1303453526-27523-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22 April 2011 01:25, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Without device_type property set as memory for the node, the generated
> dtb can still work when it gets passed to kernel by u-boot, since
> u-boot will fix it up. =A0But kernel will not boot due to that it fails
> to parse the memory node, when the dtb is appended to kernel image as
> it is.

I'm a little confused. The first part of the statement implies that
the kernel will boot without the device_type property, but the second
part of the statement says that the kernel won't boot.

> The patch adds a property device_type=3D"memory" for memory node to fix
> the problem.
>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> It applies on branch devicetree/test.
>
> =A0arch/arm/boot/dts/babbage.dts | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/babbage.dts b/arch/arm/boot/dts/babbage.dts
> index 8f9b47c..4805168 100644
> --- a/arch/arm/boot/dts/babbage.dts
> +++ b/arch/arm/boot/dts/babbage.dts
> @@ -21,6 +21,7 @@
> =A0 =A0 =A0 =A0interrupt-parent =3D <&tzic>;
>
> =A0 =A0 =A0 =A0memory {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x90000000 0x20000000>;
> =A0 =A0 =A0 =A0};
>
> --
> 1.7.4.1
>
>
> _______________________________________________
> linaro-kernel mailing list
> linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-kernel
>
