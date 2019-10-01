From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/3] Pine64+ specific hacks for RTL8211E Ethernet PHY
Date: Tue, 01 Oct 2019 09:30:00 -0700 (PDT)
Message-ID: <20191001.093000.372726574458067639.davem@davemloft.net>
References: <20191001082912.12905-1-icenowy@aosc.io>
        <20191001.090651.796983023328992596.davem@davemloft.net>
        <2CCD0856-433E-4602-A079-9F7F5F2E00D6@aosc.io>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2CCD0856-433E-4602-A079-9F7F5F2E00D6@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, mripard@kernel.org, wens@csie.org, robh+dt@kernel.org, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>
Date: Wed, 02 Oct 2019 00:08:39 +0800

> 
> 
> 于 2019年10月2日 GMT+08:00 上午12:06:51, David Miller <davem@davemloft.net> 写到:
>>From: Icenowy Zheng <icenowy@aosc.io>
>>Date: Tue,  1 Oct 2019 16:29:09 +0800
>>
>>> There're some Pine64+ boards known to have broken RTL8211E chips, and
>>> a hack is given by Pine64+, which is said to be from Realtek.
>>> 
>>> This patchset adds the hack.
>>> 
>>> The hack is taken from U-Boot, and it contains magic numbers without
>>> any document.
>>
>>Please contact Realtek and try to get an explanation about this.
> 
> Sorry, but Realtek never shows any idea to add more infomation about this.
> 
> These hacks had existed and worked for years.

Have you actually tried to communicate with an appropriate contact yourself?

If not, I am asking you to do so.
