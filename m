From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 0/4] bam dma fixes and one dt extension
Date: Wed, 6 Apr 2016 02:06:47 +0300
Message-ID: <57044507.7020207@linaro.org>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
 <20160405213317.GB3873@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160405213317.GB3873@hector.attlocal.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andy Gross <agross@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/06/2016 12:33 AM, Andy Gross wrote:
> On Tue, Dec 01, 2015 at 11:14:55AM +0200, Stanimir Varbanov wrote:
>> Here are three bam dma fixes, which I made during testing qcrypto
>> driver. The first one is a real fix, the second one is related to
>> peripherals on which the BAM IP is initialized by remote execution
>> environment, and the third one is a sleeping bug IMO.
>>
>> The last patch is a extension again for peripherals which BAM is
>> remotely controlled by other execution environment.
>>
>> All patches has been tested on db410c board with apq8016.
>>
> 
> Stan,
> 
> Can you resend these patches w/ updates?  Or at least the remote control patch
> if you can get that out faster.  And also include the dmaengine list.

Done. Thanks for pining.

regards,
Stan
