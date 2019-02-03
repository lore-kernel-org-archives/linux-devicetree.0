From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: rv1108-elgin: Fix
 vcc5/6-supply representation
Date: Sun, 03 Feb 2019 10:00:58 +0100
Message-ID: <59585681.DkdmuU3GWD@phil>
References: <20190131124710.30238-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131124710.30238-1-otavio@ossystems.com.br>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Jason Zhu <jason.zhu@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Tony Xie <tony.xie@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 31. Januar 2019, 13:47:07 CET schrieb Otavio Salvador:
> On rv1108-elgin-r1 board the RK805 VCC5 and VCC6 supplies come from
> the BUCK2 regulator at 2.2V, so fix the representation in the
> device tree.
> 
> While at it, rename it from vdd_cam to vdd_buck2, which is a better
> name for the regulator label.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

applied all 3 for 5.1

Thanks
Heiko
