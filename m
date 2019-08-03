From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: ls1088a: Revise gpio registers to
 little-endian
Date: Sat, 3 Aug 2019 09:11:34 +0200
Message-ID: <20190803071132.GA5797@X250>
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
 <20190529083254.39581-3-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190529083254.39581-3-chuanhua.han@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, bgolaszewski@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 04:32:54PM +0800, Chuanhua Han wrote:
> Since fsl-ls1088a Soc GPIO registers are used as little endian,
> the patch adds the little-endian attribute to each gpio node.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Applied, thanks.
