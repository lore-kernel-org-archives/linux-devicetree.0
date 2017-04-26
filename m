From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH/RFC 0/5] arm64: dts: renesas: Break out common board
 support
Date: Wed, 26 Apr 2017 10:06:43 +0200
Message-ID: <20170426080642.GK25517@verge.net.au>
References: <1492779321-23939-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1492779321-23939-1-git-send-email-geert+renesas@glider.be>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Fri, Apr 21, 2017 at 02:55:16PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The Renesas Salvator-X and ULCB development board can be equipped with
> either an R-Car H3 or M3-W SiP, which are pin-compatible.  All boards
> use separate DTBs, but currently there's no sharing of board-specific
> devices in DTS.
> 
> This series reduces duplication by extracting common board support into
> their own .dtsi files.  As the level of support varies across boards and
> SoCs, this requires the addition of a few external clocks and
> placeholder devices on R-Car M3-W, so the common board support DTS can
> refer to them.
> 
>   - Patches 1 and 2 add the external audio and PCIe bus clocks on R-Car
>     M3-W, which are present in r8a7795.dtsi, and used in
>     r8a7795-salvator-x.dts,
>   - RFC patch 3 adds placeholders for devices that are not yet supported
>     and/or tested on R-Car M3-W, but used on R-Car H3,
>   - RFC patch 4 extracts common Salvator-X board support,
>   - RFC patch 5 extracts common ULCB board support.
> 
> For R-Car H3 based boards, there are no functional changes.
> For R-Car M3-W based boards, some new devices are now described in DT.
> 
> Dependencies:
>   - renesas-devel-20170420-v4.11-rc7,
>   - Patches 1 and 2 can be applied as-is,
>   - Patches 4 and 5 depend on "[PATCH 0/8] arm64: dts: renesas: Break
>     out R-Car H3 and M3-W SiP"
>     (http://www.spinics.net/lists/devicetree/msg173820.html).
> 
> DTB changes have been inspected using scripts/dtc/dtx_diff.
> This has been tested on Salvator-X (both H3 and M3-W).
> This has not been tested on H3ULCB and M3ULCB due to lack of hardware.
> 
> Thanks for your comments!

Thanks for tackling this important problem. I have looked over the changes
and they seem nice to me. I would, however, be more comfortable applying
them if they were rested on the ULCB boards.
