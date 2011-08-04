From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/address: Add of_iomap_nocache
Date: Thu, 04 Aug 2011 10:52:58 -0500
Message-ID: <4E3AC05A.1070208@gmail.com>
References: <1312451629-28036-1-git-send-email-davidb@codeaurora.org> <20110804.031254.836213129500890372.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20110804.031254.836213129500890372.davem@davemloft.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: davidb@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/04/2011 05:12 AM, David Miller wrote:
> From: David Brown <davidb@codeaurora.org>
> Date: Thu,  4 Aug 2011 02:53:49 -0700
> 
>> Add uncached mappings from devicetree nodes similar to regular io
>> mappings.
>>
>> Signed-off-by: David Brown <davidb@codeaurora.org>
> 
> You'll need to add a sparc implementation.

Sparc just defines ioremap_nocache to ioremap, so is that really needed?

Rob
