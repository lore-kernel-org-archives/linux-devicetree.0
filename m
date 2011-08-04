From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of/address: Add of_iomap_nocache
Date: Thu, 04 Aug 2011 16:08:01 -0700 (PDT)
Message-ID: <20110804.160801.410790028578990791.davem@davemloft.net>
References: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
	<20110804.031254.836213129500890372.davem@davemloft.net>
	<4E3AC05A.1070208@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <4E3AC05A.1070208@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robherring2@gmail.com
Cc: davidb@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2@gmail.com>
Date: Thu, 04 Aug 2011 10:52:58 -0500

> On 08/04/2011 05:12 AM, David Miller wrote:
>> From: David Brown <davidb@codeaurora.org>
>> Date: Thu,  4 Aug 2011 02:53:49 -0700
>> 
>>> Add uncached mappings from devicetree nodes similar to regular io
>>> mappings.
>>>
>>> Signed-off-by: David Brown <davidb@codeaurora.org>
>> 
>> You'll need to add a sparc implementation.
> 
> Sparc just defines ioremap_nocache to ioremap, so is that really needed?

Yes because if someone uses this of_iomap_nocache() in a driver the
sparc build is going to fail, we need as least the define to make
it equal to of_iomap() as David did in his follow-on patch.
