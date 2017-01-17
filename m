From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v3 1/2] of: base: add support to find the level of the
 last cache
Date: Tue, 17 Jan 2017 11:30:49 +0000
Message-ID: <20170117113048.GD27328@arm.com>
References: <1484563244-14743-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484563244-14743-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Tan Xiaojun <tanxiaojun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 10:40:43AM +0000, Sudeep Holla wrote:
> It is useful to have helper function just to get the number of cache
> levels for a given logical cpu. We can obtain the same by just checking
> the level at which the last cache is present. This patch adds support
> to find the level of the last cache for a given cpu.
> 
> It will be used on ARM64 platform where the device tree provides the
> information for the additional non-architected/transparent/external
> last level caches that are not integrated with the processors.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Acked-by: Rob Herring <robh+dt@kernel.org>
> Tested-by: Tan Xiaojun <tanxiaojun@huawei.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/of/base.c  | 26 ++++++++++++++++++++++++++
>  include/linux/of.h |  1 +
>  2 files changed, 27 insertions(+)

Thanks, I've queued these two for 4.11.

Will
