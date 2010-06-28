From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Using devices trees on X86
Date: Mon, 28 Jun 2010 11:08:33 -0700
Message-ID: <AANLkTiljCPHU7NJ-tPOIyekBJ0_csyNkRLMCcel5dSzn@mail.gmail.com>
References: <0bcc23b9-2cbd-4465-b17c-7b3c2dff9fd3@VA3EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <0bcc23b9-2cbd-4465-b17c-7b3c2dff9fd3-+Ck8Kgl/v09CYczPSvLbDrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 28, 2010 at 10:57 AM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Grant,
>
> OK, here's the current set of patches... =A0The end goal of which is to be
> able to parse a device
> tree and generate a set of struct device objects on any architecture,
> but specifically X86.
> I can't see that much of this is anywhere near
> final form, hence the lack of signed-off-by lines. =A0It does compile on
> X86, although it's not
> clear that I actually get any devices discovered behind the PCI bus yet.
> I'll summarize a couple
> of issues, that you can see in somewhat concrete form in the patches:

Thanks Stephen.

> 1) no _ALIGN on x86, which you've already dealt with
> 2) config OF is currently implemented in the architecture code. =A0This
> should be non-architecture dependent and selected by the arches that
> need it.

Agreed.  I've been thinking the same thing.  Just haven't gotten
around to it yet.

> 3) Theres a bunch of support functions that drivers/of requires. =A0Some
> are just stubs and some seem to actually
> do something non-trivial (like the SMP affinity mappings). =A0Probably all
> of this should get stubs with weak symbols so that the arches don't have
> to do anything special, especially since I expect pushback from adding
> this architecture code "Just for device trees".

Yes.  I expect to slowly push these instances down and get rid of them
before I have a final set of core ARM device tree patches ready for
merging.

> Comments greatly appreciated, in particular if you have
> likely-to-be-easy-to-get-accepted suggestions for 3), or feel like
> carefully solving 2) in
> a way which doesn't bork the existing of-based arches.

:-)

Thanks for the patches.  I'm traveling at the moment, but I'll dig
into them when I get back to Calgary.

g.
