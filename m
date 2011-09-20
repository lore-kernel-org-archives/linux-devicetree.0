From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: gic: add OF based initialization
Date: Mon, 19 Sep 2011 18:22:15 -0600
Message-ID: <CACxGe6vrksxkEhsKm5zWG5P3g0wqOBxsM3yqtP4yk0Us-=EPWw@mail.gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
	<1316017900-19918-6-git-send-email-robherring2@gmail.com>
	<CAJuYYwSFu2HC+u2NY41+yw9tEyy85RKa4Dpm3SL+jbwS_OOA0A@mail.gmail.com>
	<4E71CE5D.9030900@ti.com> <4E71F978.6020402@gmail.com>
	<4E72030F.1090300@ti.com>
	<4E722B2D.4050307@gmail.com> <4E76615C.3000005@gmail.com>
	<4E77310A.3000106@ti.com> <4E774847.3020104@gmail.com>
	<CACxGe6v9nd5f5x-eu9hUyAqdS1+p3h6ixyutECYLdNo3ewDH0w@mail.gmail.com>
	<4E77B9E3.40004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E77B9E3.40004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 3:53 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/19/2011 04:14 PM, Grant Likely wrote:
>> * ARM Generic Interrupt Controller
>>
>> ARM SMP cores are often associated with a GIC, providing per processor
>> interrupts (PPI), shared processor interrupts (SPI) and software
>> generated interrupts (SGI).
>>
>> Primary GIC is attached directly to the CPU and typically has PPIs and S=
GIs.
>> Secondary GICs are cascaded into the upward interrupt controller and do =
not
>> have PPIs or SGIs.
>>
>> Main node required properties:
>>
>> - compatible : should be one of:
>> =A0 =A0 =A0 =A0"arm,cortex-a9-gic"
>> =A0 =A0 =A0 =A0"arm,arm11mp-gic"
>> - interrupt-controller : Identifies the node as an interrupt controller
>> - #interrupt-cells : Specifies the number of cells needed to encode an
>> =A0 interrupt source. =A0The type shall be a <u32> and the value shall b=
e 3.
>>
>> =A0 The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
>> interrupts.
>> =A0 The 2nd cell contains the interrupt number for the interrupt type.
>> SPI interrupts are in the range [0-987]. =A0PPI interrupts are in the
>> range [0-15].
>> =A0 The 3rd cell is the flags, encoded as follows:
>> =A0 =A0 =A0 =A0 bits[3:0] trigger type and level flags.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1 =3D low-to-high edge triggered
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 2 =3D high-to-low edge triggered
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 4 =3D active high level-sensitive
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 8 =3D active low level-sensitive
>> =A0 =A0 =A0 =A0 bits[15:8] PPI interrupt cpu mask. =A0Each bit correspon=
ds to
>> each of the 8 possible cpus attached to the GIC. =A0A bit set to '1'
>> indicated the interrupt is wired to that CPU. =A0Only valid for PPI
>> interrupts.
>>
> How about a cpu mask of 0 means SPI and non-zero means PPI? Then we can
> drop the first cell.

Cells are cheap, and it is better to be explicit.  It is certainly
easier to extend in the future too if the type cell is used.

g.
