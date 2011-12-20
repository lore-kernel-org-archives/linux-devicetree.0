From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 4/5] Add fdtget utility to read property values from a
 device tree
Date: Tue, 20 Dec 2011 23:01:48 +1100
Message-ID: <20111220120148.GB5133@truffala.fritz.box>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
 <1316711466-14199-5-git-send-email-sjg@chromium.org>
 <20110923012007.GG12286@yookeroo.fritz.box>
 <CAPnjgZ0Na+zAX2cj=b1HbyGW5iNLGLn2rAeQEfZ9LwBLDW6a1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0Na+zAX2cj=b1HbyGW5iNLGLn2rAeQEfZ9LwBLDW6a1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2011 at 05:37:51PM -0800, Simon Glass wrote:
> Hi,
> =

> On Thu, Sep 22, 2011 at 6:20 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Sep 22, 2011 at 10:11:05AM -0700, Simon Glass wrote:
> >> This simply utility makes it easy for scripts to read values from the =
device
> >> tree. It is written in C and uses the same libfdt as the rest of the d=
tc
> >> package.
> >>
> >> What is it for:
> >> - Reading fdt values from scripts
> >> - Extracting fdt information within build systems
> >> - Looking at particular values without having to dump the entire tree
> >>
> >> To use it, specify the fdt binary file on command line followed by a l=
ist of
> >> node, property pairs. The utility then looks up each node, finds the p=
roperty
> >> and displays the value.
> >>
> >> Each value is printed on a new line.
> >>
> >> fdtget tries to guess the type of each property based on its contents.=
 This
> >> is not always reliable, so you can use the -t option to force fdtget t=
o decode
> >> the value as a string, or byte, etc.
> >>
> >> To read from stdin, use - as the file.
> >>
> >> Usage:
> >> =A0 =A0 =A0 fdtget <options> <dt file> [<node> <property>]...
> >> Options:
> >> =A0 =A0 =A0 -t <type> =A0 =A0 =A0 Type of data
> >> =A0 =A0 =A0 -h =A0 =A0 =A0 =A0 =A0 =A0 =A0Print this help
> >>
> >> <type> =A0 =A0 =A0 =A0s=3Dstring, i=3Dint, u=3Dunsigned, x=3Dhex
> >> =A0 =A0 =A0 Optional modifier prefix:
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 hh or b=3Dbyte, h=3D2 byte, l=3D4 byte (de=
fault)
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> =

> Has this been applied? I cannot see it in the repo.

I haven't chased it, I'm afraid.  You'll need to follow up with Jon directl=
y.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
