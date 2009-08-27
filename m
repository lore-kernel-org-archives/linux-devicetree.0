From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC] Clock binding
Date: Thu, 27 Aug 2009 12:28:17 -1000
Message-ID: <4A970881.5090603@firmworks.com>
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
>
>> > Open Firmware often avoids indexed structures.  Cases in point include 
>> > the use of named properties instead of fixed structures and named 
>> > methods instead of function pointer arrays.  Open Firmware's use of 
>> > arrays for reg properties seems like the right choice for that 
>> > particular case, but shouldn't be construed to suggest that arrays are 
>> > good for everything.
>>     
>
> Well, the "reg" property is fine for the common cases of devices with
> one IO (or MMIO) range, no confusion possible, or PCI since it encodes
> the BAR number. For other cases, especially random embedded stuff that
> maps several regions of memory, it's a bit harder since we go back to
> the need of having "somebody" define which region is which.
>
>
>   

Indeed.  You choose based on the common case and eventually there will 
be some case that stretches the boundaries.

I suppose that, if the problem became severe enough, one could invent a 
new "reg-names" property, a list of strings naming the reg entries.
