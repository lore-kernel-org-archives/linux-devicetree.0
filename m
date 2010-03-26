From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] [v2] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 13:45:38 -0600
Message-ID: <fa686aa41003261245h52e151ceoa4f85e38055ae6a7@mail.gmail.com>
References: <1269632145-28462-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1269632145-28462-1-git-send-email-timur@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur@freescale.com>
Cc: wmb@firmworks.com, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, scottwood@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 1:35 PM, Timur Tabi <timur@freescale.com> wrote:
> Define a binding for embedding a QE firmware blob into the device tree. =
=A0Also
> define a new property for the QE node that links to a firmware node.
>
> Signed-off-by: Timur Tabi <timur@freescale.com>
> ---
> =A0.../powerpc/dts-bindings/fsl/cpm_qe/qe.txt =A0 =A0 =A0 =A0 | =A0 54 ++=
++++++++++++++++++
> =A01 files changed, 54 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/powerpc/dts-bindings/fsl/cpm_qe/qe.txt b/Docum=
entation/powerpc/dts-bindings/fsl/cpm_qe/qe.txt
> index 6e37be1..865a2ef 100644
> --- a/Documentation/powerpc/dts-bindings/fsl/cpm_qe/qe.txt
> +++ b/Documentation/powerpc/dts-bindings/fsl/cpm_qe/qe.txt
> @@ -21,6 +21,15 @@ Required properties:
> =A0- fsl,qe-num-snums: define how many serial number(SNUM) the QE can use=
 for the
> =A0 threads.
>
> +Optional properties:
> +- fsl,firmware-phandle:
> + =A0 =A0Usage: required only if there is no fsl,qe-firmware child node
> + =A0 =A0Value type: <phandle>
> + =A0 =A0Definition: Points to a firmware node (see "QE Firmware Node" be=
low)
> + =A0 =A0 =A0 =A0that contains the firmware that should be uploaded for t=
his QE.
> + =A0 =A0 =A0 =A0The compatible property for the firmware node should say,
> + =A0 =A0 =A0 =A0"fsl,qe-firmware".
> +
> =A0Recommended properties
> =A0- brg-frequency : the internal clock source frequency for baud-rate
> =A0 generators in Hz.
> @@ -59,3 +68,48 @@ Example:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0 c000>;
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0};
> +
> +* QE Firmware Node
> +
> +This node defines a firmware binary that is embedded in the device tree,=
 for
> +the purpose of passing the firmware from bootloader to the kernel, or fr=
om
> +the hypervisor to the guest.
> +
> +The firmware node itself contains the firmware binary contents, a compat=
ible
> +property, and any firmware-specific properties. =A0The node itself can b=
e located
> +anywhere, but should probably be placed inside a QE node.

The node must be a child of a QE node.  A QE node can reference the
firmware from another QE node by using the fsl,firmware-phandle
property.

With that change; Acked-by: Grant Likely <grant.likely@secretlab.ca>

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
