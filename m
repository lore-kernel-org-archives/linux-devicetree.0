From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] of: Only compile OF_DYNAMIC on PowerPC pseries and
 iseries
Date: Thu, 16 Feb 2012 14:13:02 +1100
Message-ID: <1329361982.3772.44.camel@pasglop>
References: <1329240330-3539-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329240330-3539-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-02-14 at 10:25 -0700, Grant Likely wrote:
> Only two architectures use the OF node reference counting and reclaim bits.
> There is no need to compile it for the rest of the PowerPC platforms or for
> any of the other architectures.  This patch makes iseries and pseries
> select CONFIG_OF_DYNAMIC, and makes it default to off for everything else.
> 
> It is still safe to turn on CONFIG_OF_DYNAMIC on all architectures, it just
> isn't necessary.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: "David S. Miller" <davem@davemloft.net>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Cheers,
Ben.
