From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Tue, 08 Feb 2011 17:45:21 +1100
Message-ID: <1297147521.14982.192.camel@pasglop>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
	<AANLkTiniLf6f7FKMdZ1BWZ9jiA=KHEb0wsp84hCnm73Z@mail.gmail.com>
	<DEB310FA-724C-4D8B-A8EC-E222A51CD5D4@pobox.com>
	<AANLkTikgBqJM=kWf+FK1nxmi+BSV-nEJo=ToL7gyinkN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikgBqJM=kWf+FK1nxmi+BSV-nEJo=ToL7gyinkN-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-02-07 at 22:05 -0700, Grant Likely wrote:
> 
> Hmmm, of all the ideas, I think I like this one the best.  It is a
> little more verbose than I was thinking, but making each reserved
> region (or set of reserved regions) have separate node has some very
> real advantages.  For one, the address decoding *just works* with our
> existing helpers.  Also it means that device nodes can directly
> indicate the reserved regions associated with it by way of a phandle.

But that means that anything that needs to setup a simple memory
allocator (and thus needs to know what to avoid) will need to walk the
entire tree for nodes with a "reserved" property, be able to parse
addresses down to that node (not always obvious accross some bus types),
etc...

Or do we propose to keep a "consolidated" reserve map in addition to
having nodes self-describe which part of this reserve map they are
responsible for, which thus gives the OS the option to:

 - Reserve it all
 - Then, based on specific knowledge of some nodes, maybe release
or juts "tag" (for diag purposes) portions of reserved memory

Ben.
