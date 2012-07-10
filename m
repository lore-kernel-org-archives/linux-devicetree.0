From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/1] of: introduce helper to manage boolean
Date: Tue, 10 Jul 2012 16:23:18 -0500
Message-ID: <4FFC9D46.6090006@freescale.com>
References: <1328588028-24766-1-git-send-email-plagnioj@jcrosoft.com>
 <20120309014441.8236B3E0903@localhost>
 <20120309100435.GN27213@game.jcrosoft.org>
 <20120309162638.92E813E0880@localhost>
 <20120309163608.GQ27213@game.jcrosoft.org> <4F5E50DA.6080000@freescale.com>
 <20120313031739.GA18320@game.jcrosoft.org>
 <20120313041652.563B63E0536@localhost>
 <CAPnjgZ2dj5pcuGhM2_2nwwnhhcCmKhyi6jVHS7Xf1f682i_j_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2dj5pcuGhM2_2nwwnhhcCmKhyi6jVHS7Xf1f682i_j_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/10/2012 07:10 AM, Simon Glass wrote:
> Hi,
> 
> On Tue, Mar 13, 2012 at 5:16 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> <mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>> wrote:
> 
>     On Tue, 13 Mar 2012 04:17:39 +0100, Jean-Christophe PLAGNIOL-VILLARD
>     <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org <mailto:plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>> wrote:
>     > On 14:39 Mon 12 Mar     , Scott Wood wrote:
>     > > On 03/09/2012 10:36 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>     > > >>>> Ugh.  so any value other than 1 returns false?  I think
>     that will surprise
>     > > >>>> most people.
>     > > >>>>
>     > > >>>> I don't like this api or binding.  If it is a bool
>     property, then why isn't
>     > > >>>> simply testing for the property existance sufficient?
>     > > >>> no if you want to disable it
>     > > >>>
>     > > >>> if a bool is define in the dtsi and want to disable it int
>     the dts
>     > > >>>
>     > > >>> if you we can do the the invert
>     > > >>>
>     > > >>> if !0 => true
>     > > >>>
>     > > >>> is-ok;                  => true
>     > > >>> is-ok = <val != 0>;     => true
>     > > >>> is-ok = <0>;            => false
>     > > >>
>     > > >> This is a failure of the dtc tool, not the binding.
>      Accepting this binding
>     > > >> means we have to live with it for a very long time.  It needs
>     to be fixed
>     > > >> in dtc instead so that properties can be deleted instead of
>     only modified.
>     > > > I understand your idea but today if you put and value in the
>     property it's true.
>     > > >
>     > > > So is-ok = <0>; is true also which is illogical as in any
>     language a boolean is
>     > > > true (1) or false (0). When I read the property I will
>     understand false not true
>     > >
>     > > You could say similar things about is-ok = "no" or is-ok = "" or
>     is-ok =
>     > > "I'd rather you didn't"... it's expected that violating the
>     binding may
>     > > produce illogical results.
>     > today is most of the binding people use a number whe the want to
>     be able to
>     > delete it and it's the same in most of the promgramming language
> 
>     It isn't yet a big pain point, so there isn't time pressure here.
>      Fixing the tool
>     is the better solution, and since the kernel carries a copy of the
>     tool we don't
>     need to worry about adding a feature that isn't available by the dtc
>     packaged by
>     a distribution.
> 
>     Fixing the tool is the correct thing to do.
> 
> 
> I just wanted to pick up on this thread. Now in the kernel, absence of a
> property indicates false, and presence indicates true. This is a kernel
> convention, nothing to do with the dtb format.

It's an aspect of the device binding, and was used by Open Firmware
bindings before Linux came up with flat device trees.

Also note that even non-boolean properties can mean something different
when absent.  Sometimes this is a default value; sometimes, like with
"ranges", it's something that can't be expressed with any value (empty
ranges means all translations go straight through; no ranges means no
translation is possible).

> I think it is useful to
> support a boolean with a non-null value which can be 0, meaning true as
> Jean-Christophe says.
> 
> My reasons are:
> 
> 1. dtc does not have a way to delete a property and it isn't clear what
> syntax could be used there.

Surely some syntax can be created for this.  E.g. /delete-prop/ foo;

> It also seems a little brittle to delete a
> property in one place and define it in another (ordering? confusion when
> people can't work out why it has gone?). So not only can dtc not do
> this, but I'm not sure that it should.

I don't see how it's worse than defining it one place and then
redefining it elsewhere.

> 3. Discoverability: it is nice to be able to see the possible options,
> even if disabled. 

This assumes the possible options were known in advance, or that you
don't maintain compatibility with old device trees when a new option is
added.

> In particular, if a boolean value is true, and you
> later decide with fdtput to turn it off, you effectively remove all
> trace of it. This could be confusing for those who are looking for
> available options.

There should still be a "trace of it" in the binding document.

-Scott
