From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Sun, 25 Jan 2015 14:18:22 -0500
Message-ID: <20150125191822.GI24989@titan.lakedaemon.net>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org>
 <20150119182113.GH32663@lunn.ch> <op.xsrcplz12s3iss@ecaz>
 <54C51FAA.4080300@gmail.com> <20150125170925.GB23862@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150125170925.GB23862@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 25, 2015 at 06:09:25PM +0100, Andrew Lunn wrote:
> > >>>+
> > >>>+        power {
> > >>>+            label = "mamba:white:power";
> > >>
> > >>Please replace this mamba with wrt1900ac. It is a property of the
> > >>device, not the board. Another device using the mamba board may use it
> > >>differently.
> > >>
> > >
> > >See above.
> > 
> > The LED should be named by the device, not the platform. If OpenWRT
> > userspace already expects "mamba" in here, I guess we are stuck with
> > it. If not, call it "wrt1900ac:white:power".
> 
> Hi Sebastian
> 
> We have some flexibility here. There is the mantra, don't break
> userspace, but that only applies once code has reached mainline.

Full agree.

> If it is decided that mamba is used everywhere, then it should be used
> here. If wrt1900ac is used, then i would like to see this LED named
> wrt1900ac.

I think the main problem here is that we are trying to predict the
future decisions of an opaque entity (Linksys).  We can't.  All we can
do is be specific about what we have before us today.  Then we can
create a new compatible string in the future that reflects the
differences post-opaque-entity-decisions.

To that end, engineering is considerably more reliable than marketing.
So I would be inclined to use 'mamba' for this board.  If Linksys
creates a variant of this board and keeps the board name, then we can
call it 'mamba-v2'.  Or, 'mamba-revB' if that's on the silk layer.

At any rate, unless the DT maintainers disagree, compatible strings
should reflect engineering attributes, and 'model' should reflect
marketing names users would be familiar with.

So...

	model = "Linksys WRT1900AC";
	compatible = "linksys,mamba", "...";

...

	power {
		label = "mamba:white:power";

The most deceptive part of this is that 'wrt1900ac' sounds *so* specific
that we are inclined to trust it and use it.  But beware, marketing folks
have never heard of version control, compatibility, or consistency.
They are more likely to pull a Crazy Ivan [1] on us than Ivan himself. :-)

thx,

Jason.

[1] https://en.wikipedia.org/wiki/Crazy_Ivan
