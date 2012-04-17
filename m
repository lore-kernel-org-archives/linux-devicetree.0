From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 11:33:40 -0700
Message-ID: <CAPnjgZ1uXbLUtMTXd5siZsKSF5m3BZGRtkGiEYhK+PQO1PbpNQ@mail.gmail.com>
References: <1334341777-2681-1-git-send-email-sjg@chromium.org>
	<1334341777-2681-5-git-send-email-sjg@chromium.org>
	<4F8894FD.70307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8894FD.70307@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Scott Wood <scottwood@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Apr 13, 2012 at 2:05 PM, Stephen Warren <swarren@wwwdotorg.org> wro=
te:
> On 04/13/2012 12:29 PM, Simon Glass wrote:
>> Add a NAND controller along with a bindings file for review.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>> +++ b/doc/device-tree-bindings/nand/nvidia-nand.txt
>
> I'd prefer this be called nvidia,tegra20-nand.txt so filenames are named
> according to compatible value. This makes it easier to look things up.

OK, changed

>
>> +The device node for a NAND flash device is as described in the document
>> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
>
> This is really based on USB?

Well just in that it follows the conventions. I will remove this since
I'm not sure we use anything that isn't in the ePAPR.

>
>> +Required properties :
>> + - compatible : Should be "manufacture,device", "nand-flash"
>> + - nvidia,page-data-bytes : Number of bytes in the data area
>> + - nvidia,page-spare-bytes : * Number of bytes in spare area
>
> Not sure what that "*" is?

Removed

>
>> +Nvidia NAND Controller
>> +----------------------
>> +
>> +The device node for a NAND flash controller is as described in the docu=
ment
>> +"Open Firmware Recommended Practice : Universal Serial Bus" with the
>
> USB again?

Removed

>
>> +nand-controller@0x70008000 {
>> + =A0 =A0 compatible =3D "nvidia,tegra20-nand";
>> + =A0 =A0 wp-gpios =3D <&gpio 59 0>; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* P=
H3 */
>> + =A0 =A0 nvidia,width =3D <8>;
>> + =A0 =A0 nvidia,timing =3D <26 100 20 80 20 10 12 10 70>;
>> + =A0 =A0 nand@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "hynix,hy27uf4g2b", "nand-flash=
";
>
> The TRM says there can be up to 8 chip selects. Don't the NAND device
> sub-nodes need a reg property to indicate which chip-select they're on?

We don't have driver support for this at present.

>
> Also, the TRM mentions async vs. ONFI devices. Don't we need properties
> somewhere to configure that kind of thing?

We don't have driver support for this at present, either :-(

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,page-data-bytes =3D <2048>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,tag-ecc-bytes =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,tag-bytes =3D <20>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,data-ecc-bytes =3D <36>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,skipped-spare-bytes =3D <4>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,page-spare-bytes =3D <64>;
>> + =A0 =A0 };
>> +};

Regards,
Simon
