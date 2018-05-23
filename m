From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 0/7] Add support for QCA8334 switch
Date: Wed, 23 May 2018 08:39:02 -0700
Message-ID: <29ea7cdd-5690-e39a-a2ef-4f48fbcb7659@gmail.com>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <vokac.m@gmail.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org



On 05/22/2018 11:20 PM, Michal Vokáč wrote:
> This series basically adds support for a QCA8334 ethernet switch to the
> qca8k driver. It is a four-port variant of the already supported seven
> port QCA8337. Register map is the same for the whole familly and all chips
> have the same device ID.
> 
> Major part of this series enhances the CPU port setting. Currently the CPU
> port is not set to any sensible defaults compatible with the xGMII
> interface. This series forces the CPU port to its maximum bandwidth and
> also allows to adjust the new defaults using fixed-link device tree
> sub-node.
> 
> Alongside these changes I fixed two checkpatch warnings regarding SPDX and
> redundant parentheses.

Looks great, thanks Michal! Do you have any features or things you are
working on that would be added later to the driver?

> 
> Changes in v3:
>  - Rebased on latest net-next/master.
>  - Corrected fixed-link documentation.
> 
> Michal Vokáč (7):
>   net: dsa: qca8k: Add QCA8334 binding documentation
>   net: dsa: qca8k: Add support for QCA8334 switch
>   net: dsa: qca8k: Enable RXMAC when bringing up a port
>   net: dsa: qca8k: Force CPU port to its highest bandwidth
>   net: dsa: qca8k: Allow overwriting CPU port setting
>   net: dsa: qca8k: Replace GPL boilerplate by SPDX
>   net: dsa: qca8k: Remove redundant parentheses
> 
>  .../devicetree/bindings/net/dsa/qca8k.txt          | 23 +++++++-
>  drivers/net/dsa/qca8k.c                            | 64 ++++++++++++++++++----
>  drivers/net/dsa/qca8k.h                            |  7 ++-
>  3 files changed, 79 insertions(+), 15 deletions(-)
> 

-- 
Florian
