From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Remove unit-addresses and regs
 from integrated caches
Date: Mon, 6 Mar 2017 09:47:48 +0100
Message-ID: <20170306084747.GD11468@verge.net.au>
References: <1488547097-4804-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488547097-4804-1-git-send-email-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 02:18:15PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series removes the bogus unit-addresses and reg properties
> from the device nodes representing Cortex-A57/A53 cache controllers.
> 
> Note that the latter were added to remove warnings from dtc when using
> W=1:
> 
>     Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit name, but no reg property
> 
> In hindsight, adding the reg properties turned out to be the wrong fix.
> Indeed, the Cortex-A57/A53 cache controllers are integrated controllers,
> and thus the device nodes representing them should not have
> unit-addresses or reg properties.
> 
> This series does not have a runtime effect, as Linux doesn't rely much
> on the properties of the cache-controller nodes.
> 
> After this patch has been accepted, I'll submit a similar series to fix
> the DTS files for the Renesas arm32 SoCs.

Thanks, applied.
