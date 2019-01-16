From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 0/3] arm64: ti: k3-am654: USB support
Date: Wed, 16 Jan 2019 13:00:03 +0200
Message-ID: <5C3F0EB3.5090009@ti.com>
References: <1547200861-17795-1-git-send-email-rogerq@ti.com>
 <20190115143306.wub3y2c2zsq7byy5@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115143306.wub3y2c2zsq7byy5@kahuna>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: t-kristo@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15/01/19 16:33, Nishanth Menon wrote:
> On 12:00-20190111, Roger Quadros wrote:
>> Hi,
>>
>> The AM654 SoC supports 2 DWC3 USB controller instances. The
>> AM654 base board supports the 2nd (USB1) instance in high-speed.
>>
>> This series enables support for USB1 instance on the AM654-base-board.
>>
>> To test, you need to first apply the below 2 series.
>>
>> AM654 USB2 PHY support https://lkml.org/lkml/2018/12/5/908
>> AM654 DWC3 support https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1896101.html
>>
> 
> Please clarify if these have hit linux-next yet (I dont see anything in
> the threads as to being picked up yet, may be I am wrong). Once they do hit
> linux-next, please rebase to Tero's latest tip and repost.
> 
> 

They haven't yet. PHY patches were picked up today.

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
