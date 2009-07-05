From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree BSP
Date: Sun, 5 Jul 2009 17:08:38 -0600
Message-ID: <fa686aa40907051608n2da78990x674c7e907ab06a85@mail.gmail.com>
References: <4A49F472.3030902@petalogix.com>
	<20090704181837.4DC219B0051@mail75-va3.bigfish.com>
	<1d3f23370907050218l6b2eb9emdbcb7dc321dbab5a@mail.gmail.com>
	<20090705204647.1BBCAB2004B@mail107-dub.bigfish.com>
	<fa686aa40907051453of20e849gab47e901ced28501@mail.gmail.com>
	<1246831858.22625.4.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1246831858.22625.4.camel@pasglop>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 5, 2009 at 4:10 PM, Benjamin
Herrenschmidt<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Sun, 2009-07-05 at 15:53 -0600, Grant Likely wrote:
>> This is not a question that I've got an answer to, but
>> I've been thinking about defining a "machine" node, or something
>> similar that can be a parent of such non-addressable devices. =A0I'm
>> hoping Mitch, Ben, DavidG, Scott, or some other OF active folks will
>> jump in here and give their opinion before I go and define something
>> braindead. =A0I was thinking something like this, where the root node
>> would be the parent of this machine node:
>
> Well, device nodes can perfectly represent non addressable devices...
> One way is to have no "reg" property but that sucks as you get no unit
> address neither which can cause problems when you have multiple of them.
>
> So hosting them under some kind of node that would break that address
> translatability (have no "ranges" property) makes some amount of sense
> though I don't necessarily like the term "machine".

Neither do I, but I've got nothing better.  I'm open to suggestions.  :-)

> But if no "reg" is good for you, then stick them in the soc node with
> distinct names.

It doesn't really belong in the soc node either because it is all
stuff external to the SoC.

> Also, why "virtual," in your compatible property for the SPI node ? It's
> not really virtual...

I don't like 'virtual,' either, but its in the currently documented
binding.  (Documentation/powerpc/dts-bindings/gpio/mdio.txt).

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
