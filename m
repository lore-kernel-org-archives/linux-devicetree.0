From: Ryan Harkin <ryan.harkin@linaro.org>
Subject: Re: [PATCH 1/5] ARM: vexpress: Get rid of MMIO_P2V
Date: Thu, 17 Nov 2011 07:02:36 +0000
Message-ID: <1321513356.2638.1.camel@vaio.config>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-2-git-send-email-pawel.moll@arm.com>
 <20111116153516.GB2073@localhost.localdomain>
 <1321460205.3137.352.camel@hornet.cambridge.arm.com>
 <20111116172815.GF2073@localhost.localdomain>
 <1321464634.3137.382.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1321464634.3137.382.camel@hornet.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Dave Martin <dave.martin@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2011-11-16 at 17:30 +0000, Pawel Moll wrote:
> On Wed, 2011-11-16 at 17:28 +0000, Dave Martin wrote:
> > > > Is there anything else blocking the building of legacy and RS1 memory
> > > > maps into a single kernel?
> > > > (I'm still hazy on how all the remapping stuff works, myself.)
> > > 
> > > This works now - I have a single binary kernel that works on both A9 and
> > > A5 coretiles. Of course the ATAG-based support works with A9 only.
> > 
> > Cool -- we should get Ryan and Tixy to try it out, if they haven't already.
> > I don't have an A5 handy...
> 
> Good idea. I'll send them instructions how to boot "DT-enabled" kernel
> using Boot Monitor tomorrow and ask to try the series.

I have both boards here waiting your command.
