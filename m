From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 1/3] dt-binding: cpu-topology: Move cpu-map to a common
 binding.
Date: Sat, 17 Nov 2018 10:32:53 -0600
Message-ID: <20181117163253.GA6713@bogus>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, anup@brainfault.org, Damien.LeMoal@wdc.com, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, sudeep.holla@arm.com, palmer@sifive.com, devicetree@vger.kernel.org, juri.lelli@arm.com, mick@ics.forth.gr, jeremy.linton@arm.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 08, 2018 at 05:50:07PM -0800, Atish Patra wrote:
> cpu-map binding can be used to described cpu topology for both
> RISC-V & ARM. It makes more sense to move the binding to document
> to a common place.
> 
> The relevant discussion can be found here.
> https://lkml.org/lkml/2018/11/6/19
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>  .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>  2 files changed, 526 insertions(+), 475 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>  create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt

Please send this with '-M' option so we just get the real changes.

Rob
