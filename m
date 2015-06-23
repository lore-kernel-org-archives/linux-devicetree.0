From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCHv5 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
Date: Tue, 23 Jun 2015 11:23:51 -0700
Message-ID: <CAAtXAHd9zcrUGpYcPFaMDF-eDMN+-t4tuB7KmH7A2B1AzW+psg@mail.gmail.com>
References: <1435082402-29239-1-git-send-email-moritz.fischer@ettus.com>
	<1435082402-29239-2-git-send-email-moritz.fischer@ettus.com>
	<20150623180513.GE20178@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150623180513.GE20178@xsjsorenbubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, akpm@linux-foundation.org, Greg KH <gregkh@linuxfoundation.org>, mchehab@osg.samsung.com, Arnd Bergmann <arnd@arndb.de>, joe@perches.com, Jingoo Han <jingoohan1@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 23, 2015 at 11:05 AM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> On Tue, 2015-06-23 at 11:00AM -0700, Moritz Fischer wrote:
>> Changes from v4:
>> - Changed mbox cells property from 1 to 0
>> - Fixed interrupt property
>>
>> Changes from v3:
>> - Changed reg size to 0x100
>>
>> Changes from v2:
>> - Addressed Michal's stylistic comments
>> - Fixed typo in compatible string
>>
>> Changes from v1:
>> - Added common clock framework support
>>
>> Changes from v0:
>> - Fixed example bindings
>>
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
>> index 0000000..269c026
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
should be 1
>
> I guess this should say "should be 0" now?

D'Oh, yeah ...

Moritz
