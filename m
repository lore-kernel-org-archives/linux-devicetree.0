From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Support character literals
Date: Fri, 9 Sep 2011 10:54:31 +1000
Message-ID: <20110909005431.GA30278@yookeroo.fritz.box>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<20110908031842.GL30278@yookeroo.fritz.box>
	<20110908050354.GP30278@yookeroo.fritz.box>
	<CAF6FioVSMD2rT89tBeZEirNWj3DKO2=TXy9cE+z_FvYSn3M_dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioVSMD2rT89tBeZEirNWj3DKO2=TXy9cE+z_FvYSn3M_dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 08:51:54AM -0700, Anton Staaf wrote:
> On Wed, Sep 7, 2011 at 10:03 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Thu, Sep 08, 2011 at 01:18:42PM +1000, David Gibson wrote:
> >> On Wed, Sep 07, 2011 at 04:15:37PM -0700, Anton Staaf wrote:
> >> > =A0 =A0 These patches add simple and escaped character literal parsi=
ng support
> >> > to the dtc for cell lists and bytestrings. =A0The first patch refact=
ors the
> >> > string parsing code in data.c to expose the more primitive character=
 parsing
> >> > code for use in the later patches. =A0I have left the bytestring sup=
port in
> >> > place but my hope is that it is now separate enough to be discussed
> >> > independantly of the refactor and cell list changes.
> >> >
> >> > =A0 =A0 Thanks,
> >> > =A0 =A0 =A0 =A0 Anton
> >> >
> >> > Changes in v2:
> >> > - Move the refactor of data.c to a separate patch
> >> > - Add support for character literals in cell lists
> >> > - Merge normal and escaped literal support for bytestrings into
> >> > - single patch
> >>
> >> Getting very close with version, although there are still some minor
> >> warts I'd like you to address.
> >
> > Oh, and one other thing, I forgot to say yet: you need some testcases
> > for the new functionality.
> =

> Yup, I'll work on these today.  I'm still working on deciphering the
> testing code.  :)  Do you have a pointer to a good example of a dtc
> test to work from?  I tried looking around for a bytestring or literal
> test, but couldn't find anything obvious.

Something like escapes.dts / string_escapes.c is probably fairly
similar to what you're looking for.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
