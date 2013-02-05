From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: davinci: da850: add wdt OF_DEV_AUXDATA entry
Date: Tue, 5 Feb 2013 06:39:20 +0000
Message-ID: <F3DBB1B3EF102E4994C89758CFCA32412C41F0@DBDE01.ent.ti.com>
References: <1359016695-10362-1-git-send-email-anilkumar.v@ti.com>
 <1359016695-10362-3-git-send-email-anilkumar.v@ti.com>
 <510FA09F.7030604@ti.com> <510FA2D4.7090807@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <510FA2D4.7090807-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Serqei,

On Mon, Feb 04, 2013 at 17:30:20, Sergei Shtylyov wrote:
> Hello.
> 
> On 04-02-2013 15:50, Sekhar Nori wrote:
> 
> > Auxdata is not evm specific. This can instead be called da850_auxdata_lookup[].
> 
> > Also, I dont think it is necessary to add auxdata in a separate patch
> > from dt nodes. So, I fixed these issues and came up with below patch. I
> > tested basic wdt reboot. reboot command is still broken (with or
> > without this patch). Can you please look at that?
> 
> > Thanks,
> > Sekhar
> 
> > ----8<----
> > From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
> > Date: Thu, 24 Jan 2013 14:08:14 +0530
> > Subject: [PATCH 1/1] ARM: davinci: da850: add wdt DT node
> 
> > Add da850 wdt DT node.
> 
> > Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> > Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> [...]
> 
> > diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> > index 8dd15c0..2800090 100644
> > --- a/arch/arm/boot/dts/da850.dtsi
> > +++ b/arch/arm/boot/dts/da850.dtsi
> > @@ -88,6 +88,11 @@
> >   				      19>;
> >   			status = "disabled";
> >   		};
> > +		wdt: wdt@1c21000 {
> > +			compatible = "ti,davinci-wdt";
> > +			reg = <0x21000 0xfff>;
> 
>     Not 0x1000? This is region size, not upper limit.

Oh, you are right. It should be 0x1000. Thanks for correcting. 

In da850 timer1 is used as wdt and according to da850 data sheet.

Timer1 start address is 0x01C21000
Timer1 end address is   0x01C21FFF 

I had wrongly calculated upper limit. I will fix it. 

Thanks,
Anil
