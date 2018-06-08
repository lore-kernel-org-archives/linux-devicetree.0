From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Enable watchdog
 timer
Date: Fri, 8 Jun 2018 10:00:55 +0200
Message-ID: <20180608080055.2gvrvnjpxkfy2men@verge.net.au>
References: <1528219234-29348-1-git-send-email-geert+renesas@glider.be>
 <20180606090359.zi46cq5ddftdaps7@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180606090359.zi46cq5ddftdaps7@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 06, 2018 at 11:04:00AM +0200, Simon Horman wrote:
> On Tue, Jun 05, 2018 at 07:20:34PM +0200, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Add a device node for the Watchdog Timer (WDT) controller on the
> > R8A77990 SoC, and enable the watchdog on the Ebisu board.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [geert: Squashed 2 commits]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Hi,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks Geert, applied
