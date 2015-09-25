From: Wang Dongsheng <Dongsheng.Wang@freescale.com>
Subject: RE: [PATCH v3 1/2] fsl: Add binding for RCPM
Date: Fri, 25 Sep 2015 02:51:36 +0000
Message-ID: <SN1PR0301MB16165FD739C5CD90FB4352149D420@SN1PR0301MB1616.namprd03.prod.outlook.com>
References: <1443083354-37369-1-git-send-email-dongsheng.wang@freescale.com>
 <1443123009.32298.29.camel@freescale.com>
 <SN1PR0301MB161653CC69BB78A0A8B565569D420@SN1PR0301MB1616.namprd03.prod.outlook.com>
 <1443149032.32298.102.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1443149032.32298.102.camel@freescale.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Scott Wood <scottwood@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Zhao C.H." <chenhui.zhao@freescale.com>, Huan Wang <alison.wang@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yuantian Tang <Yuantian.Tang@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Jin Jason <Jason.Jin@freescale.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> On Thu, 2015-09-24 at 21:38 -0500, Wang Dongsheng-B40534 wrote:
> > > > +* Freescale RCPM Wakeup Source Device Tree Bindings
> > > > +-------------------------------------------
> > > > +Required rcpm-wakeup property should be added to a device node if the
> > > > device
> > > > +can be used as a wakeup source.
> > > > +
> > > > +  - rcpm-wakeup: The value of the property consists of cells, the
> > > > number of
> > > > +     cells defined in "fsl,#rcpm-wakeup-cells". The first cell is a
> > > > pointer
> > > > +     to the rcpm node, the second cell is the bit mask that should be
> > > > set
> > > > +     in IPPDEXPCR0, and the third cell is for IPPDEXPCR1, and so on.
> > >
> > > The phandle should not be included in the cell count.
> > >
> >
> > Yes, the first cell "&rcpm" should be in the cell count, right?
> 
> No.  None of the other #foo-cells work that way.
> 

Sorry a type wrong. I means the first cell "&rcpm" should *NOT* be in the cell count.

Regards,
-Dongsheng
