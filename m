From: "S.H. Xie" <shaohui.xie@nxp.com>
Subject: RE: [PATCH 5/7] [v2] arm64: dts: add LS1046A-RDB board support
Date: Fri, 9 Sep 2016 06:44:54 +0000
Message-ID: <DB5PR0401MB2183774C68CD9A7C93DDFE37E8FA0@DB5PR0401MB2183.eurprd04.prod.outlook.com>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-6-git-send-email-shh.xie@gmail.com>
 <20160908131218.GB16911@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160908131218.GB16911@tiger>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Vincent Hu <mingkai.hu@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, September 08, 2016 9:12 PM
> To: shh.xie@gmail.com
> Cc: devicetree@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-arm-kernel@lists.infradead.org; catalin.marinas@arm.com;
> will.deacon@arm.com; linux-kernel@vger.kernel.org; arnd@arndb.de; Vincent Hu
> <mingkai.hu@nxp.com>; S.H. Xie <shaohui.xie@nxp.com>
> Subject: Re: [PATCH 5/7] [v2] arm64: dts: add LS1046A-RDB board support
> 
> On Mon, Sep 05, 2016 at 06:01:33PM +0800, shh.xie@gmail.com wrote:
> > +&ifc {
> > +	status = "okay";
> 
> For sake of consistency, please have 'status' at the end of property list.
[S.H] Will fix it in next version.

Thanks,
Shaohui
