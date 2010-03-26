From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 12:44:52 -0600
Message-ID: <fa686aa41003261144i61429f23x1217a528fcfb3e66@mail.gmail.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003251826m16ea94dfy422fae14fec81204@mail.gmail.com>
	<4BACD011.5050609@freescale.com>
	<fa686aa41003261120o15fea3cev8ca625f389bc8664@mail.gmail.com>
	<4BACFF7B.3010002@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BACFF7B.3010002-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 12:39 PM, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Grant Likely wrote:
>>> Without the compatible property, the only way I'd know that the child n=
ode contains a firmware is to look at the actual name of the child node, wh=
ich (as Scott and I believe) is not better than a compatible property.
>> If it is always a child of a qe node, then I've got no objections.
>
> I have no problem with putting the firmware node as a child of the QE nod=
e and skipping the phandle property, but only as long as there's only one Q=
E node. =A0Would you agree that this is bad:
>
> qe1: qe@e0080000 {
> =A0 =A0 =A0 =A0compatible =3D "fsl,qe";
> =A0 =A0 =A0 =A0qefw: fsl,qe_firmware {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible=3D"fsl,qe-firmware";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsl,firmware =3D /bininc/("firmware-blob.b=
in");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fsl,qe-firmware-eccr =3D <0x00000000 0x000=
01230>;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0...
> }
>
> qe2: qe@e0090000 {
> =A0 =A0 =A0 =A0compatible =3D "fsl,qe";
> =A0 =A0 =A0 =A0fsl,firmware-phandle =3D <&qefw>;
> =A0 =A0 =A0 =A0...
> }

Nah.  That looks totally fine.  Not having the firmware under a qe
node would look bad to me.

g.
