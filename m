From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: ti_sci_pm_domains: Add support for
 exclusive access
Date: Tue, 12 Mar 2019 18:03:17 -0500
Message-ID: <20190312230317.bzq3hxonqil7xpyj@kahuna>
References: <20190223093232.29003-1-lokeshvutla@ti.com>
 <20190223093232.29003-3-lokeshvutla@ti.com>
 <20190312154301.GA21389@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190312154301.GA21389@bogus>
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
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 10:43-20190312, Rob Herring wrote:
> On Sat, Feb 23, 2019 at 03:02:29PM +0530, Lokesh Vutla wrote:
> > TISCI protocol supports for enabling the device with exclusive
> > permissions. Certain remoteproc devices or some shared devices
> > across VM doesn't wants to request devices with this flag set.
> 
> The wording here is weird. You want to add exclusive support, but you 
> are talking about devices which don't want exclusive support.
> 
> > So add support for getting this information from DT by increasing
> > the power-domain cells to 2.
> 
> Seems like this would be racy. Whomever wants exclusive access would 
> have to be the first to request a device. Seems like whether devices are 
> able to be shared or not would be known because generally h/w has to be 
> designed for that.

Rob,

I wonder if it is better to represent this as exclusive power domain or
shared power domain - because that is what the firmware in effect makes
OS think the hardware is? Two power domain nodes in dts, instead of
introducing property as part of cells?

Device may belong to a shared domain or an exclusive domain depending on
the SoC variations.

-- 
Regards,
Nishanth Menon
