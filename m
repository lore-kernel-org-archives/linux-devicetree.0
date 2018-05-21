From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 3/7] net: dsa: qca8k: Enable RXMAC when bringing
 up a port
Date: Mon, 21 May 2018 16:40:14 +0200
Message-ID: <20180521144014.GB8077@lunn.ch>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
 <1526909293-56377-4-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1526909293-56377-4-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <vokac.m@gmail.com>
Cc: netdev@vger.kernel.org, michal.vokac@ysoft.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2018 at 03:28:09PM +0200, Michal Vokáč wrote:
> When a port is brought up/down do not enable/disable only the TXMAC
> but the RXMAC as well. This is essential for the CPU port to work.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
