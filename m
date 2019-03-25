From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add external-facing PCIe port property
Date: Mon, 25 Mar 2019 08:53:12 -0500
Message-ID: <20190325135312.GQ251185@google.com>
References: <20190318182124.53859-1-jean-philippe.brucker@arm.com>
 <20190318182124.53859-2-jean-philippe.brucker@arm.com>
 <20190320220338.GH251185@google.com>
 <598b0675-38b2-9e52-d903-016dc548756c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <598b0675-38b2-9e52-d903-016dc548756c@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <Grant.Likely@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Jeremy Linton <Jeremy.Linton@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 12:59:48PM +0000, Jean-Philippe Brucker wrote:
> On 20/03/2019 22:03, Bjorn Helgaas wrote:
> > On Mon, Mar 18, 2019 at 06:21:23PM +0000, Jean-Philippe Brucker wrote:

> >> +- external-facing:
> >> +   When present, the port is external facing. All bridges and endpoints
> >> +   downstream of this port are external to the machine.
> > 
> > Maybe include a note about why this is important, ie, we care because
> > malicious devices may be attached to an external port?  I know you
> > have that in the commit log but it would be more visible here.
> > 
> > Elsewhere you use "external-facing", here too for consistency?
> 
> Makes sense, I'll add a note. I currently have:
> 
> - external-facing:
>    When present, the port is external-facing. All bridges and endpoints
>    downstream of this port are external to the machine. The OS can, for
>    example, use this information to identify devices that cannot be
>    trusted with relaxed DMA protection, as users could easily attach
>    malicious devices to this port.

Looks good to me!
