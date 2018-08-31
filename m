From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 6/9] net: bcmgenet: fix OF child-node lookup
Date: Thu, 30 Aug 2018 17:47:33 -0700
Message-ID: <683bdf11-a662-d17e-8bc5-b3cfd238e463@gmail.com>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-7-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827082153.22537-7-johan@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On 08/27/2018 01:21 AM, Johan Hovold wrote:
> Use the new of_get_compatible_child() helper to lookup the mdio child
> node instead of using of_find_compatible_node(), which searches the
> entire tree from a given start node and thus can return an unrelated
> (i.e. non-child) node.
> 
> This also addresses a potential use-after-free (e.g. after probe
> deferral) as the tree-wide helper drops a reference to its first
> argument (i.e. the node of the device being probed).
> 
> Fixes: aa09677cba42 ("net: bcmgenet: add MDIO routines")
> Cc: stable <stable@vger.kernel.org>     # 3.15
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: David S. Miller <davem@davemloft.net>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
