From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 2/2] net: phy: dp83867: Add SGMII mode type switching
Date: Thu, 12 Sep 2019 00:37:54 +0200 (CEST)
Message-ID: <20190912.003754.663480494374990855.davem@davemloft.net>
References: <1568047940-14490-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
        <1568049566-16708-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1568049566-16708-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: netdev-owner@vger.kernel.org
To: vitaly.gaiduk@cloudbear.ru
Cc: robh+dt@kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, andrew@lunn.ch, hkallweit1@gmail.com, tpiepho@impinj.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Date: Mon,  9 Sep 2019 20:19:24 +0300

> This patch adds ability to switch beetween two PHY SGMII modes.
> Some hardware, for example, FPGA IP designs may use 6-wire mode
> which enables differential SGMII clock to MAC.
> 
> Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>

Applied.
