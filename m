From: "Hollis Blanchard" <hollis@penguinppc.org>
Subject: Re: Fabrice Bellard 's QEMU configuration files
Date: Mon, 13 Oct 2008 11:19:32 -0500
Message-ID: <fb412d760810130919g1c22596es5aafa0ba0b32f117@mail.gmail.com>
References: <20081011104423.38beecf8.mle+tools@mega-nerd.com>
	<200810112356.39698.rob@landley.net>
Reply-To: qemu-devel@nongnu.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_21085_16514310.1223914772595"
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <200810112356.39698.rob@landley.net>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: qemu-devel@nongnu.org
Cc: devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

------=_Part_21085_16514310.1223914772595
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Oct 11, 2008 at 11:56 PM, Rob Landley <rob@landley.net> wrote:

> On Friday 10 October 2008 18:44:23 Erik de Castro Lopo wrote:
> > Hi all,
> >
> > Back in June, Fabrice Bellard posted a patch against SVN 4734:
> >
> >
> http://www.archivum.info/qemu-devel@nongnu.org/2008-06/msg00513.html
> >
> > to add configuration files to qemu.
> >
> > It seems that this work was never merged into SVN and that patchset
> > does not apply to current SVN head.
> >
> > Does anyone have an updated version of that patch or something similar?
> >
> > Is there any interest in pushing this kind of functionality into
> > qemu mainline?
>
> I point out that device trees are becoming standard in the Linux kernel,
> and
> being spread from powerpc and sparc to arm, mips, and so on.  I attented a
> BOF about them at OLS, and there's even a mailing list for them now:
>
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
>
> This means the Linux kernel already has data files which describe boards on
> architectures that don't have big defacto standard hardware layouts already
> implemented in C, and lots of 'em are yanking the C implementation in favor
> of using the device tree parser.
>
> Teaching qemu to parse a device tree means you get a ton of free board
> layouts
> from the linux kernel.  (It also simplifies "-kernel" since lots of
> platforms
> need the flattened device tree passed in from the firmware...)
>

FWIW, I've already had to teach qemu how to load and manipulate device trees
for my work with KVM on PPC440. Basically, rather than trying to run uboot
inside qemu, I have qemu replicate the post-uboot environment. That means
qemu is responsible for providing the device tree to the booted kernel.

There really wasn't a whole lot to it, really: just have the qemu board code
load a binary <board.dtb> file from the "pc-bios" (*ahem* ;) directory, and
use some libfdt calls to provide runtime information (e.g. memory layout).

Of course, the more complete solution would be to have qemu actually load
devices based on the contents of the device tree, so that you wouldn't need
to specify commandline options. (Erik, I have no idea why you think that's
orthogonal -- it's exactly what you're asking about.)

-Hollis

------=_Part_21085_16514310.1223914772595
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">On Sat, Oct 11, 2008 at 11:56 PM, Rob Landley <span dir="ltr">&lt;<a href="mailto:rob@landley.net">rob@landley.net</a>&gt;</span> wrote:<br><div class="gmail_quote"><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class="Ih2E3d">On Friday 10 October 2008 18:44:23 Erik de Castro Lopo wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Back in June, Fabrice Bellard posted a patch against SVN 4734:<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp;<a href="http://www.archivum.info/qemu-devel@nongnu.org/2008-06/msg00513.html" target="_blank">http://www.archivum.info/qemu-devel@nongnu.org/2008-06/msg00513.html</a><br>
&gt;<br>
&gt; to add configuration files to qemu.<br>
&gt;<br>
&gt; It seems that this work was never merged into SVN and that patchset<br>
&gt; does not apply to current SVN head.<br>
&gt;<br>
&gt; Does anyone have an updated version of that patch or something similar?<br>
&gt;<br>
&gt; Is there any interest in pushing this kind of functionality into<br>
&gt; qemu mainline?<br>
<br>
</div>I point out that device trees are becoming standard in the Linux kernel, and<br>
being spread from powerpc and sparc to arm, mips, and so on. &nbsp;I attented a<br>
BOF about them at OLS, and there&#39;s even a mailing list for them now:<br>
<br>
<a href="https://ozlabs.org/mailman/listinfo/devicetree-discuss" target="_blank">https://ozlabs.org/mailman/listinfo/devicetree-discuss</a><br>
<br>
This means the Linux kernel already has data files which describe boards on<br>
architectures that don&#39;t have big defacto standard hardware layouts already<br>
implemented in C, and lots of &#39;em are yanking the C implementation in favor<br>
of using the device tree parser.<br>
<br>
Teaching qemu to parse a device tree means you get a ton of free board layouts<br>
from the linux kernel. &nbsp;(It also simplifies &quot;-kernel&quot; since lots of platforms<br>
need the flattened device tree passed in from the firmware...)<br></blockquote></div><br>FWIW, I&#39;ve already had to teach qemu how to load and manipulate device
trees for my work with KVM on PPC440. Basically, rather than trying to
run uboot inside qemu, I have qemu replicate the post-uboot
environment. That means qemu is responsible for providing the device
tree to the booted kernel.<br>
<br>
There really wasn&#39;t a whole lot to it, really: just have the qemu board
code load a binary &lt;board.dtb&gt; file from the &quot;pc-bios&quot; (*ahem* ;)
directory, and use some libfdt calls to provide runtime information
(e.g. memory layout).<br>
<br>
Of course, the more complete solution would be to have qemu actually
load devices based on the contents of the device tree, so that you
wouldn&#39;t need to specify commandline options. (Erik, I have no idea why
you think that&#39;s orthogonal -- it&#39;s exactly what you&#39;re asking about.)<br>
<br>
-Hollis<br></div>

------=_Part_21085_16514310.1223914772595--
