From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Thu, 28 Apr 2016 11:10:34 +0200
Message-ID: <5721D38A.8010501@metafoo.de>
References: <1461740729-30715-1-git-send-email-appanad@xilinx.com>
 <57206632.7010508@metafoo.de>
 <C246CAC1457055469EF09E3A7AC4E11A4A57B840@XAP-PVEXMBX01.xlnx.xilinx.com>
 <5720B333.4000804@metafoo.de>
 <C246CAC1457055469EF09E3A7AC4E11A4A57C2E2@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A57C2E2@XAP-PVEXMBX01.xlnx.xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "luis@debethencourt.com" <luis@debethencourt.com>, Anirudha Sarangi <anirudh@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/28/2016 11:00 AM, Appana Durga Kedareswara Rao wrote:
> Hi Lars,
> 
> 	Thanks for the review...
> 
>> -----Original Message-----
>> From: Lars-Peter Clausen [mailto:lars@metafoo.de]
>> Sent: Wednesday, April 27, 2016 6:10 PM
>> To: Appana Durga Kedareswara Rao <appanad@xilinx.com>;
>> robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
>> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
>> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
>> vinod.koul@intel.com; dan.j.williams@intel.com; moritz.fischer@ettus.com;
>> laurent.pinchart@ideasonboard.com; luis@debethencourt.com; Anirudha
>> Sarangi <anirudh@xilinx.com>; Punnaiah Choudary Kalluri
>> <punnaia@xilinx.com>
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; dmaengine@vger.kernel.org
>> Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
>> device tree binding documentation
>>
>> On 04/27/2016 09:33 AM, Appana Durga Kedareswara Rao wrote:
>>> Hi Lars,
>>>
>>>> -----Original Message-----
>>>> From: Lars-Peter Clausen [mailto:lars@metafoo.de]
>>>> Sent: Wednesday, April 27, 2016 12:42 PM
>>>> To: Appana Durga Kedareswara Rao <appanad@xilinx.com>;
>>>> robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
>>>> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
>>>> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
>>>> vinod.koul@intel.com; dan.j.williams@intel.com; Appana Durga
>>>> Kedareswara Rao <appanad@xilinx.com>; moritz.fischer@ettus.com;
>>>> laurent.pinchart@ideasonboard.com; luis@debethencourt.com; Anirudha
>>>> Sarangi <anirudh@xilinx.com>; Punnaiah Choudary Kalluri
>>>> <punnaia@xilinx.com>
>>>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux- kernel@vger.kernel.org; dmaengine@vger.kernel.org
>>>> Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp
>>>> dma device tree binding documentation
>>>>
>>>> On 04/27/2016 09:05 AM, Kedareswara rao Appana wrote:
>>>> [...]
>>>>> +- xlnx,include-sg	: Indicates the controller to operate in simple or
>>>>> +			  scatter gather dma mode
>>>>> +- xlnx,ratectrl		: Scheduling interval in terms of clock cycles for
>>>>> +			  source AXI transaction
>>>>> +- xlnx,overfetch	: Tells whether the channel is allowed to over
>>>>> +			  fetch the data
>>>>> +- xlnx,src-issue	: Number of AXI outstanding transactions on source
>>>> side
>>>>> +- xlnx,src-burst-len	: AXI length for data read. Support only power of
>>>>> +			  2 byte values.
>>>>> +- xlnx,dst-burst-len	: AXI length for data write. Support only power of
>>>>
>>>> These are all software runtime configuration parameters that you'd
>>>> want to change at runtime depending on which peripheral you are
>>>> targeting with a specific DMA transfer. These really do not belong into the
>> devicetree.
>>>
>>> You mean to have a separate config structure in the driver and handle
>>> the above parameters Through that structure???
>>>
>>> I understand that above will work for slave dma transfer types what
>>> about memory to memory Transfers where we don't have provision to the use
>> this parameters...
>>
>> These parameters are just as application specific as e.g. the DMA
>> source/destination address or the DMA transfer length. If you want to use the
>> DMA controller in a different configuration you'd have to re-compile the DTB
>> and reboot your board, that is not really practical. Especially considering that
>> you'd typically have multiple applications using the DMA controller in different
>> configurations concurrently. In general if I have to reconfigure the DT depending
>> on what application software is running something is fundamentally broken.
>>
>> Derive these parameters at runtime depending on the requested transfer. E.g.
>> some transfer types only work in SG mode, others only work in non-SG modes.
>> For those which can work in both modes choose the one that is more efficient.
>> Similar for the other parameters.
> 
> Ok will fix in the next version...
> Will use module_params for the above properties.

Sorry, but that is just as broken. You need to derive those parameters from
the DMA transfer as they are transfer specific.
