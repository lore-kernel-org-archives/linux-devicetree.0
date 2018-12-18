From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY
 driver
Date: Tue, 18 Dec 2018 19:46:13 +0530
Message-ID: <c5ccf173-d0f3-70f4-f8e3-777fd3339b68@ti.com>
References: <20181127100722.9993-1-shawn.guo@linaro.org>
 <20181127100722.9993-3-shawn.guo@linaro.org>
 <b0d02b1c-cc44-69fe-0765-84caf76eaea1@ti.com> <20181204060104.GA11391@dragon>
 <20181217003434.GA7208@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217003434.GA7208@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 17/12/18 6:04 AM, Shawn Guo wrote:
> On Tue, Dec 04, 2018 at 02:01:07PM +0800, Shawn Guo wrote:
>> Hi Kishon,
>>
>> On Tue, Dec 04, 2018 at 10:38:19AM +0530, Kishon Vijay Abraham I wrote:
>>> Hi,
>>>
>>> On 27/11/18 3:37 PM, Shawn Guo wrote:
>>>> It adds Synopsys 28nm Femto High-Speed USB PHY driver support, which
>>>> is usually paired with Synopsys DWC3 USB controllers on Qualcomm SoCs.
>>>
>>> Is this Synopsys PHY specific to Qualcomm or could it be used by other vendors
>>> (with just changing tuning parameters)? If it could be used by other vendors
>>> then it would make sense to add this PHY driver in synopsys directory.
>>
>> My knowledge is that this Synopsys PHY is specific to Qualcomm SoCs.
>> @Sriharsha, correct me if I'm wrong.
> 
> Kishon,
> 
> Do you have any further comments on the patches?  We are close the 4.21
> merge window, and I really hope they can hit mainline with 4.21 release.
> Thanks.

Aren't we waiting for feedback from Sriharsha?

-Kishon
