From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 0/4] RK3399 dw-mipi-dsi patches
Date: Thu, 16 Mar 2017 17:34:17 -0700
Message-ID: <20170317003416.GC8180@google.com>
References: <1489635107-21327-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1489635107-21327-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 11:31:43AM +0800, Chris Zhong wrote:
> Hi all
> 
> This series set the phy_cfg_clk to be a required clock for RK3399, and
> add a grf clock control in dw-mipi-dsi driver. And then correct a
> register name.
> 
> 
> Changes in v2:
> - check the grf_clk only for RK3399

For the series:

Tested-by: Brian Norris <briannorris@chromium.org>
