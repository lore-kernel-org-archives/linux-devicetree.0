From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 5/6] Add new fdtput utility to write values to fdt
Date: Thu, 8 Sep 2011 23:00:10 +1000
Message-ID: <20110908130010.GV30278@yookeroo.fritz.box>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-6-git-send-email-sjg@chromium.org>
	<20110908053209.GT30278@yookeroo.fritz.box>
	<CAPnjgZ2UNjxTz9=sWJ8JFq=AXF1NS4dG6C_BkyHvfDf=ZMVpmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2UNjxTz9=sWJ8JFq=AXF1NS4dG6C_BkyHvfDf=ZMVpmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Sep 08, 2011 at 05:51:28AM -0700, Simon Glass wrote:
> Hi David,
> =

> On Wed, Sep 7, 2011 at 10:32 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Sep 07, 2011 at 12:54:19PM -0700, Simon Glass wrote:
> >> This simple utility allows writing of values into a device tree from t=
he
> >> command line. It aimes to be the opposite of fdtget.
> >>
> [snip]
> >> =A0include Makefile.dtc
> >> =A0include Makefile.ftdump
> >> =A0include Makefile.fdtget
> >> +include Makefile.fdtput
> >
> > Separate makefile fragments for the two utilities seems overkill.
> > Can't you just have one Makefile.utils or something.
> =

> Yes of course - I was just following the existing code patterns.
> Should I roll ftdump into there as well?

Yes, might as well.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
