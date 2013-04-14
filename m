From: Gabor Juhos <juhosg@openwrt.org>
Subject: Re: [PATCH 2/6] DT: add documentation for the Ralink MIPS SoCs
Date: Sun, 14 Apr 2013 11:44:24 +0200
Message-ID: <516A7A78.7060502@openwrt.org>
References: <1365843026-11015-1-git-send-email-blogic@openwrt.org> <1365843026-11015-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1365843026-11015-2-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

2013.04.13. 10:50 keltez=E9ssel, John Crispin =EDrta:
> From: Gabor Juhos <juhosg@openwrt.org>
>=20
> This patch adds binding documentation for the
> compatible values of the Ralink MIPS SoCs.
>=20
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> ---
>  Documentation/devicetree/bindings/mips/ralink.txt |   17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ralink.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Docu=
mentation/devicetree/bindings/mips/ralink.txt
> new file mode 100644
> index 0000000..43fc03c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ralink.txt
> @@ -0,0 +1,17 @@
> +Ralink MIPS SoC device tree bindings
> +
> +1. SoCs
> +
> +Each device tree must specify a compatible value for the Ralink SoC
> +it uses in the compatible property of the root node. The compatible
> +value must be one of the following values:
> +
> +  ralink,rt2880-soc
> +  ralink,rt3050-soc
> +  ralink,rt3052-soc
> +  ralink,rt3350-soc
> +  ralink,rt3352-soc
> +  ralink,rt3883-soc
> +  ralink,rt5350-soc
> +  ralink,mt7620-soc

It seems that I was wrong here. We should have separate entries for the=
 MT7620A
and for the MT7620N varians.

-Gabor
