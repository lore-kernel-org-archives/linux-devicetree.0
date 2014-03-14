From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v3][ 3/9] usb: chipidea: Use standard usb-phy property.
Date: Fri, 14 Mar 2014 01:57:07 +0000
Message-ID: <171967ece1414f9ba0e80664777892cb@BL2PR03MB226.namprd03.prod.outlook.com>
References: <1394618518-13803-1-git-send-email-denis@eukrea.com>
 <1394618518-13803-3-git-send-email-denis@eukrea.com>
 <edb50dd0d88541c39fc4b5def88b7f58@BL2PR03MB226.namprd03.prod.outlook.com>
 <5321CF4B.9000308@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5321CF4B.9000308@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Denis Carikli <denis@eukrea.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, Alexander Shiyan <shc_work@mail.ru>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


 
> 
> > According to Power_ePAPR_APPROVED_v1.1.pdf "ethernet-phy" is the node
> > name, it is the same with Sergei's suggestion.
> 
>     Nobody's talking about "ehternet-phy" here.
> 

Hmm, you take "ethernet-phy" as an example, and suggest changing to "usb-phy" at last email.

> > But you have changed the property name at this patch, in fact,
> "fsl,usbphy"
> > is ok for property name, "fsl,usb-phy" may be better, but not worth a
> > patch to change it.
> 
>     No, it's not better and both are not OK because they're still
> Freescale specific while the de-facto standard property "usb-phy" is
> already used by other USB drivers for the same purpose.


Am I missing something, property name should be the same for all platforms?

At Power_ePAPR_APPROVED_v1.1, page 18, the example property name like below:

fsl,channel-fifo-len
ibm,ppc-interrupt-server#s
linux,network-index


Peter
