From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 3/11] arch/sparc/kernel: Eliminate what looks like a
 NULL pointer dereference
Date: Fri, 04 Jun 2010 16:17:50 -0700 (PDT)
Message-ID: <20100604.161750.70215425.davem@davemloft.net>
References: <Pine.LNX.4.64.1005271432250.5422@ask.diku.dk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1005271432250.5422@ask.diku.dk>
Sender: sparclinux-owner@vger.kernel.org
To: julia@diku.dk
Cc: grant.likely@secretlab.ca, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 14:32:45 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> At the point of the test, action cannot be NULL, as it has been dereferenced
> in the code just above.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks Julia.
