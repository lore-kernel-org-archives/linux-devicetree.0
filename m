From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of/address: Add of_iomap_nocache
Date: Thu, 04 Aug 2011 03:12:54 -0700 (PDT)
Message-ID: <20110804.031254.836213129500890372.davem@davemloft.net>
References: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: davidb@codeaurora.org
Cc: grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: David Brown <davidb@codeaurora.org>
Date: Thu,  4 Aug 2011 02:53:49 -0700

> Add uncached mappings from devicetree nodes similar to regular io
> mappings.
> 
> Signed-off-by: David Brown <davidb@codeaurora.org>

You'll need to add a sparc implementation.
