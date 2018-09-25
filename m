From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: Add support for NXP LS1028A SoC
Date: Tue, 25 Sep 2018 17:45:57 +0800
Message-ID: <20180925094556.GB21282@dragon>
References: <1535555668-7763-1-git-send-email-sudhanshu.gupta@nxp.com>
 <20180903015709.GC3850@dragon>
 <AM6PR04MB4407A9A699D60F0243FD7FB98C1E0@AM6PR04MB4407.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM6PR04MB4407A9A699D60F0243FD7FB98C1E0@AM6PR04MB4407.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, Harninder Rai <harninder.rai@nxp.com>, "stuart.yoder@nxp.com" <stuart.yoder@nxp.com>, Leo Li <leoyang.li@nxp.com>, "oss@buserror.net" <oss@buserror.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 05:43:47AM +0000, Bhaskar Upadhaya wrote:
> 
> >-----Original Message-----
> >From: Shawn Guo <shawnguo@kernel.org>
> >Sent: Monday, September 3, 2018 7:27 AM
> >To: Sudhanshu Gupta <sudhanshu.gupta@nxp.com>
> >Cc: devicetree@vger.kernel.org; Harninder Rai <harninder.rai@nxp.com>;
> >Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>; stuart.yoder@nxp.com;
> >Leo Li <leoyang.li@nxp.com>; oss@buserror.net; linux-arm-
> >kernel@lists.infradead.org
> >Subject: Re: [PATCH] arm64: dts: Add support for NXP LS1028A SoC
> >
> >On Wed, Aug 29, 2018 at 08:44:28PM +0530, Sudhanshu Gupta wrote:
> >> From: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> >>
> >> LS1028A contains two ARM v8 CortexA72 processor cores with 32 KB L1-D
> >> cache and 48 KB L1-I cache
> >> +&i2c0 {
> >> +	status = "okay";
> >> +
> >> +	pca9847@77 {
> >
> >Please have generic node name for the device.
> is i2c-mux@77 ok ?

There are some name suggestions in DeviceTree Specification [1].

Shawn

[1] https://www.devicetree.org/
