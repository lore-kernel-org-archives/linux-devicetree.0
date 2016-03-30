From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [RFC PATCH 0/4] Implement USB device/host switch for Vybrid
Date: Wed, 30 Mar 2016 08:07:13 +0000
Message-ID: <HE1PR04MB1450A32BDE5CA5C06124561A8B980@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
 <20160325074051.GB22398@peterchendt>
 <3c2e72efc8cae93ff31be1b44f9a02b3@agner.ch>
 <HE1PR04MB1450691A838973845B7AD16F8B870@HE1PR04MB1450.eurprd04.prod.outlook.com>
 <20160330063246.GA16028@Sanchayan-Arch.toradex.int>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160330063246.GA16028@Sanchayan-Arch.toradex.int>
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
To: "maitysanchayan@gmail.com" <maitysanchayan@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>, "ivan.ivanov@linaro.org" <ivan.ivanov@linaro.org>, Peter Chen <hzpeterchen@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "marcel@ziswiler.com" <marcel@ziswiler.com>
List-Id: devicetree@vger.kernel.org

 
> 
> On 16-03-29 00:24:46, Peter Chen wrote:
> >
> > >
> > > On 2016-03-25 00:40, Peter Chen wrote:
> > > > On Tue, Mar 15, 2016 at 02:08:26PM +0530, Sanchayan Maity wrote:
> > > >> Hello Peter,
> > > >>
> > > >> The existing usage of extcon in Chipidea driver relies on OTG
> > > >> registers. In case of SoC with dual role device but not a true
> > > >> OTG controller, this does not work. Such SoC's should specify the
> > > >> existing CI_HDRC_DUAL_ROLE_NOT_OTG flag and do the role switch
> > > >> without checking any of the OTG registers in my opinion.
> > > >> This is the case for Vybrid which uses a Chipidea IP but does not
> > > >> have a true 5 pin OTG implemented.
> > > >
> > > > Sorry to reply you late due to my new born baby.
> > > >
> > > > Are you sure Vybrid is NOT OTG core? Afaik, it is uses the same IP
> > > > base with other Freescale SoCs, just the IP core is 2.40a.
> > > > When working at device mode, can you read vbus status through OTGSC?
> > > > And if there is an ID pin (input pin) for Vybrid? I mean SoC, not
> > > > the board.
> > >
> > > I think the IP is actually OTG capable, the registers are there, but
> > > the signals seem not to be available on the SoC package. That is also what
> the RM says...
> > >
> > > Quotes from the RM:
> > >
> > > "OTG controller should be treated as Dual role controller that
> > > allows the controller to act as either a Host or a device with no
> > > support for HNP/SRP."
> > >
> > > And later, in Chapter 11.1:
> > >
> > > "The USB is not a true OTG. It can be configured by software to
> > > function either as peripheral or as host. The ID pin, which is
> > > unique for OTG operation, is not present in this implementation.
> > > There are no five pin interface. The user will get four pin host/ device
> interface."
> > >
> >
> > Get it, thanks. I am doing a patch for covering this case and vbus always-on
> case.
> 
> If I may ask at this point, how would your implementation be covering this case
> for Vybrid?
> 

Yes, if the vbus and id status are from the extcon, it will not read register OTGSC.

Peter
