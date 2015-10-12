From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 1/3] doc: dt: fpga: Added Documentation for Xilinx Zynq
 FPGA manager.
Date: Mon, 12 Oct 2015 13:41:42 -0700
Message-ID: <CAAtXAHf116OE5zj+avurZknm6fyERWJkQpaKEkRd8mTujQyxVQ@mail.gmail.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
	<1444344307-22509-2-git-send-email-moritz.fischer@ettus.com>
	<20151009160423.GL10631@jcartwri.amer.corp.natinst.com>
	<561B7DF0.6090601@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561B7DF0.6090601@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Josh Cartwright <joshc@ni.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, robh+dt@kernel.org, "pawel.moll@arm.com" <pawel.moll@arm.com>, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Michal, Josh,

On Mon, Oct 12, 2015 at 2:31 AM, Michal Simek <michal.simek@xilinx.com> wrote:
> On 10/09/2015 06:04 PM, Josh Cartwright wrote:
>> On Fri, Oct 09, 2015 at 12:45:05AM +0200, Moritz Fischer wrote:
>>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>>> ---
>>>  .../bindings/fpga/xilinx-zynq-fpga-mgr.txt         | 26 ++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
>>> new file mode 100644
>>> index 0000000..82ffda8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
>>> @@ -0,0 +1,26 @@
>>> +Xilinx Zynq FPGA Manager
>>> +
>>> +Required properties:
>>> +- compatible:               should contain "xlnx,zynq-devcfg-1.0"
>>> +- reg:                      base address and size for memory mapped io
>>> +- interrupt parent: interrupt source phandle
>>
>> I think you mean 'interrupt-parent', with the hyphen.
>
> yes.
>
>>
>> Actually, this isn't really a 'required' property of this node, as it
>> could be specified in a parent node.
>
> yes. Normally interrupt-parent is not listed as required property in the
> binding doc. Some docs listed it as optional property.

Alright, will correct typo, and mark it as optional unless someone
feels strongly against having the optional.
>
> Thanks,
> Michal

Thanks for the feedback,

Moritz
