From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/4] of/device: Replace of_device with platform_device
 in includes and core code
Date: Thu, 22 Jul 2010 22:50:58 -0700 (PDT)
Message-ID: <20100722.225058.178805105.davem@davemloft.net>
References: <20100722222600.21557.34167.stgit@angua>
	<20100722223006.21557.84275.stgit@angua>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100722223006.21557.84275.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: sfr@canb.auug.org.au, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 22 Jul 2010 16:30:06 -0600

> of_device is currently just an #define alias to platform_device until it
> gets removed entirely.  This patch removes references to it from the
> include directories and the core drivers/of code.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Acked-by: David S. Miller <davem@davemloft.net>
