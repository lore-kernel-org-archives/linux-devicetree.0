From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 19/29] of: create default
 early_init_dt_add_memory_arch
Date: Mon, 7 Oct 2013 17:32:20 +0100
Message-ID: <20131007163220.GJ32012@arm.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
	<1381163377-21044-20-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
Content-Disposition: inline
In-Reply-To: <1381163377-21044-20-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, "linux@openrisc.net" <linux@openrisc.net>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 07, 2013 at 05:29:27PM +0100, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Create a weak version of early_init_dt_add_memory_arch which uses
> memblock. This will unify all architectures except ones with custom
> memory bank structs.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Jonas Bonn <jonas@southpole.se>
> Acked-by: Grant Likely <grant.likely@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: microblaze-uclinux@itee.uq.edu.au
> Cc: linux@lists.openrisc.net
> Cc: devicetree@vger.kernel.org

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
