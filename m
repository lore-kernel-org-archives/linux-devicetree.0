From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 2/2] phy: add Rockchip Innosilicon hdmi phy
Date: Fri, 7 Sep 2018 13:48:54 +0530
Message-ID: <86a8225e-ed07-d4f1-10c6-a5f3158e44f1@ti.com>
References: <20180906135047.30788-1-heiko@sntech.de>
 <20180906135047.30788-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180906135047.30788-2-heiko@sntech.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Thursday 06 September 2018 07:20 PM, Heiko Stuebner wrote:
> From: Zheng Yang <zhengyang@rock-chips.com>
> 
> Add a driver for the Innosilicon hdmi phy used on rk3228/rk3229
> and rk3328 socs from Rockchip.
> 
> Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Robin Murphy <robin.murphy@arm.com>

I got a bunch of checkpatch "check" warnings
"Alignment should match open parenthesis". Can you fix resend after fixing those?

Thanks
Kishon
