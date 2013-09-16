From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 2/2] drivers: dma-contiguous: add initialization from
 device tree
Date: Mon, 16 Sep 2013 12:58:26 +1000
Message-ID: <1379300306.4098.79.camel@pasglop>
References: <1372254009-25307-1-git-send-email-m.szyprowski@samsung.com>
 <1372254009-25307-3-git-send-email-m.szyprowski@samsung.com>
 <CACxGe6uzau+g0gd=hkNYw1zdkfq18zt_m9OEaiJKR6=q1U4rag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACxGe6uzau+g0gd=hkNYw1zdkfq18zt_m9OEaiJKR6=q1U4rag@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Kyungmin Park <kyungmin.park@samsung.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

[resent to the right list this time around]

On Thu, 2013-07-11 at 15:56 +0100, Grant Likely wrote:

> > +contiguous-memory {
> > +
> > +       (name): region@(base-address) {
> > +               reg = <(baseaddr) (size)>;
> > +               (linux,default-contiguous-region);
> > +               device = <&device_0 &device_1 ...>
> > +       };
> > +};
> 
> Okay, I've gone and read all of the backlog on the 3 versions of the
> patch series, and I think I understand the issues. I actually think it
> was better off to have the regions specified as children of the memory
> node. I understand the argument about how would firmware know what
> size the kernel wants and that it would be better to have a kernel
> parameter to override the default. However, it is also reasonable for
> the kernel to be provided with a default amount of CMA based on the
> usage profile of the device. In that regard it is absolutely
> appropriate to put the CMA region data into the memory node. I don't
> think /chosen is the right place for that.

Picking up on that old thread after the rant I just posted ... Grant,
your proposal is all wrong.

First we already had a proposal for reserved memory, which due to the
complete lack of comment, we actually merged support for in powerpc in
3.11, second, do NOT make that a child of "memory". See the email I just
posted today for more details about the breakage in that proposal.

I'm advocating a revert at this stage.

Ben.
