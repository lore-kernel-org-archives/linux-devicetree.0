From: Jimi Xenidis <jimix-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Tue, 8 Feb 2011 04:56:53 -0600
Message-ID: <8D6B80F9-7ABC-4815-B77A-D074A16FA08E@pobox.com>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
	<DEB310FA-724C-4D8B-A8EC-E222A51CD5D4@pobox.com>
	<AANLkTikgBqJM=kWf+FK1nxmi+BSV-nEJo=ToL7gyinkN@mail.gmail.com>
	<1297147521.14982.192.camel@pasglop>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297147521.14982.192.camel@pasglop>
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
Cc: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Feb 8, 2011, at 12:45 AM, Benjamin Herrenschmidt wrote:
> 
> On Mon, 2011-02-07 at 22:05 -0700, Grant Likely wrote:
>> 
>> Hmmm, of all the ideas, I think I like this one the best.  It is a
>> little more verbose than I was thinking, but making each reserved
>> region (or set of reserved regions) have separate node has some very
>> real advantages.  For one, the address decoding *just works* with our
>> existing helpers.  Also it means that device nodes can directly
>> indicate the reserved regions associated with it by way of a phandle.
> 
> But that means that anything that needs to setup a simple memory
> allocator (and thus needs to know what to avoid) will need to walk the
> entire tree for nodes with a "reserved" property, be able to parse
> addresses down to that node (not always obvious accross some bus types),
> etc...
> 
> Or do we propose to keep a "consolidated" reserve map in addition to
> having nodes self-describe which part of this reserve map they are
> responsible for, which thus gives the OS the option to:
> 
> - Reserve it all
> - Then, based on specific knowledge of some nodes, maybe release
> or juts "tag" (for diag purposes) portions of reserved memory

Excellent point.
I always thought we were keeping the reservation list and it starts "anonymous".
Only later to we want to "name" it.
We could define a standard property (for any node) called "reserved" that is the range within the list.
I suppose if it is empty, then it is all of "reg"
-JX


> 
> Ben.
