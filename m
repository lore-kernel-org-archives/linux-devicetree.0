From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v7 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Wed, 26 Jun 2019 17:31:37 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906261724000.23534@viisi.sifive.com>
References: <20190617185920.29581-1-atish.patra@wdc.com> <20190617185920.29581-2-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617185920.29581-2-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Linus Walleij <linus.walleij@linaro.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Richard
List-Id: devicetree@vger.kernel.org

Hi Sudeep, Atish,

On Mon, 17 Jun 2019, Atish Patra wrote:

> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> The current ARM DT topology description provides the operating system
> with a topological view of the system that is based on leaf nodes
> representing either cores or threads (in an SMT system) and a
> hierarchical set of cluster nodes that creates a hierarchical topology
> view of how those cores and threads are grouped.
> 
> However this hierarchical representation of clusters does not allow to
> describe what topology level actually represents the physical package or
> the socket boundary, which is a key piece of information to be used by
> an operating system to optimize resource allocation and scheduling.
> 
> Lets add a new "socket" node type in the cpu-map node to describe the
> same.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This one doesn't apply cleanly here on top of v5.2-rc2, Linus's master 
branch, and next-20190626.  The reject file is below.  Am I missing 
a patch?


- Paul

--- Documentation/devicetree/bindings/arm/topology.txt
+++ Documentation/devicetree/bindings/arm/topology.txt
@@ -185,13 +206,15 @@ Bindings for cluster/cpu/thread nodes are defined as follows:
 4 - Example dts
 ===========================================
 
-Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters):
+Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters in a single
+physical socket):
 
 cpus {
 	#size-cells = <0>;
 	#address-cells = <2>;
 
 	cpu-map {
+		socket0 {
 			cluster0 {
 				cluster0 {
 					core0 {
