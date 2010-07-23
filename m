From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 3/4] sparc: remove references to of_device and
 to_of_device
Date: Thu, 22 Jul 2010 22:51:15 -0700 (PDT)
Message-ID: <20100722.225115.160202643.davem@davemloft.net>
References: <20100722222600.21557.34167.stgit@angua>
	<20100722223016.21557.40832.stgit@angua>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100722223016.21557.40832.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: sfr@canb.auug.org.au, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 22 Jul 2010 16:30:16 -0600

> of_device is just a #define alias to platform_device.  This patch
> replaces all references to it with platform_device.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Acked-by: David S. Miller <davem@davemloft.net>
