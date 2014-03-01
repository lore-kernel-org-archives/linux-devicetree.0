From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v5 06/11] drivers: of: initialize and assign reserved
 memory to newly created devices
Date: Sat, 01 Mar 2014 20:20:48 +0000
Message-ID: <20140301202048.39FB9C40B6D@trevor.secretlab.ca>
References: <1392985527-6260-1-git-send-email-m.szyprowski@samsung.com> <
 1392985527-6260-7-git-send-email-m.szyprowski@samsung.com> <20140226121445.
 54D2DC40A89@trevor.secretlab.ca> <530F0F24.2080903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <530F0F24.2080903@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Tomasz Figa <t.figa@samsung.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Josh Cartwright <joshc@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On Thu, 27 Feb 2014 11:10:44 +0100, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Hello,
> 
> On 2014-02-26 13:14, Grant Likely wrote:
> > On Fri, 21 Feb 2014 13:25:22 +0100, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > Use recently introduced of_reserved_mem_device_init() function to
> > > automatically assign respective reserved memory region to the newly created
> > > platform and amba device.
> > >
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > I'm wary on this patch. It hides the assignment of regions into the core
> > code and I worry that it is the wrong level of abstraction. I would
> > think that drivers should know that they need a reserved memory region
> > and should be calling the API to obtain the region directly rather than
> > doing it for them. The reason being is that there may be some situations
> > where the common code isn't quite right and the driver needs to override
> > the behaviour. If it is called automatically then the driver cannot do
> > that.
> >
> > Is it really a big burden to have the driver call the reserved memory
> > init function?
> 
> If a device requires very special handling of the reserved memory region,
> it may simply provide its own reserved memory region driver which will do
> the required early initialization.
> 
> If we assume that driver needs to initialize reserved region manually, then
> why do we ever bother with adding support for custom reserved memory drivers
> and assigning regions to a device node? We can simply stick with just a set
> of reserved regions and tell drivers to use them.
> 
> In my opinion for most typical use cases a board designer will assign
> 'dma-shared-pool' driver to the given set of devices, which in turn ensures
> that all memory allocations for dma purposes for those device will be
> served from that region. It is really not a driver role to initialize it
> in such case. Driver should focus on controlling hw operations, regardless
> the way the hardware module has been integrated to the system.
> 
> I can perfectly imagine a generic driver which operates the same way in any
> of the following cases (depends mainly on the hw version): 1) restricted
> dma window, 2) iommu for all dma for the given device, 3) fully featured
> memory master for dma for the given device (no restrictions), if the
> respective kernel subsystems did the correct initialization and provide
> their own methods for managing DMA operation. I already have a working
> platform glue code for the above cases tested with Samsung multimedia
> drivers. No changes to the drivers were required.

I don't have issue with the above. What I do have issue with is that by
putting the call into core code, it means this binding gets applied to
every platform devices, regardless of whether or not it makes sense. Yes
of course there should be a common function for setting it up, and
of_reserved_mem_device_init() looks about right. However, I strongly
think that the setup call should be performed by the driver's .probe
hook. I don't want it in of_platform_device_create_pdata().

g.
