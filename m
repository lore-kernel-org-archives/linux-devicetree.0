From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 4/6] staging: fpga manager: add driver for socfpga
 fpga manager
Date: Fri, 19 Dec 2014 08:30:53 +0100
Message-ID: <6cfe4d79d058475282c1ed8b1ac15852@BN1AFFO11FD035.protection.gbl>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
 <1418835289-15752-5-git-send-email-atull@opensource.altera.com>
 <6eecb422024845acaffe10e4c81faac9@BN1AFFO11FD047.protection.gbl>
 <alpine.DEB.2.02.1412181456530.30233@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1412181456530.30233@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>, Michal Simek <michal.simek@xilinx.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguye
List-Id: devicetree@vger.kernel.org

On 12/18/2014 09:59 PM, atull wrote:
> On Thu, 18 Dec 2014, Michal Simek wrote:
> 
> Hi Michal,
> 
>>> +
>>> +	/* Write out remaining non 32-bit chunks. */
>>> +	switch (count) {
>>> +	case 3:
>>> +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x00ffffff);
>>> +		break;
>>> +	case 2:
>>> +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x0000ffff);
>>> +		break;
>>> +	case 1:
>>> +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x000000ff);
>>> +		break;
>>> +	default:
>>> +		/* This will never happen. */
>>
>> why not just return any error code here even if this can't happen.
>>
> 
> OK. Will be in v6.
> 
>>
>> add it to one line.
>>
>> The rest is looks good to me. I think this is good to go in.
>>
>> Acked-by: Michal Simek <michal.simek@xilinx.com>
>>
>> Thanks,
>> Michal
>>
> 
> Thanks for the feedback.  So patches 1-4 look good now?

Will look at them.

M

