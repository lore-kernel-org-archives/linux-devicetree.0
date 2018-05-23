From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v3 0/7] Add support for QCA8334 switch
Date: Wed, 23 May 2018 15:47:30 -0400 (EDT)
Message-ID: <20180523.154730.2218442546759769824.davem@davemloft.net>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-2
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vokac.m@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

From: "Michal Vok·Ë" <vokac.m@gmail.com>
Date: Wed, 23 May 2018 08:20:17 +0200

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
> 
> Changes in v3:
>  - Rebased on latest net-next/master.
>  - Corrected fixed-link documentation.

Series applied, thank you.
