From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 2/3] dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
Date: Tue, 26 May 2015 09:15:31 -0700
Message-ID: <CAAtXAHcb2LeTH_qMBhxE+JgX=TktYJpswdteBnydDuRPsODgWg@mail.gmail.com>
References: <1432251450-26352-1-git-send-email-moritz.fischer@ettus.com>
	<1432251450-26352-3-git-send-email-moritz.fischer@ettus.com>
	<555EC20C.6010703@xilinx.com>
	<20150525190409.GS18303@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150525190409.GS18303@xsjsorenbubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, akpm@linux-foundation.org, Greg KH <gregkh@linuxfoundation.org>, mchehab@osg.samsung.com, Arnd Bergmann <arnd@arndb.de>, joe@perches.com, Jingoo Han <jingoohan1@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 25, 2015 at 12:04 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Fri, 2015-05-22 at 07:43AM +0200, Michal Simek wrote:
>> On 05/22/2015 01:37 AM, Moritz Fischer wrote:
>> > Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> > ---
>> >  .../bindings/mailbox/xilinx-mailbox.txt         | 40 ++++++++++++=
++++++++
>> >  1 file changed, 40 insertions(+)
>> >
>>
>> IRC the rule was to send binding first and then the driver.
>>
>> > diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mail=
box.txt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
>> > new file mode 100644
>> > index 0000000..e559743
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
>> > @@ -0,0 +1,40 @@
>> > +Xilinx Mailbox Driver
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +
>> > +Required properties:
>> > +- compatible :     "xlnx,mailbox-2.1".
>> > +- reg :    physical base address of the mailbox and length of
>> > +           memory mapped region.
>> > +- #mbox-cells:     Common mailbox binding property to identify th=
e number
>> > +           of cells required for the mailbox specifier. Should be=
 1.
>> > +
>> > +Optional properties:
>> > +- interrupt-parent :       interrupt source phandle.
>> > +- interrupts :             interrupt number. The interrupt specif=
ier format
>>
>> please be consistent with spacing around :. It doesn't look nice.
>>
>> > +                   depends on the interrupt controller parent.
>> > +
>> > +Example:
>> > +   mbox: mailbox@0x40400000 {
>>
>> remove 0x prefix here.
>>
>> > +           compatible =3D "xlnx,axi-mailbox-2.1";
>> > +           reg =3D <0x100 0x3c>;
>>
>> This is weird - it should start with 40400000.
>> Or is your physical address 0x100?
>>
>>
>> > +           interrupt-parent =3D <&intc>;
>> > +           interrupts =3D <5>;
>> > +           #mbox-cells =3D <1>;
>> > +   };
>> > +
>> > +Mailbox client
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +"mboxes" and the optional "mbox-names" (please see
>> > +Documentation/devicetree/bindings/mailbox/mailbox.txt for details=
). Each value
>> > +of the mboxes property should contain a phandle to the mailbox co=
ntroller
>> > +device node and second argument is the channel index. It must be =
0 (hardware
>> > +support only one channel).The equivalent "mbox-names" property va=
lue can be
>>
>> .<space>The
>>
>> > +used to give a name to the communication channel to be used by th=
e client user.
>> > +
>> > +Example:
>> > +   mclient0: mclient0@0x400 {
>>
>> ditto.
>>
>> > +           compatible =3D "client-1.0";
>> > +           reg =3D <0x400 0x10>;
>> > +           mbox-names =3D "mbox", "mbox-rx";
>
> This seems to consume two mailboxes but...
>
>> > +           mboxes =3D <&mbox 0>;
>
> ... this seems to describe only one, or am I mistaken?

Yes.
>
>         S=C3=B6ren

Thanks for your feedback, these were addressed in the v1 (should've bee=
n v2).

Thanks,

Moritz
