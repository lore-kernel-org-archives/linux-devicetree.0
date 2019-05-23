From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [EXT] Re: [PATCHv2] arm64: dts: ls1028a: add flexspi nodes
Date: Thu, 23 May 2019 16:15:34 +0800
Message-ID: <20190523081533.GJ9261@dragon>
References: <20190515110924.13726-1-xiaowei.bao@nxp.com>
 <20190523080049.GI9261@dragon>
 <AM5PR04MB32997EA37551AFC88FCBE2C6F5010@AM5PR04MB3299.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM5PR04MB32997EA37551AFC88FCBE2C6F5010@AM5PR04MB3299.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 08:06:42AM +0000, Xiaowei Bao wrote:
> > +             compatible = "nxp,lx2160a-fspi", "simple-bus";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             reg = <0x0 0x20c0000 0x0 0x10000>,
> > +                 <0x0 0x20000000 0x0 0x10000000>;
> 
> Fix the indentation to git it aligned with above '<'.
> [Xiaowei Bao] this is aligned, I don't know why it is not aligned in email. Thanks.

That's fine then.

Shawn
