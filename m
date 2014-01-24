From: Yuantian Tang <Yuantian.Tang@freescale.com>
Subject: RE: [PATCH] clk: corenet: Update the clock bindings
Date: Fri, 24 Jan 2014 03:05:57 +0000
Message-ID: <ab64f4bbf44b41a3bd462f538dffc6d4@BL2PR03MB115.namprd03.prod.outlook.com>
References: <1390269732-22798-1-git-send-email-Yuantian.Tang@freescale.com>
 <1390437863.24905.549.camel@snotra.buserror.net>
 <d61cabaec0af4aada9fadf93e7c0bb61@BL2PR03MB115.namprd03.prod.outlook.com>
 <1390511008.24905.581.camel@snotra.buserror.net>
 <a0800d606e364b5980fe5c17efca9d9e@BL2PR03MB115.namprd03.prod.outlook.com>
 <1390530934.24905.639.camel@snotra.buserror.net>
 <ac1c6cb1a6e54f6e87b76e2a3006b64a@BL2PR03MB115.namprd03.prod.outlook.com>
 <1390531664.24905.640.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1390531664.24905.640.camel@snotra.buserror.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "prabhakar@freescale.com" <prabhakar@freescale.com>
List-Id: devicetree@vger.kernel.org

> > > > > In any case, if "qoriq" makes sense for the compatible, I don't
> > > > > see why it doesn't make sense for the driver.
> > > > >
> > > > So, "Corenet" is appropriate for driver.
> > > > If something should change, that must be compatible string.
> > >
> > > No.  Corenet is a bus interconnect, not a chip family (despite abuse
> > > of the name in other contexts in Linux/U-Boot).  And the binding
> > > with qoriq has already been accepted.
> > >
> > QorIQ is not the best name either since it include the low-end socs.
> > What the name should be?
> 
> Again, those low-end chips do not implement "QorIQ Chassis 1.0" or "QorIQ
> Chassis 2.0".  That they have "QorIQ" in their name is irrelevant.
> 
Got it. 

Regards,
Yuantian

> -Scott
> 
