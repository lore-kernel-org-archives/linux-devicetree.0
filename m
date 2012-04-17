From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 13:18:31 -0700
Message-ID: <CAPnjgZ16bJJiq7qmTQ3br3kSmdTpZfcdtPDPNJ1=s1DPeDwE2g@mail.gmail.com>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
	<1334688614-4977-5-git-send-email-sjg@chromium.org>
	<4F8DBF50.5060700@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8DBF50.5060700@freescale.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Scott Wood <scottwood@freescale.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jim Lin <jilin@nvidia.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

+Jim, who wrote the driver originally

Hi Scott,

On Tue, Apr 17, 2012 at 12:06 PM, Scott Wood <scottwood@freescale.com> wrot=
e:
> On 04/17/2012 01:50 PM, Simon Glass wrote:
>> diff --git a/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt b/doc=
/device-tree-bindings/nand/nvidia,tegra20-nand.txt
>> new file mode 100644
>> index 0000000..2484556
>> --- /dev/null
>> +++ b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
>> @@ -0,0 +1,68 @@
>> +NAND Flash
>> +----------
>> +
>> +(there isn't yet a generic binding in Linux, so this describes what is =
in
>> +U-Boot. There should not be Linux-specific or U-Boot specific binding, =
just
>> +a binding that describes this hardware. But agreeing a binding in Linux=
 in
>> +the absence of a driver may be beyond my powers.)
>> +
>> +The device node for a NAND flash device is as follows:
>> +
>> +Required properties :
>> + - compatible : Should be "manufacturer,device", "nand-flash"
>
> Again, "nand-flash" is not an appropriate compatible. =A0There is no
> generic nand-flash binding.

OK, so I should just drop this.

>
>> + - nvidia,page-data-bytes : Number of bytes in the data area
>> + - nvidia,page-spare-bytes : Number of bytes in spare area
>> + =A0 =A0 =A0 spare area =3D skipped-spare-bytes + data-ecc-bytes + tag-=
bytes
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + tag-ecc-bytes
>
> Do you really need this stuff to be in the device tree? =A0You should be
> able to determine this information from the ID table.

I suspect so - the driver originally had a lot of CONFIGs for this.
Maybe someone who wants to take it further could do this as part of
supporting ONFI?

I will see if Jim Lin can take another look.

>
>> + - nvidia,skipped-spare-bytes : Number of bytes to skip at start of spa=
re area
>> + =A0 =A0 (these are typically used for bad block maintenance)
>
> So this binding can't deal with the bad block marker being somewhere
> other than the beginning of the spare area (e.g. 8-bit small page NAND)?

I suppose it depends on what you want to put afterwards.

>
>> + - nvidia,data-ecc-bytes : Number of ECC bytes for data area
>
> Number of ECC bytes per page? =A0Number of ECC bytes per ECC block?
> Number of data bytes per ECC block?
>
>> + - nvidia,tag-bytes :Number of tag bytes in spare area
>
> What are tag bytes?

I know that term from YAFFS, but other than that I am not sure.

>
>> +Nvidia NAND Controller
>> +----------------------
>> +
>> +The device node for a NAND flash controller is as follows:
>> +
>> +Optional properties:
>> +
>> +nvidia,wp-gpios : GPIO of write-protect line, three cells in the format:
>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle, parameter, flags
>
> Doesn't the number of cells depend on the GPIO controller binding?

Yes, but this is the binding Tegra uses.

>
>> +nvidia,nand-width : bus width of the NAND device in bits
>> +
>> + - nvidia,nand-timing : Timing parameters for the NAND. Each is in ns.
>> + =A0 =A0 Order is: MAX_TRP_TREA, TWB, Max(tCS, tCH, tALS, tALH),
>> + =A0 =A0 TWHR, Max(tCS, tCH, tALS, tALH), TWH, TWP, TRH, TADL
>
> Might want to point out that there's one cell per timing parameter.

OK.

I'm going to wait and see if Jim can pick up this driver and make the
device-tree change you requested.

>
> -Scott
>

Regards,
Simon
