From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of: Only compile OF_DYNAMIC on PowerPC pseries and
 iseries
Date: Wed, 15 Feb 2012 16:42:45 -0500 (EST)
Message-ID: <20120215.164245.2208394038607502286.davem@davemloft.net>
References: <1329240330-3539-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329240330-3539-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 14 Feb 2012 10:25:30 -0700

> Only two architectures use the OF node reference counting and reclaim bits.
> There is no need to compile it for the rest of the PowerPC platforms or for
> any of the other architectures.  This patch makes iseries and pseries
> select CONFIG_OF_DYNAMIC, and makes it default to off for everything else.
> 
> It is still safe to turn on CONFIG_OF_DYNAMIC on all architectures, it just
> isn't necessary.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Acked-by: David S. Miller <davem@davemloft.net>
