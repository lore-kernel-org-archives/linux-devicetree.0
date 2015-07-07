From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCHv6 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
Date: Tue, 7 Jul 2015 10:20:51 +0530
Message-ID: <CABb+yY0L1yFEhwHfRR553hFrK4v6=8p3q8w9ugwTdfrAre6OOw@mail.gmail.com>
References: <1436202963-16922-1-git-send-email-moritz.fischer@ettus.com>
	<1436202963-16922-2-git-send-email-moritz.fischer@ettus.com>
	<20150706172727.GH6550@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150706172727.GH6550@xsjsorenbubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mchehab@osg.samsung.com, Arnd Bergmann <arnd@arndb.de>, joe@perches.com, jingoohan1@gmail.com, Devicetree List <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 6, 2015 at 10:57 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Mon, 2015-07-06 at 10:16AM -0700, Moritz Fischer wrote:
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>  .../devicetree/bindings/mailbox/xilinx-mailbox.txt | 44 +++++++++++=
+++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/xilinx=
-mailbox.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbo=
x.txt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
>> new file mode 100644
>> index 0000000..97b81f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
>> @@ -0,0 +1,44 @@
>> +Xilinx Mailbox Driver
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Required properties:
>> +- compatible       : "xlnx,mailbox-2.1".
>> +- reg              :  physical base address of the mailbox and leng=
th of
>> +                      memory mapped region.
>> +- #mbox-cells      :  common mailbox binding property to identify t=
he number
>> +                      of cells required for the mailbox specifier, =
should be 0
>> +- clocks           :  phandle to clock provider
>> +- clock-names      :  must be 'mbox'
>> +
>> +Optional properties:
>> +- interrupt-parent : interrupt source phandle
>> +- interrupts       : interrupt number, The interrupt specifier form=
at
>> +                     depends on the interrupt controller parent.
>> +
>> +Example:
>> +     mbox: mailbox@40400000 {
>> +             compatible =3D "xlnx,mailbox-2.1";
>> +             reg =3D <0x40400000 0x100>;
>> +             interrupt-parent =3D <&intc>;
>> +             interrupts =3D <5>;
>> +             #mbox-cells =3D <0>;
>> +             clocks =3D <&clkc 15>;
>> +             clock-names =3D "mbox";
>> +     };
>> +
>> +Mailbox client
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +"mboxes" and the optional "mbox-names" (please see
>> +Documentation/devicetree/bindings/mailbox/mailbox.txt for details).=
 Each value
>> +of the mboxes property should contain a phandle to the mailbox cont=
roller
>> +device node and second argument is the channel index. It must be 0 =
(hardware
>> +support only one channel). The equivalent "mbox-names" property val=
ue can be
>> +used to give a name to the communication channel to be used by the =
client user.
>> +
>> +Example:
>> +     mclient0: mclient0@400 {
>> +             compatible =3D "client-1.0";
>> +             reg =3D <0x400 0x10>;
>> +             mbox-names =3D "mbox";
>> +             mboxes =3D <&mbox 0>;
>
> Sorry, to bring this up again, but I'm confused regarding the #mbox-c=
ells
> thing. Above it says #mbox-cells is 0. In that case, shouldn't the
> 'mboxes' property not only be '<&mbox>'?
>
Yeah, this is inconsistent. Either provide your own of_xlate() for
#cells=3D0  or have #cells=3D1 to use stock of_xlate() and specify <&mb=
ox
0> for the channel.
