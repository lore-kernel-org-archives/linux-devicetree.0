From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH 1/3] Documentation: dt: keystone: ti-sci: Add
 optional host-id parameter
Date: Tue, 12 Jun 2018 17:09:18 -0500
Message-ID: <20180612220918.7cchihtcmmta6pm5@kahuna>
References: <20180605062640.3356-1-nm@ti.com> <20180605062640.3356-2-nm@ti.com>
 <20180612213922.GA26791@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180612213922.GA26791@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

On 21:39-20180612, Rob Herring wrote:
> On Tue, Jun 05, 2018 at 01:26:38AM -0500, Nishanth Menon wrote:
> > Texas Instrument's System Control Interface (TISCI) permits the
> > ability for Operating Systems to running in virtual machines to be
> 
> ...for OSs running in virtual...

Ack. thanks.

> 
> > able to independently communicate with the firmware without the need
> > going through an hypervisor.
> > 
> > The "host-id" in effect is the hardware representation of the
> > host (example: VMs locked to a core) as identified to the System
> > Controller.
> 
> So the hypervisor will fill in host-id's for each VM instance?

Yes OR have it's own device tree blobs representation of it's own host
IDs assigned by system firmware. This provides complete independence of
VMs to communicate with the system controller (once the host-id is
provided) without switching to hyp for arbitration (and yes, verified
ability with jailhouse hypervisor and multiple linux instances operating
simultaneously). This also has the added benefit of:
1. The burden of hypervisor from being involved in PM functionality as each
of the VMs can operate autonomously.
2. In TI SoCs which are heterogeneous, the system firmware plays the role
of system master communicating with multiple firmware(running on various
uCs) and OSes running on bigger cores.

-- 
Regards,
Nishanth Menon
