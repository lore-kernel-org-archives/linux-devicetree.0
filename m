From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/3] Pine64+ specific hacks for RTL8211E Ethernet PHY
Date: Tue, 01 Oct 2019 09:06:51 -0700 (PDT)
Message-ID: <20191001.090651.796983023328992596.davem@davemloft.net>
References: <20191001082912.12905-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001082912.12905-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: icenowy@aosc.io
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org, wens@csie.org, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>
Date: Tue,  1 Oct 2019 16:29:09 +0800

> There're some Pine64+ boards known to have broken RTL8211E chips, and
> a hack is given by Pine64+, which is said to be from Realtek.
> 
> This patchset adds the hack.
> 
> The hack is taken from U-Boot, and it contains magic numbers without
> any document.

Please contact Realtek and try to get an explanation about this.

I understand that eventually we may not get a proper explanation
but I really want you to put forth real effort to nail down whats
going on here before I even consider these patches seriously.

Thank you.
