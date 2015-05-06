From: Jon Masters <jcm@redhat.com>
Subject: Re: [PATCH v8 1/5] arm64: Enable EDAC on ARM64
Date: Wed, 06 May 2015 00:10:03 -0400
Message-ID: <5549941B.7060400@redhat.com>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
 <1430884947-16787-2-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1430884947-16787-2-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>, dougthompson@xmission.com, bp@alien8.de, mchehab@osg.samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: devicetree@vger.kernel.org, patches@apm.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Loc,

Great to see v8 of the patches :) A comment below.

On 05/06/2015 12:02 AM, Loc Ho wrote:

> Add an stub atomic_scrub function and enable EDAC for arm64.

> +/*
> + * ECC atomic, DMA, SMP and interrupt safe scrub function.
> + */

nit: I expect you'll still get a little push back on that (similar to
last time) because it doesn't actually implement anything, so while it
is "safe" it's only because it's empty :) Might be better to indicate
that those are the features it is supposed to have when implemented.

> +static inline void atomic_scrub(void *va, u32 size)
> +{
> +	/* Stub function for now until an ARM64 HW has a way to test it. */
> +	WARN_ONCE(1, "not implemented");
> +}

That's great and seems to address the previous comment from v7.

Thanks,

Jon.
