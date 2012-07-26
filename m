From: "Mohammed, Afzal" <afzal@ti.com>
Subject: RE: [PATCH v2 6/6] arm/dts: am33xx rtc node
Date: Thu, 26 Jul 2012 08:04:10 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E9ADBE5@DBDE01.ent.ti.com>
References: <cover.1343191280.git.afzal@ti.com>
 <d16976055462214af276d7242faa2bc6e621fd44.1343191280.git.afzal@ti.com>
 <500FD698.30906@mvista.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9AD8B1@DBDE01.ent.ti.com>
 <501025EC.6010600@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <501025EC.6010600@mvista.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: "Hilman, Kevin" <khilman@ti.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "tony@atomide.com" <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob@landley.net" <rob@landley.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jul 25, 2012 at 22:29:24, Sergei Shtylyov wrote:

> >>> +		rtc@44e3e000 {
> 
> >>     Address postfix in the node name without "reg" property?
> 
> > As per [1], "The unit-address is included if the node describes
> > a device with an address".
> 
>    Which in this case it doesn't.
> 
> > Here even though reg property is not present, as via hwmod
> > (see below) it is getting address, isn't it better to have it
> 
>    I think not.

Ok, I will remove it
 
> >>> +			compatible = "ti,da830-rtc";
> >>> +			ti,hwmods = "rtc";

Regards
Afzal
