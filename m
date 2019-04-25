From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Date: Thu, 25 Apr 2019 11:13:35 +0100
Message-ID: <20190425101318.GA8469@e107155-lin>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Yash Shah <yash.shah@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, sachin.ghadi@sifive.com, robh+dt@kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> Add device tree bindings for SiFive FU540 L2 cache controller driver
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> new file mode 100644
> index 0000000..15132e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> @@ -0,0 +1,53 @@
> +SiFive L2 Cache Controller
> +--------------------------
> +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> +acts as directory-based coherency manager.
> +
> +Required Properties:
> +--------------------
> +- compatible: Should be "sifive,fu540-c000-ccache"
> +
> +- cache-block-size: Specifies the block size in bytes of the cache
> +
> +- cache-level: Should be set to 2 for a level 2 cache
> +
> +- cache-sets: Specifies the number of associativity sets of the cache
> +
> +- cache-size: Specifies the size in bytes of the cache
> +
> +- cache-unified: Specifies the cache is a unified cache
> +
> +- interrupt-parent: Must be core interrupt controller
> +
> +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> +
> +- reg: Physical base address and size of L2 cache controller registers map
> +
> +- reg-names: Should be "control"
> +

It would be good if you mark the properties that are present in DT
specification and those that are added for sifive,fu540-c000-ccache
explicitly. Also I assume you can retain the stardard "cache" compatible
in addition to above. I am interested to see if the cacheinfo infrastructure
can be used without any issues.

--
Regards,
Sudeep
