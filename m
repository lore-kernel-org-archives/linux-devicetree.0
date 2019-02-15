From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: rockpro64 dts remove unused node
Date: Fri, 15 Feb 2019 10:18:59 +0100
Message-ID: <4653141.o6ZdamfZ6d@diego>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com> <20190213170651.3210-3-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213170651.3210-3-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 13. Februar 2019, 18:06:38 CET schrieb Akash Gajjar:
> lcd panel pinmux and vcc1v8_s3 regulator is redundant and has a no impact,
> so removing it.
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>

vcc1v8_s3 is actually also a emmc supply, so I'd like to keep it around
for completenes sake.

I've now dropped the regulator portions so that only the lcd-pinmux
gets removed and reworded the commit message accordingly
and applied the result for 5.1

Thanks
Heiko
