From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/8] Reconfigurable FPGAs over PCIe.
Date: Fri, 16 Jul 2010 12:22:55 -0600
Message-ID: <AANLkTinCjN6Kce-1Uv2H6aFEU6M1PEfDVyDSrHCNBCCb@mail.gmail.com>
References: <97058007-dca9-479d-b51f-87c369666e5e@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <97058007-dca9-479d-b51f-87c369666e5e-RaUQJvECHitEus+KprP3J7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This sequence of patches has the goal of enabling an FPGA connected
> over PCIe to have multiple internal devices specified in a device
> tree.. =A0Of course, such a device should work in any machine, in
> addition to those architectures which use device trees to describe the
> basic platform functionality: In particular, x86. =A0This requires some
> basic support on x86 in order to make device trees work, and small
> amount of driver code to light everything up.
>
> This has been tested on a Virtex5 board plugged into the PCIe slot of
> an x86 machine. =A0The device tree used looks like:
>
> /dts-v1/;
> / {
> =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0#size-cells =3D <1>;
> =A0 compatible =3D "simple-bus";
> =A0 =A0 =A0 =A0mb_plb: plb@0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "xlnx,plb-v46-1.03.a", "xln=
x,plb-v46-1.00.a", "simple-bus";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xps_hwicap_0: xps-hwicap@80030000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "xlnx,xps-h=
wicap-1.00.a";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0x80030000 0x100=
00 >;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xlnx,family =3D "virtex5";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xlnx,simulation =3D "false=
";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} ;
> =A0 } ;
> } =A0;
>
> Note that the bulk of the code is work in progress. =A0In particular,
> exactly how the device tree support should get extended to X86 is
> still up for grabs. =A0In addition, there are certain aspects of the
> device tree used which are suboptimal: The PCIe bridge translation
> range is currently hardcoded into the driver, and there is no
> provision for connecting interrupt lines into the PCIe bridge.
> Comments greatly appreciated...
>
> Grant: I've thrown in two hwicap patches, which should be final, if
> you want to pick them up that would be great.

Okay, I'll take a look.

g.
