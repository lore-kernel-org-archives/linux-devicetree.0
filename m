From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/6] arm: dts: Change PCIe INTx mapping for Cygnus
Date: Mon, 11 Jun 2018 17:55:20 -0700
Message-ID: <D95617BA-7C31-4737-9514-BA3F7B09DCE2@gmail.com>
References: <1527631130-20045-1-git-send-email-ray.jui@broadcom.com> <1527631130-20045-4-git-send-email-ray.jui@broadcom.com> <f5aa804e-3174-affd-1117-31b0a5b59fc5@gmail.com> <522816f9-c33f-ee58-619e-84ee86dba418@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <522816f9-c33f-ee58-619e-84ee86dba418@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On June 11, 2018 5:27:20 PM PDT, Ray Jui <ray=2Ejui@broadcom=2Ecom> wrote:
>
>
>On 6/11/2018 3:36 PM, Florian Fainelli wrote:
>> On 05/29/2018 02:58 PM, Ray Jui wrote:
>>> Change the PCIe INTx mapping to model the 4 INTx interrupts in the
>>> IRQ domain of the iProc PCIe controller itself
>>>
>>> Signed-off-by: Ray Jui <ray=2Ejui@broadcom=2Ecom>
>>> ---
>>>   arch/arm/boot/dts/bcm-cygnus=2Edtsi | 18 ++++++++++++++----
>>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/bcm-cygnus=2Edtsi
>b/arch/arm/boot/dts/bcm-cygnus=2Edtsi
>>> index 699fdf9=2E=2E6de21ef 100644
>>> --- a/arch/arm/boot/dts/bcm-cygnus=2Edtsi
>>> +++ b/arch/arm/boot/dts/bcm-cygnus=2Edtsi
>>> @@ -254,9 +254,14 @@
>>>   			compatible =3D "brcm,iproc-pcie";
>>>   			reg =3D <0x18012000 0x1000>;
>>>  =20
>>> +			interrupt-controller;
>>>   			#interrupt-cells =3D <1>;
>>> -			interrupt-map-mask =3D <0 0 0 0>;
>>> -			interrupt-map =3D <0 0 0 0 &gic GIC_SPI 100 IRQ_TYPE_NONE>;
>>> +			interrupt-map-mask =3D <0 0 0 7>;
>>> +			interrupt-map =3D <0 0 0 1 &pcie0 1>,
>>> +					<0 0 0 2 &pcie0 2>,
>>> +					<0 0 0 3 &pcie0 3>,
>>> +					<0 0 0 4 &pcie0 4>;
>>> +			interrupts =3D <GIC_SPI 100 IRQ_TYPE_NONE>;
>>=20
>> You would want to fix those IRQ_TYPE_NONE values as well because
>since
>> commit 83a86fbb5b56b5eed8a476cc3fe214077d7c4f49 ("irqchip/gic: Loudly
>> complain about the use of IRQ_TYPE_NONE") this is going to create
>some
>> nice warnings on boot=2E
>>=20
>> I am about to send fixes for NSP and HR2 since that's what I have
>access
>> to at the moment, but it would be good if you could send updates to
>the
>> Cygnus and NS2 DTS files?
>>=20
>> Thanks
>>=20
>
>Okay=2E Thanks for letting me know=2E How do you want this to be done for=
=20
>Cygnus and NS2?
>
>I guess I should have the fix patches to DTS done and sent out first,=20
>and then rebase this INTx patch series against the patches with the
>fix=2E
>
>Does that make sense to you?

Yes it does=2E As soon as v4=2E18-rc1 is tagged I will send the Device Tre=
e fixes pull request, if I can have yours for Cygnus and NS2 in the next fe=
w days I could lump those together=2E Then we can either base your changes =
off v4=2E18-rc2 or a later tag that already has the DTS fixes=2E

--=20
Florian
