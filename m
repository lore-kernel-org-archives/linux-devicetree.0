From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH v2 1/5] drivers: usb: chipidea: Add qoriq platform driver
Date: Fri, 15 Jul 2016 15:13:09 +0800
Message-ID: <20160715071309.GF817@shlinux2>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
 <1468038656-10345-2-git-send-email-rajesh.bhagat@nxp.com>
 <20160711064358.GG31647@shlinux2>
 <HE1PR0401MB2331ED4FB7F699A8A1BA0BE6E3300@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <HE1PR0401MB2331ED4FB7F699A8A1BA0BE6E3300@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 03:59:07AM +0000, Rajesh Bhagat wrote:
> > > +
> > > +err_clks:
> > > +	ci_hdrc_qoriq_disable_unprepare_clks(pdev);
> > 
> > If you have only one clock, it is unnecessary to use dedicated APIs for clock operation.
> > 
> 
> We do have multiple clocks, but currently one is integrated in code. Hence created 
> the APIs for future use. 

If you could not integrate one more clocks, I suggest not creating dedicated
API until you need in future.

-- 

Best Regards,
Peter Chen
