From: Rob Herring <robh@kernel.org>
Subject: Re: [V2 1/4] MIPS: dts: ralink: Add Mediatek MT7628A SoC
Date: Tue, 22 Aug 2017 19:41:14 -0500
Message-ID: <20170823004114.a7raxjrjj7vcmpbb@rob-hp-laptop>
References: <1503312931-34416-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503312931-34416-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 11:55:29AM +0100, Harvey Hunt wrote:
> The MT7628A is the successor to the MT7620 and pin compatible with the
> MT7688A, although the latter supports only a 1T1R antenna rather than
> a 2T2R antenna.
> 
> This commit adds support for the following features:
> 
> - UART
> - USB PHY
> - EHCI
> - Interrupt controller
> - System controller
> - Memory controller
> - Reset controller
> 
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Cc: linux-mips@linux-mips.org 
> Cc: devicetree@vger.kernel.org 
> Cc: linux-kernel@vger.kernel.org 
> Cc: linux-mediatek@lists.infradead.org 
> ---
> Ralf: I've added this patch to both my vocore2 and omega2+
> patchsets for ease of review, please only merge it once :-)
> 
> Changes in V2:
> - Add MT7628 to patchset to keep kbuild happy and retain context
> - Rename multiple DT nodes to standard names
> - Add labels for uarts
> - Rename USB PHY handle
> 
>  Documentation/devicetree/bindings/mips/ralink.txt |   1 +
>  arch/mips/boot/dts/ralink/mt7628a.dtsi            | 126 ++++++++++++++++++++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ralink/mt7628a.dtsi

Acked-by: Rob Herring <robh@kernel.org>
