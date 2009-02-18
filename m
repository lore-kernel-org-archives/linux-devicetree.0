From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Of the device tree binary format endianness on little-endian
	platform
Date: Wed, 18 Feb 2009 09:01:30 -1000
Message-ID: <499C5B0A.8050208@firmworks.com>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
	<499C40F0.5020800@firmworks.com> <499C5749.9000503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <499C5749.9000503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Mitch Bradley wrote:
>
>>
>> I can't speak for flattened device trees specifically, but IEEE1275 
>> (Open Firmware) specifies that integers are encoded in property 
>> values in big-endian byte order.  The model is 
>> serialization/deserialization, rather than overlaying a C struct on 
>> top of the data.
>
>
> The FDT adopted the same big-endian serialize/deserialize approach.
>
> To be honest, I don't know what motivated the big-endian choice
> (Network order, PPC, 1275, One True Format, etc.)  Doesn't matter.


When I first started working on Open Boot (the precursor to Open 
Firmware) at Sun circa 1987, Sun's main processors were 68k and SPARC, 
both big endian.  Sun had a 386 product too but it had no traction.  
Furthermore, the two highest profile external data representations at 
the time - the network byte order of TCP/IP and Sun's XDR underpinnings 
of RPC and NFS - were both big endian.  So big endian seemed like the 
choice least likely to result in opposition from the people I had to 
convince.

PPC didn't enter into the equation until several years later when the 
IEEE standardization effort started and Apple got interested.  There 
were a few portability problems that had crept into Open Boot that had 
to be fixed for Open Firmware, but the property mechanism and encoding 
went across essentially unchanged.  In any case, two of the main PPC OSs 
at the time were MacOS and AIX, both big endian, so if there had been 
pressure from the little endian direction, it probably would have been 
opposed by the MacOS and AIX camps.

Now You Know.

>
> jdl
>
