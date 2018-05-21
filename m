From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 3/7] net: dsa: qca8k: Enable RXMAC when bringing
 up a port
Date: Mon, 21 May 2018 08:17:30 -0700
Message-ID: <0e72750c-5567-d12c-8d9c-5a25520ab104@gmail.com>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
 <1526909293-56377-4-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526909293-56377-4-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <vokac.m@gmail.com>, netdev@vger.kernel.org, michal.vokac@ysoft.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org



On 05/21/2018 06:28 AM, Michal Vokáč wrote:
> When a port is brought up/down do not enable/disable only the TXMAC
> but the RXMAC as well. This is essential for the CPU port to work.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Should this have:

Fixes: 6b93fb46480a ("net-next: dsa: add new driver for qca8xxx family")?
-- 
Florian
