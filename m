From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Tue, 27 Sep 2011 10:55:29 +1000
Message-ID: <20110927005529.GA5361@yookeroo.fritz.box>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
	<1316800974-30129-4-git-send-email-robotboy@chromium.org>
	<20110925110454.GP12286@yookeroo.fritz.box>
	<CAF6FioU6HmPw4UTHmiWFJPyXJGR5KtZR_4CW3be++S5vSR0GaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioU6HmPw4UTHmiWFJPyXJGR5KtZR_4CW3be++S5vSR0GaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 26, 2011 at 10:15:48AM -0700, Anton Staaf wrote:
> On Sun, Sep 25, 2011 at 4:04 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Sep 23, 2011 at 11:02:54AM -0700, Anton Staaf wrote:
[snip]
> > Uh, so, this is actually worse than what you had before. =A0Remember
> > print_error() just prints an error, without aborting the parse. =A0So
> > now, if bits !=3D 32 it will print the error, then add a phandle marker
> > *and* a bits-sized -1. =A0So later, when we go through and fix up the
> > REF_PHANDLE markers, we'll assume we're replacing 32-bits of data,
> > which could overrun the end of the data if the element size is less
> > than 32.
> >
> > So, basically the data_add_marker() needs to be in an else clause.
> =

> Yup, you're right.  I should first ask, I couldn't figure out how to write
> a test that tests parse error cases like this.  The closest I found was t=
he
> check tests.  But they are specific to the check messages.  Is there a
> good example of a parse error test?  Or should I create a new type of tes=
t?

Yeah, I don't think we really have any tests like this.  In general
I've been less concerned about testing the error paths than the
working path, though testing error paths as well is not a bad idea.

So feel free to make a new test if you can think up one that makes
sense.  A simple "doesn't crash" test would be a start, that doesn't
care about the program's results, as long as it isn't killed by a
signal.  Actually testing that an error message is generated would
require more work though.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
