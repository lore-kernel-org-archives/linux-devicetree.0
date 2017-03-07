From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/8] ARM: dts: renesas: Remove unit-addresses and regs
 from integrated caches
Date: Tue, 7 Mar 2017 07:46:04 +0100
Message-ID: <20170307064603.GD14208@verge.net.au>
References: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
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

On Mon, Mar 06, 2017 at 05:40:35PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series removes the bogus unit-addresses and reg properties
> from the device nodes representing Cortex-A15/A7 cache controllers.
> 
> Note that the latter were added to remove warnings from dtc when using
> W=1:
> 
>     Warning (unit_address_vs_reg): Node /cache-controller@0 has a unit name, but no reg property
> 
> In hindsight, adding the reg properties turned out to be the wrong fix.
> Indeed, the Cortex-A15/A7 cache controllers are integrated controllers,
> and thus the device nodes representing them should not have
> unit-addresses or reg properties.
> 
> This series does not have a runtime effect, as Linux doesn't rely much
> on the properties of the cache-controller nodes.
> 
> This series is the arm32 counterpart of "[PATCH 0/2] arm64: dts: renesas:
> Remove unit-addresses and regs from integrated caches", which you've just
> applied.
> 
> Thanks for applying!

Thanks, done.
