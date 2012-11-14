From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] drivers/of: Constify device_node->name and
 ->path_component_name
Date: Wed, 14 Nov 2012 17:33:04 -0500 (EST)
Message-ID: <20121114.173304.405703188822325414.davem@davemloft.net>
References: <1352932107-14782-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1352932107-14782-1-git-send-email-grant.likely@secretlab.ca>
Sender: sparclinux-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org


You're making other changes here, such as the kstrdup() stuff,
seperate that into another patch.
