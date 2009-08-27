From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC] Clock binding
Date: Thu, 27 Aug 2009 12:45:25 -1000
Message-ID: <4A970C85.8090703@firmworks.com>
References: <1250569288.19007.15.camel@pasglop>	
	<1251346157.20467.22.camel@pasglop>
	<4A96F69A.5050003@firmworks.com>
	<1251411532.20467.74.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1251411532.20467.74.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

>
>> > One advantage of indices is that they avoid endless arguments about the 
>> > exact name (and spelling) of things.
>>     
>
> Right, though in that case, nobody gets to have to decide on the name,
> it comes from the chip manufacturer pin naming or data sheet.
>
>   


I agree in general.  It has long been a convention of mine to follow the 
vendor's names as exactly as possible.  But that often presents 
difficulties. Many of them have been touched on in our previous 
discussion but I'll list some here just to emphasize the problem we face:

a) Inconsistent naming within a vendor's documentation set - datasheet 
spells it one way, programmer's manual another, appnotes/porting guide 
still another, reference schematic spells it two different ways (pin 
name on part versus net name of signal wire).

b) Sometimes the name is abbreviated and sometimes spelled out.  SMBALRT 
vs. SMbus Alert.

c) Different tools (CAD programs, word processors) have different 
conventions leading to existence of ambiguously-representable name 
components - particular cases in point are overbars for active low 
signals and embedded spaces/underscores/hyphens in names.

d) Compatible part from different vendors leads to confusion about which 
vendor's names are canonical.  Or leading vendor goes out of business or 
gets bought.

These problems are getting worse rapidly as more devices are being 
sourced from Asia, where the linguistic connection to the Roman alphabet 
is tenuous.

You need a Pope to decide what is canonical.
