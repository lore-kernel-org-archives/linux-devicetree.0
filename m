From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM: dts: zynq: Add OCM node
Date: Thu, 12 Feb 2015 11:40:34 +0100
Message-ID: <dd043ddc72d14c4a95d8f77b67b1acfd@BN1BFFO11FD015.protection.gbl>
References: <135fba212abd740584a2547903cc8d175417344c.1423736523.git.michal.simek@xilinx.com>
 <20150212102615.GC1245@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150212102615.GC1245@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 02/12/2015 11:26 AM, Mark Rutland wrote:
> On Thu, Feb 12, 2015 at 10:22:07AM +0000, Michal Simek wrote:
>> Add OCM node for all zynq boards. OCM location
>> can changed but for all current boards this
>> is the location where OCM is.`
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>> This patch is done based on discussion here.
>> https://lkml.org/lkml/2014/12/1/396
>>
>> There are some ways how to do it.
>> OCM location can be changed but board DTS files
>> can easily rewrite it.
>> The problem which there is that node has address
>> in it but maybe someone can suggest better solution.
> 
> Given that the node is so simple, can't this be pushed down into the
> board files? So long as the label is consistent anything else that's
> referring to it should still work.

ok. Let me send v2 with moving stuff to board file and reference bus.
(I expect you will want to use different solution but will see).

Thanks,
Michal
