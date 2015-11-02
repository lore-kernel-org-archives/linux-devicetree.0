From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Mon, 2 Nov 2015 13:49:35 -0500
Message-ID: <5637B03F.9090905@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org>
 <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
 <56378D38.9050509@codeaurora.org> <56379CD6.5020807@codeaurora.org>
 <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Timur Tabi <timur@codeaurora.org>
Cc: dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 11/2/2015 12:42 PM, Rob Herring wrote:
> Except I was suggesting not using 1.0 or 1.1. There is one main
> exception and that is Xilinx blocks, but they are releasing versions
> of blocks to customers. If "1.0" is not a well defined number, then
> don't use that. I'd be surprised if any SOC vendor had such well
> defined process around versioning of their IP blocks such that they
> are well documented and guaranteed such that every change will change
> the version.

Here is one.

I have two versions of the same IP. The first version in one chip has 
sw_version register that returns 1.0. The second version which has more 
capabilities has 1.1 in it.

Is it OK to use?

compatible="qcom,hidma-mgmt-1.0", "qcom,hidma-mgmt"

for now and

compatible="qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt"

later for the second chip? 1.1 is backwards compatible with 1.0 BTW.

Since the same IP goes into multiple chips, why would you list the chip 
name here and submit patches multiple times for each single chip.

or to follow what Timur did, I can do this.

"qcom,qdf2xxx-hidma-mgmt-1.0"

qdf2xxx would become the chip family.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
