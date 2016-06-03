From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: drop "arm, amba-bus" in favor of "simple-bus"
 part 2
Date: Fri, 3 Jun 2016 12:13:40 -0700
Message-ID: <20160603191340.GA3761@localhost>
References: <1464574353-31477-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1464574353-31477-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Chanho Min <chanho.min@lge.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 30, 2016 at 11:12:33AM +0900, Masahiro Yamada wrote:
> Tree-wide replacement was done by commit 2ef7d5f342c1 (ARM, ARM64:
> dts: drop "arm,amba-bus" in favor of "simple-bus"), but we have some
> new users of "arm,amba-bus" at Linux 4.7-rc1.  Eliminate them now.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> In order to not leave these compatible strings for the release,
> is it OK to apply this patch for Linux 4.7 ?

Thanks, applied to fixes.


-Olof
