From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 0/4] *** ARM: imx6sl: add FEC support for imx6sl evk
 platform ***
Date: Wed, 4 Sep 2013 21:19:49 +0800
Message-ID: <20130904131947.GA16797@S2101-09.ap.freescale.net>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1378182385-9205-1-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fugang Duan <B38611@freescale.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 03, 2013 at 12:26:21PM +0800, Fugang Duan wrote:
> Changelog:
> 
> V2:
>  * Split iomuxc-gpr and fec phy gpio reset dts patch
>  * Sort included header file
> 
> v1:
>  * Add iomuxc-gpr device node
>  * Add imx6sl evk fec phy gpio reset
>  * Add imx6sl iomuxc-gpr fec gpr field define
>  * Add fec init function to select clock source.
> 
> Fugang Duan (4):
>   ARM: dts: add iomuxc-gpr device node for imx6sl
>   ARM: dts: add fec phy reset for imx6sl evk board
>   ARM: imx6sl: add imx6sl iomux-gpr field define
>   ARM: imx6sl: config iomux-gpr1 to select clock for fec

Applied all, thanks.
