From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V2 3/3] nvmem: imx-ocotp: handling clock
Date: Tue, 10 May 2016 12:04:51 +0000
Message-ID: <HE1PR0401MB1801F1B547E4C694FDF1E9D388710@HE1PR0401MB1801.eurprd04.prod.outlook.com>
References: <1461173177-11930-1-git-send-email-van.freenix@gmail.com>
 <1461173177-11930-3-git-send-email-van.freenix@gmail.com>
 <5730825E.5030101@linaro.org> <20160509124140.GA20259@linux-7smt.suse>
 <5731B891.4040303@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5731B891.4040303@linaro.org>
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Peng Fan <van.freenix@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Srinivas Kandagatla
> Sent: Tuesday, May 10, 2016 6:32 PM
> To: Peng Fan <van.freenix@gmail.com>
> Cc: shawnguo@kernel.org; maxime.ripard@free-electrons.com; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH V2 3/3] nvmem: imx-ocotp: handling clock
> 
> 
> 
> On 09/05/16 13:41, Peng Fan wrote:
> > Hi Srinivas,
> >
> > On Mon, May 09, 2016 at 01:28:14PM +0100, Srinivas Kandagatla wrote:
> >> Thanks for the Ping, I totally missed this thread.
> >>
> >> On 20/04/16 18:26, Peng Fan wrote:
> >>> Before access ocotp nvmem area, the clock should be enabled.
> >>> Or, `hexdump nvmem` will hang the system. So, use such flow:
> >>> "
> >>>    1. clock_enable_prepare
> >>>    2. read nvmem ocotp area
> >>>    3. clock_disable_unprepare
> >>> "
> >>>
> >>> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> >>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>> Cc: Shawn Guo <shawnguo@kernel.org>
> >>> ---
> >>>
> >>> V2:
> >>>   Follow Fabio's comments, check return value of clk_prepare_enable
> >>>
> >>>   drivers/nvmem/imx-ocotp.c | 16 +++++++++++++++-
> >>>   1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >> Changes to the driver looks good to me, Only one comment, As the
> >> clock property is now made mandatory, you should update the
> >> dt-bindings with this info too.
> >
> > In Documentation/devicetree/bindings/nvmem/imx-ocotp.txt,
> > the clock property is already marked Required properties:
> 
> Ok, I can take this patch, dt patch should go via the dt maintainers.

Thanks, Srinivas.

Shawn,

Will you review and pick up the other two patches, since changes to i.MX dts files?

https://lkml.org/lkml/2016/4/20/150          arm: dts: imx6qdl: add clocks property for ocotp node  
https://lkml.org/lkml/2016/4/20/153          arm: dts: imx6sl: add clocks property for ocotp node

Thanks,
Peng.
> 
> thanks,
> --srini
