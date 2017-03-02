From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: Upgrade to PSCI v1.0 to
 support Suspend-to-RAM
Date: Thu, 2 Mar 2017 16:05:34 +0100
Message-ID: <20170302150534.GU6301@verge.net.au>
References: <1487944154-31435-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487944154-31435-1-git-send-email-geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Khiem Nguyen <khiem.nguyen.xt@renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 24, 2017 at 02:49:12PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series upgrades the version of the PSCI firmware, as
> advertised in DT on Renesas R-Car Gen3 systems, from v0.2 to v1.0.
> 
> Note that this series does not have any runtime effects: as of PSCI
> v0.2, PSCI provides a VERSION API.  Hence Linux always detected the
> actual version, regardless of what was stated in DT, and enabled v1.0
> features like system suspend:
> 
>     PSCIv1.0 detected in firmware.
> 
> However, it is better to have the real hardware^H^H^H^H^H^H^H^Hfirmware
> description in DT.
> 
> Changes compared to v1:
>   - Keep "arm,psci-0.2".
> 
> Tested on Salvator-X (both H3 and M3-W) with firmware v2.16.0, but I do
> have old boot logs showing that PSCIv1.0 has been detected for a long
> time.
> 
> Thanks for applying!

Thanks, I have queued these up for v4.12.
