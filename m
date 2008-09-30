From: Steve Papacharalambous <stevep-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Fix an overflow case in fdt_offset_ptr() detected by
	GCC 4.3.
Date: Tue, 30 Sep 2008 09:03:50 +0100
Message-ID: <1222761830.4353.38.camel@localhost.localdomain>
References: <1222358537.25112.7.camel@ld0161-tx32>
	<E1KkQ3b-0000uT-6H@jdl.com> <20080930011525.GB6189@yookeroo.seuss>
	<E1KkUOE-0001OX-EF@jdl.com>  <20080930023934.GB8939@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080930023934.GB8939-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Edmar Wienskoski <edmar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2008-09-30 at 12:39 +1000, David Gibson wrote:
> On Mon, Sep 29, 2008 at 08:51:02PM -0500, Jon Loeliger wrote:
> > > On Mon, Sep 29, 2008 at 04:13:27PM -0500, Jon Loeliger wrote:
> > > > > 
> > > 
> > > Uh.. Jon.. did you see my reply to this.  I'm not at all convinced
> > > this patches a real problem.  I suspect it's just replacing a problem
> > > that gcc could detect with a similar one that gcc can't (and for which
> > > we already had a test to deal with, anyway).
> > 
> > I saw your reply, and you are welcome to read up
> > on the fist fight over in GCC land too.
> > 
> > In the meantime, it fixes a real problem that we
> > have at Freescale.
> 
> Ok.. and can you explain this real problem?
> 
> If this is just to work around a silly gcc warning that appears in
> some circumstances and not others, that's fine, but the commit message
> should say so.
> 

Hi David,

The error that is generated when using gcc-4.3.2 20080819 is:

[snip]
/opt/freescale/usr/local/gcc-4.3.8-eglibc-2.8.8/powerpc-linux-gnu/bin/powerpc-linux-gnu-gcc -include config/autoconf.h -m32 -Wa,-me500 -nostdinc -I /opt/freescale/usr/local/gcc-4.3.8-eglibc-2.8.8/powerpc-linux-gnu/lib/gcc/powerpc-linux-gnu/4.3.2/include -I /opt/freescale/usr/local/gcc-4.3.8-eglibc-2.8.8/powerpc-linux-gnu/lib/gcc/powerpc-linux-gnu/4.3.2/include-fixed -Iinclude -Ibin/include -I../dtc/libfdt -I../libos/include -g -std=gnu99  -include include/libos-client.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-altivec -funit-at-a-time -mno-string -fomit-frame-pointer -Werror -include include/libfdt_env.h -c -o bin/libfdt/fdt.o ../dtc/libfdt/fdt.c
cc1: warnings being treated as errors
../dtc/libfdt/fdt.c: In function 'fdt_next_tag':
../dtc/libfdt/fdt.c:82: error: assuming signed overflow does not occur
when assuming that (X + c) < X is always false
../dtc/libfdt/fdt.c:82: error: assuming signed overflow does not occur
when assuming that (X + c) < X is always false
../dtc/libfdt/fdt.c:82: error: assuming signed overflow does not occur
when assuming that (X + c) < X is always false
[/snip]

which does not occur with earlier versions of gcc.  For example the same
command builds without errors with gcc-4.2.3.

A good starting point for the discussion on this subject is:
http://gcc.gnu.org/ml/gcc/2008-04/msg00618.html

I suspect that you're right and this error doesn't occur in all
circumstances, so perhaps the commit message should be changed,

Best regards,

Steve
