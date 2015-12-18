From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RESEND PATCH v7 2/4] Documentation, dt, arm64/arm: dt bindings
 for numa.
Date: Fri, 18 Dec 2015 14:18:26 +0000
Message-ID: <20151218141826.GB30229@leverpostej>
References: <1450413433-7467-1-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1450413433-7467-1-git-send-email-gkulkarni@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>
Cc: catalin.marinas@arm.com, Will.Deacon@arm.com, pawel.moll@arm.com, al.stone@linaro.org, Prasun.Kapoor@caviumnetworks.com, msalter@redhat.com, rfranz@cavium.com, lenb@kernel.org, devicetree@vger.kernel.org, steve.capper@linaro.org, arnd@arndb.de, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, leif.lindholm@linaro.org, rrichter@cavium.com, grant.likely@linaro.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, ard.biesheuvel@linaro.org, rjw@rjwysocki.net, hanjun.guo@linaro.org, galak@codeaurora.org, gpkulkarni@gmail.com
List-Id: devicetree@vger.kernel.org

Hi,

> +==============================================================================
> +2 - numa-node-id
> +==============================================================================
> +
> +For the purpose of identification, each NUMA node is associated with a unique
> +token known as a node id. For the purpose of this binding
> +a node id is a 32-bit integer.
> +
> +A device node is associated with a NUMA node by the presence of a
> +numa-node-id property which contains the node id of the device.
> +
> +Example:
> +	/* numa node 0 */
> +	numa-node-id = <0>;
> +
> +	/* numa node 1 */
> +	numa-node-id = <1>;
> +
> +==============================================================================
> +3 - distance-map
> +==============================================================================
> +
> +The device tree node distance-map describes the relative
> +distance(memory latency) between all numa nodes.
> +
> +- compatible : Should at least contain "numa-distance-map-v1".

Thank you for updating these per my request.

The fact that these have changed since the late posting [1] means that
this is a new version of the patch rather than a resend. Please update
the PATCHvX number when changes are made.

You also need to update the driver for the new compatible string, so a
new version of that is required.

> +- distance-matrix
> +  This property defines a matrix to describe the relative distances
> +  between all numa nodes.
> +  It is represented as a list of node pairs and their relative distance.
> +
> +  Note:
> +	1. Each entry represents distance from first node to second node.
> +	The distance are equal in either direction.
> +	2. The distance from a node to self(local distance) is represented
> +	with value 10 and all inter node distance should be represented with
> +	value greater than 10.
> +	3. distance-matrix shold have entries in lexicographical ascending
> +	order of nodes.
> +	4. There must be only one Device node distance-map and must reside in the root node.

I am still concerned that the local distance of 10 is completely
arbitrary.

Please:

* Add a new local-distance property to the distance-map node allowing a
  uniform local distance to be described, and require this property to
  be present.

* Update the driver to account for that and the compatible string
  change.

* Send a complete PATCHv8 (or PATCHv$X where X > 7) series with a proper
  changelog.

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/385826.html
