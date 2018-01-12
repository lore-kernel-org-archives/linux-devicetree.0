From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: add #cooling-cells to CPU nodes
Date: Thu, 11 Jan 2018 18:00:22 -0800
Message-ID: <20180112020022.t4sw7ga7np2mntq7@localhost>
References: <20180110210706.2331225-1-arnd@arndb.de>
 <1515631110.19513.5.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1515631110.19513.5.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, "dawei.chien@mediatek.com" <dawei.chien@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Andrew-sh Cheng <andrew-sh.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 08:38:30AM +0800, Chunfeng Yun wrote:
> On Wed, 2018-01-10 at 22:06 +0100, Arnd Bergmann wrote:
> > dtc complains about the lack of #coolin-cells properties for the
> > CPU nodes that are referred to as "cooling-device":
> > 
> > arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@0 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@0:cooling-device[0])
> > arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@100 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@1:cooling-device[0])
> > 
> > Apparently this property must be '<2>' to match the binding.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > If this looks ok, I'd apply it directly to the fixes branch
> > for 4.15, as the warning is one that was introduced in this
> > release.

Actually, it's in next/dt (or at least this patch doesn't apply as it is to
fixes), so I've added it there.


-Olof
