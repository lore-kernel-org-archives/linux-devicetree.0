From: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 5/6] DT: MIPS: ralink: add RT3883 dts files
Date: Sun, 14 Apr 2013 11:54:58 +0200
Message-ID: <516A7CF2.6020507@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
 <1365843026-11015-5-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365843026-11015-5-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013.04.13. 10:50 keltez=E9ssel, John Crispin =EDrta:
> Add a dtsi file for RT3883 SoC and a sample dts file.
> =

> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  arch/mips/ralink/Kconfig             |    4 +++
>  arch/mips/ralink/dts/Makefile        |    1 +
>  arch/mips/ralink/dts/rt3883.dtsi     |   58 ++++++++++++++++++++++++++++=
++++++
>  arch/mips/ralink/dts/rt3883_eval.dts |   18 +++++++++++
>  4 files changed, 81 insertions(+)
>  create mode 100644 arch/mips/ralink/dts/rt3883.dtsi
>  create mode 100644 arch/mips/ralink/dts/rt3883_eval.dts

<...>

> diff --git a/arch/mips/ralink/dts/rt3883.dtsi b/arch/mips/ralink/dts/rt38=
83.dtsi
> new file mode 100644
> index 0000000..3b131dd
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt3883.dtsi
> @@ -0,0 +1,58 @@
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "ralink,rt3883-soc";
> +

<...>

> diff --git a/arch/mips/ralink/dts/rt3883_eval.dts b/arch/mips/ralink/dts/=
rt3883_eval.dts
> new file mode 100644
> index 0000000..0297f20
> --- /dev/null
> +++ b/arch/mips/ralink/dts/rt3883_eval.dts
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +/include/ "rt3883.dtsi"
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;

These -cells properties are superfluous, because the rt3883.dtsi file conta=
ins
these already.

-Gabor
