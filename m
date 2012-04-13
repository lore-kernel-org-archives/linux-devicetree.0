From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 3/6] tegra: fdt: Add NAND controller binding
	and definitions
Date: Fri, 13 Apr 2012 10:44:28 -0700
Message-ID: <CAPnjgZ1Rv_U5Vod7gP5B8vTZo46b6cjEV4WrFwSWt_P=yj1VeA@mail.gmail.com>
References: <1326496256-5559-1-git-send-email-sjg@chromium.org>
	<1326496256-5559-4-git-send-email-sjg@chromium.org>
	<4F18BD4E.1080702@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F18BD4E.1080702@nvidia.com>
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

On Thu, Jan 19, 2012 at 5:03 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/13/2012 04:10 PM, Simon Glass wrote:
>> Add a NAND controller along with a bindings file for review.
>
> A few questions to start with:
>
>> diff --git a/doc/device-tree-bindings/nand/nvidia-nand.txt b/doc/device-=
tree-bindings/nand/nvidia-nand.txt
>
>> +NAND Flash
>> +----------
>> +
>> +(there isn't yet a generic binding in Linux, so this describes what is =
in
>> +U-Boot)
>> +
>> +The device node for a NAND flash device is as described in the document
>> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
>> +following modifications and additions :
>> +
>> +Required properties :
>> + - compatible : Should be "manufacture,device", "nand-flash"
>> + - page-data-bytes : Number of bytes in the data area
>> + - page-spare-bytes : * Number of bytes in spare area
>> + =A0 =A0 =A0 spare area =3D skipped-spare-bytes + data-ecc-bytes + tag-=
bytes
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + tag-ecc-bytes
>> + - skipped-spare-bytes : Number of bytes to skip at start of spare area
>> + =A0 =A0 (these are typically used for bad block maintenance)
>> + - data-ecc-bytes : Number of ECC bytes for data area
>> + - tag-bytes :Number of tag bytes in spare area
>> + - tag-ecc-bytes : Number ECC bytes to be generated for tag bytes
>
> Are any of those values really needed?
>
> I looked through all the NAND references I could find in the Linux
> kernel in arch/*/boot/dts/* and none of them seem to have this kind of
> information.
>
> Looking at the drivers, they execute some form of identification command
> on the NAND device which gives back a device ID, which is then looked up
> in a table of known devices to give the information above.
>
> I checked the Tegra NAND driver that's in the kernel chromeos-3.0
> branch, and it does the same thing, albeit it open-codes some of the
> identification routines rather than just calling into the common code.

Well that's pretty grim I think. That code should try to use the ONFi
way if it is available and supported, or provide a mechanism to
configure it (via device tree) if not / preferred.

U-Boot does have the same ID lookup feature for the mtd layer, but it
only has page size, block size and bus width.

I do wonder why this driver cannot take more of the information it
needs from the upper levels. Admittedly not all of the info is there,
but it could perhaps be inferred.

>
> Judging by arch/*/boot/dts/*, it is standard practice to have a node for
> the NAND device itself though; it's used to house (optional) partition
> definitions. In the kernel,
> Documentation/devicetree/bindings/mtd/mtd-physmap.txt discusses the
> format of these partition nodes, and e.g.
> arch/powerpc/boot/dts/canyonlands.dts (amongst many) uses this on NAND.

Yes.

>
>> +Nvidia NAND Controller
>> +----------------------
>> +
>> +The device node for a NAND flash controller is as described in the docu=
ment
>> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
>> +following modifications and additions :
>> +
>> +Optional properties:
>> +
>> +wp-gpio : GPIO of write-protect line, three cells in the format:
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle, parameter, flags
>> +width : bus width of the NAND device in bits
>> +
>> +For now here is something specific to the Nvidia controller, with naming
>> +based on Nvidia's original (non-fdt) NAND driver:
>> +
>> + - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
>> + =A0 =A0 Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
>> + =A0 =A0 TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL
>> +
>> + =A0 =A0 MAX_TRP_TREA is:
>> + =A0 =A0 =A0 =A0 =A0 =A0 non-EDO mode: Max(tRP, tREA) + 6ns
>> + =A0 =A0 =A0 =A0 =A0 =A0 EDO mode: tRP timing
>
> At first glance, it seems reasonable to have this in the NAND node; it's
> certainly impossible to probe the timing parameters. Since NAND is so
> standardized though, I wonder if there is a standard set of timing
> parameters so that we could have a standard device tree binding for this?

The closest datasheet I could find was this:

http://www.hynix.com/datasheet/pdf/flash/HY27(U_S)F(08_16)1G2M%20Series(Rev=
1.1).pdf

It has a table on p21 with 32 timing parameters.

But what we want here is the timings for the Tegra NAND controller.
Every controller will have a different take on these parameters - some
will be ignored, some added together, etc. So I think it is better to
think in terms of what the controller needs rather than getting
sidetracked on some average of all the NAND datasheets.

>
>> +Example:
>> +
>> +nand-controller@0x70008000 {
>> + =A0 =A0 compatible =3D "nvidia,tegra20-nand";
>> + =A0 =A0 wp-gpios =3D <&gpio 59 0>; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* P=
H3 */
>> + =A0 =A0 width =3D <8>;
>> + =A0 =A0 nvidia,timing =3D <26 100 20 80 20 10 12 10 70>;
>> + =A0 =A0 nand@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "hynix,hy27uf4g2b", "nand-flash=
";
>> + =A0 =A0 =A0 =A0 =A0 =A0 page-data-bytes =3D <2048>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 tag-ecc-bytes =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 tag-bytes =3D <20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 data-ecc-bytes =3D <36>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 skipped-spare-bytes =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 page-spare-bytes =3D <64>;
>> + =A0 =A0 };
>> +};
>
> --
> nvpublic

Regards,
Simon
