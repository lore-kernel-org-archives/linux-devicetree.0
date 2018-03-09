Return-Path: <SRS0=oSLL=F7=linux.intel.com=heikki.krogerus@kernel.org>
Date: Fri, 9 Mar 2018 09:34:18 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties for
 typec power delivery
Message-ID: <20180309073418.GF21904@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <CGME20180226120532epcas5p3c4b0258ec0677939f4241b24da5f48bc@epcas5p3.samsung.com>
 <1519645759-12701-11-git-send-email-jun.li@nxp.com>
 <20522804-65ab-5d48-716a-c199e4c095fc@samsung.com>
 <VI1PR0402MB39175D757B94FB52CB5A09F889DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <133b5194-26ff-071a-d3d1-2bfca1375cae@samsung.com>
 <VI1PR0402MB3917B47072CEC815AB6AE06A89D90@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <20180306120202.GA4951@kuha.fi.intel.com>
 <VI1PR0402MB3917083C9CEAA9418D37C80F89DF0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB3917083C9CEAA9418D37C80F89DF0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 08, 2018 at 01:41:23AM +0000, Jun Li wrote:
> > If you are asking my opinion, the data role must be handled as separate
> > capability of the port, i.e. you probable want to have separate properties for
> > the power role and data role, even if we did not support that yet in the class
> > code. Don't use "port-type" name, just call them "power-role" and
> > "data-role" from now on.
> > 
> 
> OK, I will introduce power-role and data-role, meanwhile, I think the class code
> should be changed accordingly(looks like your attached patch is doing that).

True. I'll send the patch out now.


Thanks,

-- 
heikki
