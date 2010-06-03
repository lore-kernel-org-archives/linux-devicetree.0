From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of/net: fs_enet/mii-bitbang.c: fix build breakage
Date: Wed, 2 Jun 2010 20:13:33 -0600
Message-ID: <20100603021333.GH27186@angua.secretlab.ca>
References: <1275527214-1000-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1275527214-1000-1-git-send-email-agust@denx.de>
Sender: netdev-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 03, 2010 at 03:06:54AM +0200, Anatolij Gustschin wrote:
> Fixes build error caused by the OF device_node
> pointer being moved into struct device
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  drivers/net/fs_enet/mii-bitbang.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

applied

