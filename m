From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: rockpro64 dts add usb regulator
Date: Fri, 15 Feb 2019 10:24:52 +0100
Message-ID: <46988202.fxV2O2ZroW@diego>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
 <20190213170651.3210-5-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190213170651.3210-5-Akash_Gajjar@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Shohei Maruyama <cheat.sc.linux@outlook.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Oskari Lemmela <oskari@lemmela.net>, Levin Du <djw@t-chip.com.cn>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 13. Februar 2019, 18:06:40 CET schrieb Akash Gajjar:
> vcc5v0_host and vcc5v0_typec is supplied by vcc5v0_usb and not vcc5v0_sys.
> add node for vcc5v0_usb fixed regulator.
> 
> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>

applied for (hopefully) 5.1

Thanks
Heiko
