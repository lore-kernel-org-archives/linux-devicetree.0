From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <vokac.m@gmail.com>
Subject: Re: [PATCH net-next 4/7] net: dsa: qca8k: Force CPU port to its
 highest bandwidth
Date: Tue, 22 May 2018 07:30:03 +0200
Message-ID: <64573982-6ab3-c92d-bc24-5e27d70b89ce@gmail.com>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
 <1526909293-56377-5-git-send-email-michal.vokac@ysoft.com>
 <7d73f1b8-453a-fcbe-a1b8-41ced652deb0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d73f1b8-453a-fcbe-a1b8-41ced652deb0@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: michal.vokac@ysoft.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On 21.5.2018 17:19, Florian Fainelli wrote:
> 
> On 05/21/2018 06:28 AM, Michal Vokáč wrote:
>> By default autonegotiation is enabled to configure MAC on all ports.
>> For the CPU port autonegotiation can not be used so we need to set
>> some sensible defaults manually.
>>
>> This patch forces the default setting of the CPU port to 1000Mbps/full
>> duplex which is the chip maximum capability.
>>
>> Also correct size of the bit field used to configure link speed.
>>
>> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Likewise, would not we want to have a:
> 
> Fixes: 6b93fb46480a ("net-next: dsa: add new driver for qca8xxx family")
> 
> tag here as well?

Good point, I will add this in v2.

Thanks,
Michal
