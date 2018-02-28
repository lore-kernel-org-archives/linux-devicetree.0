From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7: add CPU PMU support
Date: Wed, 28 Feb 2018 11:15:40 +0800
Message-ID: <20180228031539.GF3217@dragon>
References: <20180227151610.21887-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180227151610.21887-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 04:16:10PM +0100, Stefan Agner wrote:
> Enable support for ARM Performance Monitoring Units available
> on the Cortex-A7 CPU. There is only a single interrupt for the
> PMU in both variants of the family, i.MX 7Solo and 7Dual.
> 
> Tested with perf on a i.MX 7Dual:
>   hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied, thanks.
