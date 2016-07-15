From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: RE: [PATCH v2 1/5] drivers: usb: chipidea: Add qoriq platform driver
Date: Fri, 15 Jul 2016 08:13:26 +0000
Message-ID: <HE1PR0401MB2331C636FB33E29796CA5868E3330@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
 <1468038656-10345-2-git-send-email-rajesh.bhagat@nxp.com>
 <20160711064358.GG31647@shlinux2>
 <HE1PR0401MB2331ED4FB7F699A8A1BA0BE6E3300@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <20160715071309.GF817@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160715071309.GF817@shlinux2>
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
To: Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Peter Chen [mailto:hzpeterchen@gmail.com]
> Sent: Friday, July 15, 2016 12:43 PM
> To: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Peter Chen <peter.chen@nxp.com>;
> gregkh@linuxfoundation.org; kishon@ti.com; robh+dt@kernel.org;
> shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 1/5] drivers: usb: chipidea: Add qoriq platform driver
> 
> On Tue, Jul 12, 2016 at 03:59:07AM +0000, Rajesh Bhagat wrote:
> > > > +
> > > > +err_clks:
> > > > +	ci_hdrc_qoriq_disable_unprepare_clks(pdev);
> > >
> > > If you have only one clock, it is unnecessary to use dedicated APIs for clock
> operation.
> > >
> >
> > We do have multiple clocks, but currently one is integrated in code.
> > Hence created the APIs for future use.

Hello Peter, 

> 
> If you could not integrate one more clocks, I suggest not creating dedicated API until
> you need in future.
> 

Okay, Will take care in v3. 

Best Regards,
Rajesh Bhagat 

> --
> 
> Best Regards,
> Peter Chen
