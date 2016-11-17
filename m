From: Abhimanyu Saini <abhimanyu.saini@nxp.com>
Subject: RE: [RESEND][PATCH 6/6] arm64: Add DTS support for FSL's LS2088A SoC
Date: Thu, 17 Nov 2016 12:31:03 +0000
Message-ID: <AM2PR04MB059660B0CD1A643A1AB75C08EDB10@AM2PR04MB0596.eurprd04.prod.outlook.com>
References: <1478597664-14799-1-git-send-email-abhimanyu.saini@nxp.com>
 <1478597664-14799-7-git-send-email-abhimanyu.saini@nxp.com>
 <20161114063346.GH3310@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161114063346.GH3310@dragon>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Priyanka Jain <priyanka.jain@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, Scott Wood <scott.wood@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > Following levels of DTSI/DTS files have been created for the LS2088A
> > SoC family:
> >
> >      - fsl-ls2088a.dtsi:
> >             DTS-Include file for FSL LS2088A SoC.
> >
> >      - fsl-ls2088a-qds.dts:
> >             DTS file for FSL LS2088A QDS board.
> >
> >      - fsl-ls2088a-rdb.dts:
> >             DTS file for FSL LS2088A RDB board.
> 
> I compared the following files.
> 
>  fsl-ls2088a.dtsi vs. fsl-ls2080a.dtsi
>  fsl-ls2088a-qds.dtsi vs. fsl-ls2080a-qds.dtsi  fsl-ls2088a-rdb.dtsi vs.
> fsl-ls2080a-rdb.dtsi
> 
> They are basically identical except a couple of small changes.  Can we do
> something to have these SoCs share the dts files at some level to avoid
> maintaining duplicated files?

Hi Shawn,

Yes, we could reorganize DTSI and DTS file.
I can create fsl-ls2080a-ls2088a.dtsi and move all the common nodes to this file,

Then fsl-ls2080a.dtsi and fsl-ls2088a.dtsi which will include
the common file and add ls2080a and ls2088a specific nodes respectively.

Same hierarchy can be created for fsl-ls2080a-qds.dts, fsl-ls2080a-rdb,
fsl-ls2088a-qds.dts and fsl-ls2088a-rdb, wherein the common nodes will lie in
fsl-ls2080a-ls2088a-qds.dts and fsl-ls2080a-ls2088a-rdb.dts

What do you think?

Abhimanyu
