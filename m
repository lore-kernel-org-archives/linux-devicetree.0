From: Yuantian Tang <Yuantian.Tang@freescale.com>
Subject: RE: [PATCH v2 1/2] fsl: Add binding for RCPM
Date: Wed, 16 Sep 2015 02:35:10 +0000
Message-ID: <DM2PR03MB574196E1A0D55C185CE1B4BFA5B0@DM2PR03MB574.namprd03.prod.outlook.com>
References: <1442307339-15225-1-git-send-email-dongsheng.wang@freescale.com>
 <1442361398.2909.164.camel@freescale.com>
 <SN1PR0301MB1616C48FB3D990BCA45289AB9D5B0@SN1PR0301MB1616.namprd03.prod.outlook.com>
 <1442369955.2909.166.camel@freescale.com>
 <SN1PR0301MB161688E3AF527ADC76AB2B8F9D5B0@SN1PR0301MB1616.namprd03.prod.outlook.com>
 <1442370701.2909.167.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1442370701.2909.167.camel@freescale.com>
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
To: Scott Wood <scottwood@freescale.com>, Wang Dongsheng <Dongsheng.Wang@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Zhao C.H." <chenhui.zhao@freescale.com>, Huan Wang <alison.wang@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Jin Jason <Jason.Jin@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Wood Scott-B07421
> Sent: Wednesday, September 16, 2015 10:32 AM
> To: Wang Dongsheng-B40534 <Dongsheng.Wang@freescale.com>
> Cc: devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org; Wang Huan-
> B18965 <alison.wang@freescale.com>; Jin Zhengxiong-R64188
> <Jason.Jin@freescale.com>; Zhao Chenhui-B35336
> <chenhui.zhao@freescale.com>; Tang Yuantian-B29983
> <Yuantian.Tang@freescale.com>
> Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
> 
> On Tue, 2015-09-15 at 21:30 -0500, Wang Dongsheng-B40534 wrote:
> > Hi Scott,
> >
> > > -----Original Message-----
> > > From: Wood Scott-B07421
> > > Sent: Wednesday, September 16, 2015 10:19 AM
> > > To: Wang Dongsheng-B40534
> > > Cc: devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> > > robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org; Wang Huan-
> > > B18965; Jin
> > > Zhengxiong-R64188; Zhao Chenhui-B35336; Tang Yuantian-B29983
> > > Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
> > >
> > > On Tue, 2015-09-15 at 21:15 -0500, Wang Dongsheng-B40534 wrote:
> > > > Hi Scott,
> > > >
> > > > > -----Original Message-----
> > > > > From: Wood Scott-B07421
> > > > > Sent: Wednesday, September 16, 2015 7:57 AM
> > > > > To: Wang Dongsheng-B40534
> > > > > Cc: devicetree@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> > > > > robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org; Wang
> > > > > robh+Huan-
> > > > > B18965; Jin
> > > > > Zhengxiong-R64188; Zhao Chenhui-B35336; Tang Yuantian-B29983
> > > > > Subject: Re: [PATCH v2 1/2] fsl: Add binding for RCPM
> > > > >
> > > > > On Tue, 2015-09-15 at 16:55 +0800, Dongsheng Wang wrote:
> > > > > > +* Freescale RCPM Wakeup Source Device Tree Bindings
> > > > > > +-------------------------------------------
> > > > > > +Required rcpm-wakeup property should be added to a device
> > > > > > +node if the
> > > > > > device
> > > > > > +can be used as a wakeup source.
> > > > > > +
> > > > > > +  - rcpm-wakeup: The value of the property consists of 3 cells.
> > > > > > + The
> > > > > > first
> > > > > > cell
> > > > > > +     is a pointer to the rcpm node, the second cell is the
> > > > > > + bit mask
> > > > > > that
> > > > > > +     should be set in IPPDEXPCR0, and the last cell is for
> > > > > > IPPDEXPCR1.
> > > > > > +     Note: If the platform has no IPPDEXPCR1 register, put a
> > > > > > + zero
> > > > > > here.
> > > > >
> > > > > What if a future platform has more than two of these registers?
> > > >
> > > > Those registers are only used for wakeup device, we have a lot of
> > > > available bit for feature. For example, In LS1021a platform only
> > > > 7bits has used in the registers, and 57bits is reserved.
> > >
> > > Still, it'd be better to for the rcpm node to advertise the number
> > > of cells it expects.
> >
> > For the foreseeable future it should be enough to use, even if not
> > enough to use in the future at that time we can update the binding.
> 
> That's the whole point.  Device tree is stable ABI.  Updating it later to not be
> fixed to two cells would be a lot harder than getting it right from the
> beginning.  Putting the number of cells in the phandle target is a standard
> device tree idiom.
> 
I agree with you. But what's the point a SOC has more than 64 wakeup source?

Regards,
Yuantian

> -Scott
