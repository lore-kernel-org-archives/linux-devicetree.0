From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Allow simple cross-compilation of library
Date: Sun, 06 Jan 2013 16:09:57 -0600
Message-ID: <E1TryPl-0000Xa-5R@jdl.com>
References: <E1SjsCv-0006dk-SV@jdl.com>
 <20120628030714.GA10546@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120628030714.GA10546-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Wed, Jun 27, 2012 at 08:22:57AM -0500, Jon Loeliger wrote:
> > 
> > [ Forwarded to devicetree dev list for comment. --jdl ]
> 
> Yeah, I guess that makes sense.
> 
> > 
> > 
> > ------- Forwarded Message
> > 
> > Subject: [PATCH] Allow simple cross-compilation of library
> > To: jdl-CYoMK+44s/E@public.gmane.org
> > From: Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
> > Date: Tue, 05 Jun 2012 13:09:59 -0400
> > Message-ID: <20120605170959.12774.39782.stgit@ubuntu>
> > 
> > 
> > This is extremely useful when cross-compiling the library to be
> > linked with cross-compiled QEMU.
> > 
> > Signed-off-by: Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
> > - ---
> >  Makefile |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 1169e6c..efa79c1 100644
> > - --- a/Makefile
> > +++ b/Makefile
> > @@ -15,6 +15,10 @@ EXTRAVERSION =
> >  LOCAL_VERSION =
> >  CONFIG_LOCALVERSION =
> >  
> > +CC=${CROSS_COMPILE}gcc
> > +LD=${CROSS_COMPILE}ld
> > +AS=${CROSS_COMPILE}as
> > +
> >  CPPFLAGS = -I libfdt -I .
> >  WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> >  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls


Any further comment, or should I just apply this?

Thanks,
jdl
