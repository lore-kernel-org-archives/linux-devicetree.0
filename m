From: Manoil Claudiu <claudiu.manoil@freescale.com>
Subject: RE: [PATCH] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and eTSEC2
Date: Mon, 13 Jul 2015 15:08:39 +0000
Message-ID: <DM2PR03MB414D321810928CDA131A2849C9C0@DM2PR03MB414.namprd03.prod.outlook.com>
References: <1435213498-21025-1-git-send-email-b18965@freescale.com>
 <20150712065101.GA14354@localhost>
 <DM2PR03MB414BBD64BBDEB22DB0981619C9C0@DM2PR03MB414.namprd03.prod.outlook.com>
 <20150713133138.GO23464@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150713133138.GO23464@tiger>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Huan Wang <alison.wang@freescale.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Monday, July 13, 2015 4:32 PM
> To: Manoil Claudiu-B08782
> Cc: Wang Huan-B18965; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> shawn.guo@linaro.org
> Subject: Re: [PATCH] dts: ls1021a: Add dts nodes for eTSEC0, eTSEC1 and
> eTSEC2
> 
> I would like to see patch for bindings documentation before I apply this
> one.

Agreed.  I just noticed that this is an old version of the patch (using an
obsoleted property), so please expect a v2 of this patch as well,  besides
the device tree binding document which I think will be named:
./Documentation/devicetree/bindings/net/fsl-etsec2.txt.

Thanks.
Claudiu
