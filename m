From: Li Yang <leoli@freescale.com>
Subject: Re: [PATCH v2 07/10] dts/ls2085a: Update DTSI to add support of
 various peripherals
Date: Thu, 1 Oct 2015 17:41:56 -0500
Message-ID: <CADRPPNT_DCruM-+nfwQnGwkuLgqMtwRJdcBuRJ06Onr93nSe=w@mail.gmail.com>
References: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
	<CAL_Jsq+9izV8vkrF1tK96M-VRGTMJ+GN5o=RsnCBDcnh-at5kA@mail.gmail.com>
	<CALRxmdC9ZzGiw6CVnVTqhH1xvA-P9s8cpYbk8DoVq7CodFS0VA@mail.gmail.com>
	<CY1PR0301MB0748A8F37E3FBE1922AF9D3F874C0@CY1PR0301MB0748.namprd03.prod.outlook.com>
	<CADRPPNRz-yM_48HvHYv3r31u_b_tHkAjg5H5r+V2mE2=oJTGDA@mail.gmail.com>
	<1443736737.5336.158.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1443736737.5336.158.camel@freescale.com>
Sender: linux-clk-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Shaohui Xie <Shaohui.Xie@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Huan Wang <alison.wang@freescale.com>, Sharma Bhupesh <bhupesh.sharma@freescale.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Singh Jaiprakash <jaiprakash.singh@freescale.com>, Stuart Yoder <stuart.yoder@freescale.com>, Will Deacon <will.deacon@arm.com>, "Lian M.H." <Minghuan.Lian@freescale.com>, Liu Gang <Gang.Liu@freescale.com>, Rob Herring <robherring2@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Badola Nikhil-B46172 <nikhil.badola@freescale.com>, Bhupesh SHARMA <bhupesh.linux@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Lu Y.B." <yangbo.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 1, 2015 at 4:58 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Thu, 2015-10-01 at 16:42 -0500, Li Yang wrote:
>> On Thu, Oct 1, 2015 at 3:05 PM, Stuart Yoder <stuart.yoder@freescale.com>
>> wrote:
>> > Hi Rob,
>> >
>> > Had a question about your comments on the patch below.
>> >
>> > You singled out 3 nodes (gic,uart,clockgen) and said "This should be
>> > under a bus node."
>> >
>> > What is special about those 3 nodes types?  There are a bunch of other
>> > memory
>> > mapped SoC devices as well in the DTS.
>> >
>> > I skimmed the dts files under arch/arm64 and it looks like most have a
>> > simple-bus
>> > SoC node like this where SoC devices are under:
>> >
>> >         soc {
>> >                 #address-cells = <2>;
>> >                 #size-cells = <2>;
>> >                 compatible = "simple-bus";
>> >                 ranges;
>> >
>> > Is that what you are looking for-- for all SoC devices?
>>
>> I think the key is to have the soc node and have all the on-chip
>> devices defined underneath it.
>>
>> I read the following from the booting-without-of.txt document:
>>
>>   f) the /soc<SOCname> node
>>
>>   This node is used to represent a system-on-a-chip (SoC) and must be
>>   present if the processor is a SoC. The top-level soc node contains
>>   information that is global to all devices on the SoC. The node name
>>   should contain a unit address for the SoC, which is the base address
>>   of the memory-mapped register set for the SoC. The name of an SoC
>>   node should start with "soc", and the remainder of the name should
>>   represent the part number for the soc.  For example, the MPC8540's
>>   soc node would be called "soc8540".
>>
>> A lot of device trees didn't follow the soc<SOCname> naming scheme and
>> just used "soc" as the node name.  I am not sure if we want to enforce
>> the naming in the future or update the document to make it more relax.
>
> Update the document.  Having the SoC name in the node name was a pain, which
> is why we don't do it anymore.  Ideally, this text should be moved into a
> binding for Freescale PPC/LS SoCs.  It really doesn't have the broad
> applicability that this historical document suggests, and even on our SoCs it
> doesn't represent the entire SoC.  It represents CCSR/IMMR.

Having the soc node to represent the CCSR space is a Freescale
specific thing.  But using the soc node to be the parent for all the
on-chip devices seems to be a good practice for all device trees.  I
do think we should maintain a standard for the top level nodes of a
device tree.

Regards,
Leo
