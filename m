From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] of/device: Replace struct of_device with struct
 of_platform
Date: Sun, 01 Aug 2010 01:05:01 -0700 (PDT)
Message-ID: <20100801.010501.27813939.davem@davemloft.net>
References: <20100801074831.1099.3318.stgit@angua>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20100801074831.1099.3318.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: sfr@canb.auug.org.au, monstr@monstr.eu, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org, sparclinux@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Subject should say "struct platform_device" not "struct of_platform",
I think :-)

