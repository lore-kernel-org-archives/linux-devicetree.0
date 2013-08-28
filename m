From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] Documentation: devicetree: arm: cpus/cpu nodes
 bindings updates
Date: Wed, 28 Aug 2013 20:45:58 +0100
Message-ID: <20130828194558.568303E0A6F@localhost>
References: <1376559743-31848-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1376559743-31848-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1376559743-31848-2-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>, Hanjun Guo <hanjun.guo@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <dave.martin@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, 15 Aug 2013 10:42:22 +0100, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
> +=====================================
> +cpus and cpu node bindings definition
> +=====================================
> +
> +The ARM architecture, in accordance with the ePAPR, requires the cpus and cpu
> +nodes to be present and contain the properties described below.
> +
> +- cpus node
> +
> +	Description: Container of cpu nodes
> +
> +	The node name must be "cpus".
> +
> +	A cpus node must define the following properties:
> +
> +	- #address-cells
> +		Usage: required
> +		Value type: <u32>
> +
> +		Definition depends on ARM architecture version and
> +		configuration:
> +
> +			# On uniprocessor ARM architectures previous to v7
> +			  value must be 0, since they have no register
> +			  providing CPU identification.

Just clued into this point from the other thread; Don't do this.
Uniprocessor should follow the same rules as 32bit or 64bit for the
value of #address-cells, and cpu nodes should have a reg property, even
if it is merely set to '0'.

g.
