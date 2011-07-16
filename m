From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sat, 16 Jul 2011 14:16:40 -0500
Message-ID: <4E21E398.4060808@gmail.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>	<201107152011.41546.arnd@arndb.de>	<20110716075748.GI1840@S2100-06.ap.freescale.net>	<201107161409.46719.arnd@arndb.de>
	<4E218A4C.8000603@freescale.com>
	<20110716144026.GB2374@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110716144026.GB2374-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/16/2011 09:40 AM, Shawn Guo wrote:
> On Sat, Jul 16, 2011 at 08:55:41PM +0800, Tabi Timur-B04825 wrote:
>> Arnd Bergmann wrote:
>>> Right, this is what I had in mind. I think this is reasonable.
>>> If you need so many channels, the device tree will be huge already,
>>> so this doesn't add that much bloat either.
>>
>> I'm not sure I agree.  It seems that specifying nodes for each DMA channel 
>> (virtual or physical) is meaningless because the only property in the node 
>> is the "reg", which is really just a cell-index in disguise.
>>
> Yes, that's exactly why I do not appreciate the solution.
> 
>> My vote is to have a node only for the DMA engine, and let the DMA handle 
>> the virtual and physical channels internally.
>>
> It's not about virtual or physical channel.  I'm asking suggestion on
> how we bind the channel number for each dma client device in device
> tree and how they will get the number from device tree when they get
> probed.
> 

In this case, it is the event (or request line) that is important not
the channel assignment. This is how the hardware is wired up and the
main variation between chips with SDMA. Since DT describes the h/w, this
needs to be described.

For some DMA controllers, the channel and request are the same thing.
Sometimes they are not but the channel assignment is still important. On
i.MX21, the channel number defines the priority for example.

Regards,
Rob
