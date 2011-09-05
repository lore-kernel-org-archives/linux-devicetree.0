From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 5 Sep 2011 15:32:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1109051528520.20358@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<BANLkTik_hH9tZ5MMbOYzhZwLFTFQyJyfRg@mail.gmail.com>
	<alpine.LFD.2.00.1106131640370.2142@xanadu.home>
	<20110905154335.GH1903@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110905154335.GH1903@atomide.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Lindgren <tony@atomide.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, John Bonesio <bones@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 5 Sep 2011, Tony Lindgren wrote:

> * Nicolas Pitre <nicolas.pitre@linaro.org> [110613 13:41]:
> > On Sun, 12 Jun 2011, Grant Likely wrote:
> > 
> > > On Sun, Jun 12, 2011 at 12:06 AM, Nicolas Pitre
> > > <nicolas.pitre@linaro.org> wrote:
> > > > This is a resend of those patches with fixups after the latest changes
> > > > in mainline.
> > > >
> > > > [PATCH 1/3] ARM: zImage: ensure it is always a multiple of 64 bits in size
> > > > This one is new and trivial.
> > > >
> > > > [PATCH 2/3] ARM: zImage: Allow the appending of a device tree binary
> > > > Mostly John Bonesio's version with some adjustments and cleanups.
> > > >
> > > > [PATCH 3/3] ARM: zImage: make sure appended DTB doesn't get overwritten by kernel .bss
> > > > New, simpler alternative to Tony Lindgren's version.
> > > 
> > > I've gone ahead and added the series to devicetree/test for anyone who
> > > want to play with it.
> > 
> > I've published those patches with all the latest fixes and ACKs here:
> > 
> > 	git://git.linaro.org/people/nico/linux.git zImage_DTB_append
> 
> Ping, any news on getting these merged?

I should come around to it once my current memory.h cleanup work is in 
shape. This might depend on some new Kbuild facility from Arnaud Lacombe 
I've yet to test.


Nicolas
