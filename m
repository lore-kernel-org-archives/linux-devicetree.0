From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V8 2/2] mailbox: introduce ARM SMC based mailbox
Date: Tue, 24 Sep 2019 02:54:29 +0000
Message-ID: <AM0PR04MB4481500C3000D2CCEE548DC288840@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1569287538-10854-1-git-send-email-peng.fan@nxp.com>
 <1569287538-10854-3-git-send-email-peng.fan@nxp.com>
 <1f01ea8e-8953-82ae-933c-721385dc0c13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1f01ea8e-8953-82ae-933c-721385dc0c13@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Florian

> Subject: Re: [PATCH V8 2/2] mailbox: introduce ARM SMC based mailbox
> 
> Hi Peng,
> 
> On 9/23/2019 6:14 PM, Peng Fan wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > This mailbox driver implements a mailbox which signals transmitted
> > data via an ARM smc (secure monitor call) instruction. The mailbox
> > receiver is implemented in firmware and can synchronously return data
> > when it returns execution to the non-secure world again.
> > An asynchronous receive path is not implemented.
> > This allows the usage of a mailbox to trigger firmware actions on SoCs
> > which either don't have a separate management processor or on which
> > such a core is not available. A user of this mailbox could be the SCP
> > interface.
> >
> > Modified from Andre Przywara's v2 patch
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=02%7C01%7
> Cpeng.fa
> >
> n%40nxp.com%7C296c7cd2225e4ca32bb808d74099afb2%7C686ea1d3bc2b4
> c6fa92cd
> >
> 99c5c301635%7C0%7C0%7C637048901144091126&amp;sdata=JDo%2Be7Tt
> hoi4jve0O
> > S8qe3%2Fpji4g8CgRxL7ntCQx3Fg%3D&amp;reserved=0
> >
> > Cc: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> 
> [snip]
> 
> > +typedef unsigned long (smc_mbox_fn)(unsigned int, unsigned long,
> > +				    unsigned long, unsigned long,
> > +				    unsigned long, unsigned long,
> > +				    unsigned long);
> > +static smc_mbox_fn *invoke_smc_mbox_fn;
> 
> Sorry for spotting this so late, the only thing that concerns me here with this
> singleton is if we happen to have both an arm,smc-mbox and arm,hvc-mbox
> configured in the system, this would not work.

Yes. Thanks for spotting this.

 I do not believe this could be a
> functional use case, but we should probably guard against that or better yet,
> move that into the arm_smc_chan_data private structure?

Agree. Will Fix in v9.

Thanks,
Peng.

> --
> Florian
