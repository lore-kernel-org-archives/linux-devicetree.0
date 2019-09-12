From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Subject: Re: [PATCH v4 2/2] net: phy: dp83867: Add SGMII mode type switching
Date: Thu, 12 Sep 2019 13:17:40 +0300
Message-ID: <83c63a9c-53f4-8f3e-38da-1f230cfca186@cloudbear.ru>
References: <1568047940-14490-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1568049566-16708-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <20190912.003754.663480494374990855.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190912.003754.663480494374990855.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: robh+dt@kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, andrew@lunn.ch, hkallweit1@gmail.com, tpiepho@impinj.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello, David.

Should I patch commit as Trent Piepho suggested? He wrote about using 
phy_modify_mmd() instead.

Vitaly.

On 12.09.2019 1:37, David Miller wrote:
> From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
> Date: Mon,  9 Sep 2019 20:19:24 +0300
>
>> This patch adds ability to switch beetween two PHY SGMII modes.
>> Some hardware, for example, FPGA IP designs may use 6-wire mode
>> which enables differential SGMII clock to MAC.
>>
>> Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
> Applied.
