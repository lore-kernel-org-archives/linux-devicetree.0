From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/2] Add R8A77980/Condor/V3HSK LVDS/HDMI support
Date: Wed, 13 Jun 2018 23:24:46 +0300
Message-ID: <9ab1470b-6c10-9d1f-e992-cc46234bae98@cogentembedded.com>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/13/2018 11:09 PM, Sergei Shtylyov wrote:

> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's

   Only 2, not 5 anymore. :-)

> 'renesas-devel-20180613-v4.17' tag and the Condor/V3HSK TD patches adding

   Only 1 DT patch, not 2 anymore. :-)

> Ethernet PHY IRQs. We're adding the R8A77980 FCPVD/VSPD/DU/LVDS device nodes
> and then describing the LVDS decoder and HDMI encoder connected to the LVDS
> output on the Condor and V3HSK boards.  These patches depend on the Thine
> THC63LVD1024 driver and the R8A77980 LVDS support patch in order to work...
> 
> [1/2] arm64: dts: renesas: r8a77980: add FCPVD/VSPD/DU/LVDS support
> [2/2] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support

WBR, Sergei
