From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v6 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Wed, 29 May 2019 19:39:17 -0400
Message-ID: <49f41e62-5354-a674-d95f-5f63851a0ca6@ti.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
 <20190529211340.17087-2-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190529211340.17087-2-atish.patra@wdc.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Russell King <linux@armlinux.org.uk>, Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@sebe>
List-Id: devicetree@vger.kernel.org

On 5/29/19 5:13 PM, Atish Patra wrote:
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

Are physical package descriptions really needed? What does "socket" 
imply that a higher layer "cluster" node grouping does not? It doesn't 
imply a different NUMA distance and the definition of "socket" is 
already not well defined, is a dual chiplet processor not just a fancy 
dual "socket" or are dual "sockets" on a server board "slotket" card, 
will we need new names for those too..

Andrew

> Lets add a new "socket" node type in the cpu-map node to describe the
> same.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/arm/topology.txt      | 52 ++++++++++++++-----
>   1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
> index b0d80c0fb265..3b8febb46dad 100644
> --- a/Documentation/devicetree/bindings/arm/topology.txt
> +++ b/Documentation/devicetree/bindings/arm/topology.txt
> @@ -9,6 +9,7 @@ ARM topology binding description
>   In an ARM system, the hierarchy of CPUs is defined through three entities that
>   are used to describe the layout of physical CPUs in the system:
>   
> +- socket
>   - cluster
>   - core
>   - thread
> @@ -63,21 +64,23 @@ nodes are listed.
>   
>   	The cpu-map node's child nodes can be:
>   
> -	- one or more cluster nodes
> +	- one or more cluster nodes or
> +	- one or more socket nodes in a multi-socket system
>   
>   	Any other configuration is considered invalid.
>   
> -The cpu-map node can only contain three types of child nodes:
> +The cpu-map node can only contain 4 types of child nodes:
>   
> +- socket node
>   - cluster node
>   - core node
>   - thread node
>   
>   whose bindings are described in paragraph 3.
>   
> -The nodes describing the CPU topology (cluster/core/thread) can only
> -be defined within the cpu-map node and every core/thread in the system
> -must be defined within the topology.  Any other configuration is
> +The nodes describing the CPU topology (socket/cluster/core/thread) can
> +only be defined within the cpu-map node and every core/thread in the
> +system must be defined within the topology.  Any other configuration is
>   invalid and therefore must be ignored.
>   
>   ===========================================
> @@ -85,26 +88,44 @@ invalid and therefore must be ignored.
>   ===========================================
>   
>   cpu-map child nodes must follow a naming convention where the node name
> -must be "clusterN", "coreN", "threadN" depending on the node type (ie
> -cluster/core/thread) (where N = {0, 1, ...} is the node number; nodes which
> -are siblings within a single common parent node must be given a unique and
> +must be "socketN", "clusterN", "coreN", "threadN" depending on the node type
> +(ie socket/cluster/core/thread) (where N = {0, 1, ...} is the node number; nodes
> +which are siblings within a single common parent node must be given a unique and
>   sequential N value, starting from 0).
>   cpu-map child nodes which do not share a common parent node can have the same
>   name (ie same number N as other cpu-map child nodes at different device tree
>   levels) since name uniqueness will be guaranteed by the device tree hierarchy.
>   
>   ===========================================
> -3 - cluster/core/thread node bindings
> +3 - socket/cluster/core/thread node bindings
>   ===========================================
>   
> -Bindings for cluster/cpu/thread nodes are defined as follows:
> +Bindings for socket/cluster/cpu/thread nodes are defined as follows:
> +
> +- socket node
> +
> +	 Description: must be declared within a cpu-map node, one node
> +		      per physical socket in the system. A system can
> +		      contain single or multiple physical socket.
> +		      The association of sockets and NUMA nodes is beyond
> +		      the scope of this bindings, please refer [2] for
> +		      NUMA bindings.
> +
> +	This node is optional for a single socket system.
> +
> +	The socket node name must be "socketN" as described in 2.1 above.
> +	A socket node can not be a leaf node.
> +
> +	A socket node's child nodes must be one or more cluster nodes.
> +
> +	Any other configuration is considered invalid.
>   
>   - cluster node
>   
>   	 Description: must be declared within a cpu-map node, one node
>   		      per cluster. A system can contain several layers of
> -		      clustering and cluster nodes can be contained in parent
> -		      cluster nodes.
> +		      clustering within a single physical socket and cluster
> +		      nodes can be contained in parent cluster nodes.
>   
>   	The cluster node name must be "clusterN" as described in 2.1 above.
>   	A cluster node can not be a leaf node.
> @@ -164,13 +185,15 @@ Bindings for cluster/cpu/thread nodes are defined as follows:
>   4 - Example dts
>   ===========================================
>   
> -Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters):
> +Example 1 (ARM 64-bit, 16-cpu system, two clusters of clusters in a single
> +physical socket):
>   
>   cpus {
>   	#size-cells = <0>;
>   	#address-cells = <2>;
>   
>   	cpu-map {
> +		socket0 {
>   			cluster0 {
>   				cluster0 {
>   					core0 {
> @@ -253,6 +276,7 @@ cpus {
>   				};
>   			};
>   		};
> +	};
>   
>   	CPU0: cpu@0 {
>   		device_type = "cpu";
> @@ -473,3 +497,5 @@ cpus {
>   ===============================================================================
>   [1] ARM Linux kernel documentation
>       Documentation/devicetree/bindings/arm/cpus.yaml
> +[2] Devicetree NUMA binding description
> +    Documentation/devicetree/bindings/numa.txt
> 
