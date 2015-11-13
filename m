From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v6 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
Date: Fri, 13 Nov 2015 11:13:01 -0800
Message-ID: <20151113191301.GG8456@google.com>
References: <1446824889-16144-1-git-send-email-bayi.cheng@mediatek.com>
 <1446824889-16144-2-git-send-email-bayi.cheng@mediatek.com>
 <20151111203823.GJ12143@google.com>
 <1447399245.9118.14.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447399245.9118.14.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: bayi cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com, jteki@openedev.com, ezequiel@vanguardiasur.com.ar
List-Id: devicetree@vger.kernel.org

On Fri, Nov 13, 2015 at 03:20:45PM +0800, Bayi Cheng wrote:
> On Wed, 2015-11-11 at 12:38 -0800, Brian Norris wrote:
> > Applied to l2-mtd.git/next (for 4.5). This will show up in
> > linux-next.git after the merge window.
> > 
> > Also squashed in a small diff (below), to fix up some language issues
> > and to refer the reader to the jedec,spi-nor.txt document.
> > 
> 
> OK, I will fix it in next patch!

No, you don't need to send another patch. I already merged just this one
(the DT documentation) with my own small fixes, with a plan to go into
4.5. You only need to send another version of patch 2 (the driver).

During the merge window, I'm stashing changes in l2-mtd.git's 'next'
branch, so we can keep stuff that's going to 4.5 separate from stuff
thats getting merged to 4.4 right now. You can see it here for now:

http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/next

After the merge window closes (probably on Sunday), I'll bring this into
+master.

Regards,
Brian
