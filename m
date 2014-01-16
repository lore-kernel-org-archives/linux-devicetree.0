From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] dt: Document a compatible entry for MDIO ethernet Phys
Date: Thu, 16 Jan 2014 15:30:48 -0600
Message-ID: <CAL_JsqJ+0kyPUmRQr0BVnR+2GrOdLOMqjzgghZ9HnhODtKtwOw@mail.gmail.com>
References: <20131210193947.GU5429@obsidianresearch.com>
	<CAL_JsqLpWSXd44ErAs=+xYS8ESaBSY6EJEneZFYqtbpfyM4iPQ@mail.gmail.com>
	<20140108211610.GC12358@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140108211610.GC12358@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 8, 2014 at 3:16 PM, Jason Gunthorpe
<jgunthorpe@obsidianresearch.com> wrote:
> On Wed, Jan 08, 2014 at 12:37:03PM -0600, Rob Herring wrote:
>
>> > Patch to parse this compatible string to follow if this binding is
>> > acceptable.
>>
>> One minor comment below, otherwise:
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> K, I'll send a series hopefully in a few weeks after some travel.
>
>> > +  If the phy's identifier is known then the list may contain an entry
>> > +  of the form: "ethernet-phy-idAAAA,BBBB" where
>>
>> I think this should be a period rather than a comma as we are not
>> separating a vendor ID from product ID.
>
> OK, that makes sense.
>
> Inspecting further, the format of the 32 bit AAAABBBB is actually
> broken out into:
>   OUI[3:18] || OUI[19:24] || MODEL[5:0] || REV[3:0]
>
> So a possible choice with the 'vendor ID,product ID' split is:
>   ethernet-phyOOOOO,MM.R
>
> xlate is:
>
> AAAABBBB = ((OOOOO >> 6) << 16) |
>            ((OOOOO & 0x3f) << 10) |
>            (MM << 4) |
>            R
>
> Which doesn't textually match the register value, or any other
> phy ID constants in the kernel, however makes more sense from the
> 'vendor ID,product ID' angle.
>
> Eg a Marvell 88E1310 would encode into the two options as:
>   ethernet-phy05043,29.0
>   ethernet-phy-id0141.0e90
>
> And the kernel has constants like this:
> include/linux/marvell_phy.h:#define MARVELL_PHY_ID_88E1318S 0x01410e90
>
> In light of this detail do you still like 'ethernet-phy-id0141.0e90' ?

I'm fine either way. Separating out the OUI had crossed my mind. That
probably does make the value in the DT more meaningful. Is the OUI
used anywhere in the kernel?

Rob
