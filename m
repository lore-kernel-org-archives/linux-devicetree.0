From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx6dl-yapp4: Use rgmii-id phy mode on the
 cpu port
Date: Mon, 4 Mar 2019 13:33:13 +0800
Message-ID: <20190304053311.GX26041@dragon>
References: <1551425202-8871-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551425202-8871-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2019 at 08:26:42AM +0100, Michal Vokáč wrote:
> Use rgmii-id phy mode for the CPU port (MAC0) of the QCA8334 switch
> to add delays to both Tx and Rx clock.
> 
> It worked with the rgmii mode before because the qca8k driver
> (incorrectly) enabled delays in that mode and rgmii-id was not
> implemented at all.
> 
> Commit 5ecdd77c61c8 ("net: dsa: qca8k: disable delay for RGMII mode")
> removed the delays from the RGMII mode and hence broke the networking.
> 
> To fix the problem, commit a968b5e9d587 ("net: dsa: qca8k: Enable delay
> for RGMII_ID mode") was introduced.
> 
> Now the correct phy mode is available so use it.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Applied, thanks.
