From: okaya@codeaurora.org
Subject: Re: [PATCH V15 0/4] dma: add Qualcomm Technologies HIDMA driver
Date: Sun, 20 Mar 2016 09:30:50 -0400
Message-ID: <115f141fa85206e54783964bcd25be32@codeaurora.org>
References: <1457732994-11175-1-git-send-email-okaya@codeaurora.org>
 <20160320093926.GM2490@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160320093926.GM2490@localhost>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2016-03-20 05:39, Vinod Koul wrote:
> On Fri, Mar 11, 2016 at 04:49:50PM -0500, Sinan Kaya wrote:
>> 
>> Sinan Kaya (4):
>>   dma: qcom_hidma: implement lower level hardware interface
>>   dma: qcom_hidma: add debugfs hooks
>>   dma: qcom_hidma: add support for object hierarchy
>>   dma: qcom_hidma: read the channel id from HW
> 
> Any reason why you insist on using subsystem name as dma even when 
> asked to
> change..

Forgotten. I can fix that.
