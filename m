From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Handling device shared SFR on dt platform
Date: Tue, 03 Apr 2012 10:04:54 -0600
Message-ID: <20120403160454.BDFF23E0598@localhost>
References: <4F6A5853.9090809@gmail.com>
 <20120324193200.822AD3E0B06@localhost> <4F736A4A.6050302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F736A4A.6050302@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2012 21:45:14 +0200, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hello Grant,
> 
> On 03/24/2012 08:32 PM, Grant Likely wrote:
> >
> > Generally, this is handled by having a third node for the shared
> > register block and both device nodes holding a phandle to it.
> > 
> > No, there isn't any common infrastructure for implementing this, but
> > it isn't very much code.
> 
> Thank you, that sounds good. I'm just wondering how to handle the shared
> resource access synchronisation. There is an IORESOURCE_MUXED resource type 
> flag which could be used to prevent drivers from stomping on each others 
> feet when accessing the shared register, if I understand the software muxed
> resource semantics correctly. That is, using something like 
> request_muxed_(mem_)region()/release_mem_region() for the shared register
> protection.
> 
> What concerns me, is an overhead from region request/ioremap(?)/release, just
> to access a single 32-bit register. I'm going to see if those accesses could
> be moved to only device driver's probe() and remove() callbacks and what might
> be the resulting power consumption increase from that, if any.

Personally, I'd just create a shared function used by both drivers to
access the register and protect it with a spinlock.  That way the
region only needs to be mapped once, and the overhead is as low as
possible.

g.
