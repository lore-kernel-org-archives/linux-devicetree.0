From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Mon, 2 Nov 2015 11:48:27 -0600
Message-ID: <5637A1EB.9080002@codeaurora.org>
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
To: Rob Herring <robh+dt@kernel.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2015 11:42 AM, Rob Herring wrote:
> On Mon, Nov 2, 2015 at 11:26 AM, Timur Tabi<timur@codeaurora.org>  wrote:
>> >On 11/02/2015 10:20 AM, Sinan Kaya wrote:
>>>> >>>
>>>> >>>
>>> >>Is there a good example I can look or a wiki about the device-tree
>>> >>naming conventions?
> There are many examples. Generally, it is the form of:
>
> <vendor>,<chip/soc>-<block name>
>

The problem is that we don't actually have an official name for this 
chip yet.


-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
