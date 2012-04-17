From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 4/7] tegra: fdt: Add NAND controller binding
	and definitions
Date: Tue, 17 Apr 2012 13:36:37 -0700
Message-ID: <CAPnjgZ2OESUgpMb-L0AdJ3EbOzO2Y1GRykuudKpPu2Yyjsh_NA@mail.gmail.com>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
	<1334688614-4977-5-git-send-email-sjg@chromium.org>
	<4F8DBF50.5060700@freescale.com>
	<CAPnjgZ16bJJiq7qmTQ3br3kSmdTpZfcdtPDPNJ1=s1DPeDwE2g@mail.gmail.com>
	<4F8DD31D.3040304@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F8DD31D.3040304@freescale.com>
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

Hi Scott,

On Tue, Apr 17, 2012 at 1:31 PM, Scott Wood <scottwood@freescale.com> wrote:
> On 04/17/2012 03:18 PM, Simon Glass wrote:
>> +Jim, who wrote the driver originally
>>
>> Hi Scott,
>>
>> On Tue, Apr 17, 2012 at 12:06 PM, Scott Wood <scottwood@freescale.com> w=
rote:
>>>> + - nvidia,page-data-bytes : Number of bytes in the data area
>>>> + - nvidia,page-spare-bytes : Number of bytes in spare area
>>>> + =A0 =A0 =A0 spare area =3D skipped-spare-bytes + data-ecc-bytes + ta=
g-bytes
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + tag-ecc-bytes
>>>
>>> Do you really need this stuff to be in the device tree? =A0You should be
>>> able to determine this information from the ID table.
>>
>> I suspect so - the driver originally had a lot of CONFIGs for this.
>> Maybe someone who wants to take it further could do this as part of
>> supporting ONFI?
>>
>> I will see if Jim Lin can take another look.
>
> You don't need ONFI to get the page/spare size out of the ID table.
>
> The generic NAND code should already be doing this for you (fills in
> mtd->writesize and mtd->oobsize). =A0If you need it during setup, we now
> have CONFIG_SYS_NAND_SELF_INIT that allows splitting up
> nand_scan_ident() from nand_scan_tail().

OK, sounds good. It should just need to be changed over to calculate
these values from the nand layer.

>
>>>> +Nvidia NAND Controller
>>>> +----------------------
>>>> +
>>>> +The device node for a NAND flash controller is as follows:
>>>> +
>>>> +Optional properties:
>>>> +
>>>> +nvidia,wp-gpios : GPIO of write-protect line, three cells in the form=
at:
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 phandle, parameter, flags
>>>
>>> Doesn't the number of cells depend on the GPIO controller binding?
>>
>> Yes, but this is the binding Tegra uses.
>
> Still, it doesn't belong in the NAND binding. =A0Maybe a future chip wants
> to use this NAND binding but a different GPIO binding. =A0If nothing else,
> people tend to copy-and-paste such descriptions. =A0We've still got people
> adding bindings for Freescale devices saying interrupts are encoded as a
> pair of cells, even though the interrupt controller now uses four cells
> per interrupt.

OK I see - are you are saying that we should just say something like:

"nvidia,wp-gpios : GPIO of write-protect line, as defined by gpio bindings"

>
> -Scott
>

Regards,
Simon
