From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
Date: Thu, 27 Aug 2015 13:11:30 +0530
Message-ID: <CAGnW=BYMnOFTaMQJtLXZ9ckCEHs+gCOCQR0VQFfO4HP=SMHBDQ@mail.gmail.com>
References: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
	<CALHRZuqFtaRFNd9D=a+x2rZ2848ZOGYbTkSWCHxNPcW_NvocxA@mail.gmail.com>
	<20150827043339.GA29157@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150827043339.GA29157@shlinux2>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: sundeep subbaraya <sundeep.lkml@gmail.com>, Nathan Sullivan <nathan.sullivan@ni.com>, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Aug 27, 2015 at 10:03 AM, Peter Chen <peter.chen@freescale.com> wrote:
> On Thu, Aug 27, 2015 at 10:59:22AM +0530, sundeep subbaraya wrote:
>> Hi,
>>
>>
>> On Wed, Aug 26, 2015 at 8:57 PM, Nathan Sullivan <nathan.sullivan@ni.com> wrote:
>> > The Xilinx Zynq udc does not need the CI_HDRC_DISABLE_STREAMING flag,
>> > unlike the default platform data.  Add platform data specific to the
>> > Zynq udc.
>> >
>> > Based on a patch by the same name from the Xilinx vendor tree.
>>
>> I am that Xilinx guy who sent this patch :). It is in Xilinx tree as
>> temporary fix and
>> I did not debug further why UDC works only when streaming is enabled.
>> Probably this is right time to post my question here.
>> I was expecting like:
>> Streaming disabled - both low bandwidth and high bandwidth systems
>> should work fine
>> Streaming enabled - only for high bandwidth systems
>> but this is not the case, Zynq UDC works only when Streaming is enabled.
>> Please correct me if I am wrong.
>
> You are right, stream mode disabled should work at anytime.
> It is so strange why zynq UDC only works when stream mode is enabled.

I am referring the section 8.5.2 in Synopsys usb 2.0 HS controllervDoc 2.20a,
 this is what it says about SDIS (streaming mode disable option)

Before activating this mode, the user must check if the TX latency
buffers per endpoint are able to
accommodate at least one entire maximum size packet. The RX buffer
size must, at least, double the TX
buffer size per endpoint. To optimize the stream disable performance,
system bus burst must be set as high
as possible.
When the stream disable mode is used, the burst size (VUSB_HS_RX_BURST
and VUSB_HS_TX_BURST)
must be a integer sub-multiple of the latency buffer size
(VUSB_HS_RX_DEPTH for RX buffer and
VUSB_HS_TX_CHAN for the TX buffer). If this is not respected the
controller will not work properly in stream
disable mode.
The stream disable mode should just be used in situations where the
available system bandwidth is low or the
system bus access latency is high, in order to avoid underruns and
overruns in the latency buffers. This works
for all types of endpoints, except for ISO endpoints.
Such a system can't ensure the real time support that the ISO
endpoints require, so the ISO endpoints are not
supported when the SDIS bit is set.

Definitely we need to root cause why disable streaming mode is not
working for zynq but from controller spec
point of view it is possible that controller not work properly in
stream disable mode.

Regards,
Punnaiah

>
> Peter
>>
