From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V3 0/2] Add support for RK3288 Tinker board
Date: Tue, 21 Feb 2017 19:42:36 +0100
Message-ID: <64714214.3fXrpx51Ln@phil>
References: <1487066851-25142-1-git-send-email-eddie.cai.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487066851-25142-1-git-send-email-eddie.cai.linux@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eddie Cai <eddie.cai.linux@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 14. Februar 2017, 18:07:29 CET schrieb Eddie Cai:
> This patch set add support for RK3288 Tinker board. Tinker board is a
> credit card size develop board powered by RK3288.
> 
> Eddie Cai (2):
>   dt-bindings: add Asus Tinker board
>   ARM: dts: rockchip: add dts for RK3288-Tinker board

applied both, with:
- fixed the wakesource pointed out by Wadim
- reordered some properties

So please double check :-)


Thanks
Heiko
