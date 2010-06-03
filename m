From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of/crypto: n2_core.c: Fix build failures
Date: Wed, 02 Jun 2010 19:45:49 -0700 (PDT)
Message-ID: <20100602.194549.200117567.davem@davemloft.net>
References: <1275521741-11040-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1275521741-11040-1-git-send-email-y>
Sender: linux-crypto-owner@vger.kernel.org
To: agust@denx.de
Cc: linux-crypto@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, herbert@gondor.apana.org.au
List-Id: devicetree@vger.kernel.org

From: agust@denx.de
Date: Thu,  3 Jun 2010 01:35:41 +0200

> From: Anatolij Gustschin <agust@denx.de>
> 
> Fixes build errors caused by the:
> - OF device_node pointer being moved into struct device
> - removal of the match_table and name fields from
>   struct of_platform_driver
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

This is already fixed in the crypto GIT tree.
