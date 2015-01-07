From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] dma: X-Gene PCIE DMA Driver
Date: Wed, 07 Jan 2015 17:22:14 +0100
Message-ID: <1765004.TVkcxIlmTg@wuerfel>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
 <9430055.pMHRTP0RMA@wuerfel>
 <CAL-zptNW81KwWXnMcsh_S5KQFMNGysm=ATmixMge6RXj_U-_zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL-zptNW81KwWXnMcsh_S5KQFMNGysm=ATmixMge6RXj_U-_zQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mayuresh Chitale <mchitale@apm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "jcm@redhat.com" <jcm@redhat.com>, "patches@apm.com" <patches@apm.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 07 January 2015 21:35:22 Mayuresh Chitale wrote:
> >
> > I think I'm missing something important here. What exactly is the
> > interaction with PCI here? Is it possible to use the dmaengine
> > driver at all when the PCI host controller is not in endpoint mode?
> Yes. Dmaengine driver can be used when port is configured as RC or EP.
> >
> > Does the dmaengine show up as a PCI device when the PCI controller is
> > in host mode?
> No. It sits between AXI and PCI interfaces but it needs to be
> programmed via the config bar.

Ok, I see. So in RC mode, it sounds like this is a regular DMA engine
that could be used with arbitrary slaves, but in EP mode it would
actually be controlled by the remote host, right?

When we are in RC mode, who sets up that BAR? If this is set up by
the firmware, we can just have the register appear in the DT as well,
as it's known, and when we are in EP mode, it sounds like we would
not even use the dmaengine because it's owned by the other host.

Or is there a way that in EP mode, both sides would access the
dma engine simultaneously?

	Arnd
