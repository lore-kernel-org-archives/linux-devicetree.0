From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 2/2] net: phy: dp83867: Add SGMII mode type switching
Date: Mon, 9 Sep 2019 09:56:08 -0700
Message-ID: <2375a453-b14a-c583-2258-e395493d937e@gmail.com>
References: <1568026945-3857-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1568047940-14490-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568047940-14490-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, davem@davemloft.net, robh+dt@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 9/9/19 9:52 AM, Vitaly Gaiduk wrote:
> This patch adds ability to switch beetween two PHY SGMII modes.
> Some hardware, for example, FPGA IP designs may use 6-wire mode
> which enables differential SGMII clock to MAC.
> 
> Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
