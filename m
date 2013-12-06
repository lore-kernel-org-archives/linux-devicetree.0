From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 5/7] net: of_mdio: parse "max-speed" property to set PHY
 supported features
Date: Thu, 05 Dec 2013 16:03:57 -0800
Message-ID: <1386288237.10003.38.camel@joe-AO722>
References: <1386283936-26104-1-git-send-email-florian@openwrt.org>
	 <1386283936-26104-6-git-send-email-florian@openwrt.org>
	 <52A11F00.1070603@cogentembedded.com>
	 <CAGVrzcYeRi=j3PkRbtNXwYFGOr9m7Yco0jORdp76i+DcRNpMFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAGVrzcYeRi=j3PkRbtNXwYFGOr9m7Yco0jORdp76i+DcRNpMFA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, abrodkin@synopsys.com, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-12-05 at 15:53 -0800, Florian Fainelli wrote:
> 2013/12/5 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>:
> >>
> >> +       /* Set phydev->supported based on the "max-speed" property
> >> +        * if present */
[]
> All other comments in this file are:
> 
> /* bla
>  * bla
>  */
> 
> which is why I used the same style.

Kind of.  This should be:

	/* Set phydev->supported based on the "max-speed" property
	 * if present
	 */

Or if you want to use all 80 columns:

	/* Set phydev->supported based on the "max-speed" property if present */

or maybe

	/* Set phydev->supported using the "max-speed" property (if present) */
