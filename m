Return-Path: <robherring2@gmail.com>
Date: Fri, 7 Dec 2018 17:32:34 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties
 for HSIC pin groups
Message-ID: <20181207233234.GA1419@bogus>
References: <20181127092824.22756-1-peter.chen@nxp.com>
 <20181127092824.22756-5-peter.chen@nxp.com>
 <CAOMZO5CV9Hk5ORnmjOLSZv5bk61nc2Ljq_4vKvRvAvO_F=Fzxg@mail.gmail.com>
 <VI1PR04MB5327E51B366724706028E07E8BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <a081eb16-920a-0ff4-2ae7-7c9efd28668a@kontron.de>
 <CAOMZO5BdzvSNovd15jcijGBMzS_G+5xnmyNBXMH7S3cmwCfKMA@mail.gmail.com>
 <0215e99c-c024-42f6-9dad-4bab70bae193@kontron.de>
 <VI1PR04MB532787E6EF89EBFAAE052A0C8BA80@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB532787E6EF89EBFAAE052A0C8BA80@VI1PR04MB5327.eurprd04.prod.outlook.com>
To: PETER CHEN <peter.chen@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Fabio Estevam <festevam@gmail.com>, USB list <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 05, 2018 at 07:57:37AM +0000, PETER CHEN wrote:
>  
> > On 04.12.18 21:01, Fabio Estevam wrote:
> > > Hi Frieder,
> > >
> > > On Tue, Dec 4, 2018 at 12:31 PM Schrempf Frieder
> > > <frieder.schrempf@kontron.de> wrote:
> > >
> > >> There are many other optional properties for this driver and a lot of
> > >> them are not in the given example. Maybe we should just keep the
> > >> pinctrls for HSIC-mode out of the example, too?
> > >
> > > I am just trying to make life easier for those who want to use HSIC
> > > support with chipidea.
> > >
> > > Can we just add a real dts snippet example of your board into the
> > > binding document?
> > 
> > Sure, here is what I have in my dts:
> > 
> > &usbh2 {
> > 	pinctrl-names = "idle", "active";
> > 	pinctrl-0 = <&pinctrl_usbh2_idle>;
> > 	pinctrl-1 = <&pinctrl_usbh2_active>;
> > 	status = "okay";
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 
> > 	usbnet: smsc@1 {
> > 		compatible = "usb424,9730";
> > 		reg = <1>;
> > 	};
> > };
> > 
> > @Peter: Can you add this as a second example to the binding documentation?
> > 
> 
> So, there are two examples at binding-doc, one for normal, one for HSIC? Fabio, do you
> mean that? If DT maintainer agrees it too, I will add it.

Okay.
