From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: generating a phandle w/libfdt?
Date: Thu, 06 Nov 2008 17:27:44 -0600
Message-ID: <49137D70.8080009@freescale.com>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>	<DEE70934-6A37-4439-B27E-FC3ABF75BF24@kernel.crashing.org>	<9696D7A991D0824DBA8DFAC74A9C5FA3047947A3@az33exm25.fsl.freescale.net>	<20081026234052.GB22339@yookeroo.seuss>	<76BF0CED-6848-43B9-8035-FC9C1F1DD981@kernel.crashing.org>	<20081028000449.GB26424@yookeroo.seuss>	<33A5285E-F5BE-4109-9C29-59F23E6264A0@kernel.crashing.org>	<20081106021040.GJ28465@yookeroo.seuss>
	<9696D7A991D0824DBA8DFAC74A9C5FA304840D5C@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA304840D5C-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Yoder Stuart <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yoder Stuart wrote:
>> -----Original Message-----
>> From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org] 
>> Sent: Wednesday, November 05, 2008 8:11 PM
>> To: Kumar Gala
>> Cc: Yoder Stuart-B08248; devicetree-discuss
>> Subject: Re: generating a phandle w/libfdt?
>>
>> You know, I am inclined to make:
>> 	linux,phandle = < &thisnode >;
>> the approved way of doing this.  I *think* that will already work, but
>> if not we can fix it.  The circular reference is slightly odd, but it
>> is self-consistent.  I suppose we could still come up with a further
>> shorthand so it's not necessary to make a label for a node to do this
>> ('&.' or something for 'reference-to-containing-node').
> 
> As I mentioned earlier in this thread, this _does_ work and is
> what we did in the DTS to get phandles generated for nodes that were
> going to be referenced by nodes dynamically created later.

It works if you call the property something *other* than linux,phandle.

If you explicitly say linux,phandle = <&self> then you get this:
ERROR (explicit_phandles): /chosen has invalid linux,phandle value 
0xffffffff

-Scott
