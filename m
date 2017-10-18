From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 12/13] arm64: acpi: Remove __init from
 acpi_psci_use_hvc() for use by SDEI
Date: Wed, 18 Oct 2017 12:11:57 +0100
Message-ID: <20171018111157.lqzouwbsqrm2expe@armageddon.cambridge.arm.com>
References: <20171017174432.1684-1-james.morse@arm.com>
 <20171017174432.1684-13-james.morse@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kvmarm-bounces@lists.cs.columbia.edu>
Content-Disposition: inline
In-Reply-To: <20171017174432.1684-13-james.morse@arm.com>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
To: James Morse <james.morse@arm.com>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Loc Ho <lho@apm.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 06:44:31PM +0100, James Morse wrote:
> SDEI inherits the 'use hvc' bit that is also used by PSCI. PSCI does all
> its initialisation early, SDEI does its late.
> 
> Remove the __init annotation from acpi_psci_use_hvc().
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
