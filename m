From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Date: Wed, 23 May 2018 11:37:14 -0700
Message-ID: <20180523183714.GR98604@atomide.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
 <20180417092924.GB20335@flint.armlinux.org.uk>
 <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
 <20180417144913.GD5669@atomide.com>
 <43ff3894-a287-1558-687c-40f50712735c@ti.com>
 <20180522200100.GA23937@rob-hp-laptop>
 <243730d3-e7f3-584d-b5dd-491c2700cf11@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <243730d3-e7f3-584d-b5dd-491c2700cf11@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, trini@konsulko.com, frowand.list@gmail.com, wmills@ti.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [180523 05:58]:
> On 22/05/18 23:01, Rob Herring wrote:
> > On Mon, May 21, 2018 at 09:57:54AM +0300, Tero Kristo wrote:
> > > Ok trying to resurrect this thread a bit. Is there any kind of consensus how
> > > things like this should be handled? Should we add the DT overlay files to
> > > kernel tree or not?
> > 
> > IMO, yes.

I too agree the overlay files should be in the kernel rather than
people having to try to figure out where to find them.

No idea how we'll verify they'll build though :) Maybe we
just need randconfig support for DT overlay files too?

Regards,

Tony
