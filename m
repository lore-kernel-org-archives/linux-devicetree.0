From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: topology: Make it clear that all CPUs need to be
 described
Date: Fri, 21 Mar 2014 13:32:02 +0000
Message-ID: <20140321133202.GQ23372@e106331-lin.cambridge.arm.com>
References: <1395320374-29576-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1395320374-29576-1-git-send-email-broonie@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Mark Brown <broonie@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 20, 2014 at 12:59:34PM +0000, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> The ARMv8 code will reject topologies that omit some CPUs (and it's not
> clear that it's ever sensible to do so). Update the binding document to
> make this clear.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/topology.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/topology.txt b/Documentation/devicetree/bindings/arm/topology.txt
> index 4aa20e7a424e..1bd5edc225c1 100644
> --- a/Documentation/devicetree/bindings/arm/topology.txt
> +++ b/Documentation/devicetree/bindings/arm/topology.txt
> @@ -75,9 +75,10 @@ The cpu-map node can only contain three types of child nodes:
>  
>  whose bindings are described in paragraph 3.
>  
> -The nodes describing the CPU topology (cluster/core/thread) can only be
> -defined within the cpu-map node.
> -Any other configuration is consider invalid and therefore must be ignored.
> +The nodes describing the CPU topology (cluster/core/thread) can only
> +be defined within the cpu-map node and every core/thread in the system
> +must be defined within the topology.  Any other configuration is
> +consider invalid and therefore must be ignored.

s/consider/considered/ (or drop the word entirely?).

Otherwise this looks sane to me, given there are currently no users of
this information relying on partial topology descriptions.

Cheers,
Mark.
