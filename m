From: Mitch Bradley <wmb@firmworks.com>
Subject: Re: ARM clock API to PowerPC
Date: Wed, 12 Aug 2009 07:31:15 -1000
Message-ID: <4A82FC63.7020705@firmworks.com>
References: <1250063825.15143.43.camel@pasglop>
	<1250065762.15143.47.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1250065762.15143.47.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: John Jacques <john.jacques@lsi.com>, linuxppc-dev list <linuxppc-dev@ozlabs.org>, devicetree-discuss@lists.ozlabs.org, Torez Smith <torez@us.ibm.com>, Russell King <rmk@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

>
> On Wed, 2009-08-12 at 17:57 +1000, Benjamin Herrenschmidt wrote:
>
>   
>> >  - Device-tree: The idea on top of my mind would be to define a
>> > clock-map property that has the following format:
>> > 
>> > A list of:
>> > 	- zero terminated string clock ID, padded with zeros
>> >           to a cell boundary
>>     


Padding a string violates a core principle of property representation, 
namely the "no alignment assumptions" one.  The reason for that 
principle was the fact that alignment needs are not stable across 
processor families, or even within a processor family .

>> >  	- a phandle to the clock provider
>> > 	- a numerical (string ?) ID for that clock within that provider
>> > 
>> > The core would thus be able to do a search in that list based on the
>> > clock-id passed in, or if clk_get(dev, NULL), then, use the first one.
>>     
>
> Thinking a bit more about that one, mixing strings and numbers in a
> property sucks. What about instead:
>
>  clock-map is a list of phandle, id
>
>  clock-names is an optional list of 0 terminated strings
>   

This approach finesses the problem nicely.

> If there's only one clock, and the ID can be ommited, then the
> clock-names property can be ommited completely too. Else, the
> entries in clock-names match the entries in clock-map.
>
> It's a bit strange to separate the list into two properties but
> I think it will generally suck less than having them mixed, especially
> with ASCII representations such as lsprop output.
>
> Cheers,
> Ben
>   
