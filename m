From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 13:14:43 +0100
Message-ID: <201311051314.43629.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <527814E4.9050204@wwwdotorg.org>
 <20131104222135.GA10711@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131104222135.GA10711@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, khilman@linaro.org, Stephen Warren <swarren@nvidia.com>, s.nawrocki@samsung.com, pawel.moll@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, fparent@baylibre.com, a.hajda@samsung.com, Benoit Cousson <bcousson@baylibre.com>, galak@codeaurora.org, olof@lixom.net, Alison_Chaiken@mentor.com, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Monday 04 November 2013, Jason Gunthorpe wrote:
> On Mon, Nov 04, 2013 at 02:43:00PM -0700, Stephen Warren wrote:

> > For DMA, it does look like Arnd's code was requesting it too, but that
> > should also be fine; as long as no transactions are actually issued
> > against that DMA slave channel, then the HW state shouldn't matter?
> 
> TBH, I'm not really familiar with how the DMA slave API works.
> 
> As long as the API and HW guarantees that the channel cannot do any
> DMAs no matter what the connected IP does, it is obviously fine..

Right, to initiate a DMA, you need to at least request a channel,
configure it, and submit a descriptor. This does only the first
step, so I'm pretty it's ok.

> But not all DMA is like that, eg bus master DMA in PCI requires
> drivers to call pci_enable_device only after they disable DMA in the
> device, which is why I mentioned it..

Yes, a DMA bus master device is different here and needs to be
handled as you exlain.

> It would be nice to see a general API like this unambiguously make
> clear the steps required:
> 
> - Gain access to registers
> - Gain control of the device
> - Enable DMA, bind interrupts, etc
> - Finalize device setup
> - Make the device visible to the rest of the system
> 
> I've seen lots of drivers where the above is just not done right.

I agree this would be nice, but it's probably out of scope of what
we're trying to do here, unless you have better ideas for how to
structure it.

	Arnd
