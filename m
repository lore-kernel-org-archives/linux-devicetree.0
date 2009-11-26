From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Support ePAPR compliant phandle properties
Date: Wed, 25 Nov 2009 21:40:40 -0700
Message-ID: <fa686aa40911252040j968cd8dl87ff237904312894@mail.gmail.com>
References: <20091126043713.GA27334@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091126043713.GA27334@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2009 at 9:37 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> Currently, the Linux kernel, libfdt and dtc, when using flattened
> device trees encode a node's phandle into a property named
> "linux,phandle". =A0The ePAPR specification, however - aiming as it is
> to not be a Linux specific spec - requires that phandles be encoded in
> a property named simply "phandle".
>
> This patch adds support for this newer approach to dtc and libfdt.
> Specifically:
>
> =A0 =A0 =A0 =A0- fdt_get_phandle() will now return the correct phandle if=
 it
> =A0 =A0 =A0 =A0 =A0is supplied in either of these properties
>
> =A0 =A0 =A0 =A0- fdt_node_offset_by_phandle() will correctly find a node =
with
> =A0 =A0 =A0 =A0 =A0the given phandle encoded in either property.
>
> =A0 =A0 =A0 =A0- By default, when auto-generating phandles, dtc will enco=
de
> =A0 =A0 =A0 =A0 =A0it into both properties for maximum compatibility. =A0=
A new -H
> =A0 =A0 =A0 =A0 =A0option allows either only old-style or only new-style
> =A0 =A0 =A0 =A0 =A0properties to be generated.
>
> =A0 =A0 =A0 =A0- If phandle properties are explicitly supplied in the dts
> =A0 =A0 =A0 =A0 =A0file, dtc will not auto-generate ones in the alternate=
 format.
>
> =A0 =A0 =A0 =A0- If both properties are supplied, dtc will check that they
> =A0 =A0 =A0 =A0 =A0have the same value.
>
> =A0 =A0 =A0 =A0- Some existing testcases are updated to use a mix of old =
and
> =A0 =A0 =A0 =A0 =A0new-style phandles, partially testing the changes.
>
> =A0 =A0 =A0 =A0- A new phandle_format test further tests the libfdt suppo=
rt,
> =A0 =A0 =A0 =A0 =A0and the -H option.

Haven't reviewed the code, but the approach seems sound.  FWIW, ACK.

g.
