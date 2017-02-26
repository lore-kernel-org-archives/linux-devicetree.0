From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: Re: [PATCH v5 2/7] clk: sunxi-ng: rename sun8i-h3 driver to
 sunxi-h3-h5
Date: Sun, 26 Feb 2017 10:52:04 +0100
Message-ID: <20170226095204.cwh7f2mbgjumr5fu@localhost>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170226011956.53581-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 26, 2017 at 09:19:51AM +0800, Icenowy Zheng wrote:
> As the CCU in the Allwinner H5 SoC is very similar to the one in H3,
> rename the H3 driver to sunxi-h3-h5 so that it can be extended with H5
> support.
> 
> Trasitional header symlinks are created, to ensure current device tree

s/Trasitional/Transitional/ I guess.

> files which included sun8i-h3-ccu.h can compile.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v5:
> - Add the reason to create trasitional headers in commit message.

Likewise.

-- 
Rask Ingemann Lambertsen
