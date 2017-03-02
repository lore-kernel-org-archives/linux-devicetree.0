From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 0/2] arm64: dts: r8a7795: Add Cortex-A53 CPU cores and
 PMU
Date: Thu, 2 Mar 2017 16:05:45 +0100
Message-ID: <20170302150545.GV6301@verge.net.au>
References: <1487944768-31983-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487944768-31983-1-git-send-email-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Dirk Behme <dirk.behme@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Fri, Feb 24, 2017 at 02:59:26PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds the Cortex-A53 CPU cores and PMU on the Renesas
> R-Car H3 SoC to its DTS file.
> 
> Note that these patches describes the hardware; actual enabling of the
> CPU depends on the PSCI firmware.
> 
> With the current firmware version (v2.16.0), only the CA57 CPU cores are
> enabled, hence these patches do not introduce undeterministic scheduling
> behavior due to migration between big and LITTLE cores.
> 
> Changes compared to v3:
>   - Drop bogus links from the pmu_a57 node to the CA53 nodes,
>   - Add Cortex-A53 PMU node.
> 
> Tested on r8a7795/salvator-x, with CPU hot(un)plug and system suspend.
> 
> Thanks for applying!

I believe this patch-set is in keeping with the face-to-face discussion
between Magnus, yourself, myself and others in Brussels last month.

With that in mind I have queued this up for v4.12.
