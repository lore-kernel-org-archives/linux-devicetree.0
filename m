From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: rk3188-bqedison2qc: remove
 cap-mmc-highspeed from mmc1 node
Date: Sun, 17 Feb 2019 12:26:04 +0100
Message-ID: <4226652.OplgTpc3Hz@phil>
References: <20190216102545.1809-1-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190216102545.1809-1-jbx6244@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Jonker <jbx6244@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 16. Februar 2019, 11:25:45 CET schrieb Johan Jonker:
> The mmc1 pins are used for SDIO with a wifi chip.
> The function mmc_sdio_switch_hs() only checks for MMC_CAP_SD_HIGHSPEED and
> not for MMC_CAP_MMC_HIGHSPEED, so cap-mmc-highspeed can be removed.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

applied for 5.1

Thanks
Heiko
