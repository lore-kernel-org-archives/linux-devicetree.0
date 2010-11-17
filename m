From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead
	ofCONFIG_PPC_OF
Date: Tue, 16 Nov 2010 16:07:05 -0800
Message-ID: <64244dc8-4564-42e1-802b-ae1a939ef3b6@SG2EHSMHS003.ehs.local>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com><1289939635-30742-2-git-send-email-robherring2@gmail.com><20101116204058.GA5016@angua.secretlab.ca>
	<20101117105945.64b3b656.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20101117105945.64b3b656.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From:
devicetree-discuss-bounces+stephen.neuendorffer=xilinx.com-uLR06cmDAlaKREJ1Ck/qmQ@public.gmane.org
org [mailto:devicetree-
> discuss-bounces+stephen.neuendorffer=xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On
Behalf Of Stephen Rothwell
> Sent: Tuesday, November 16, 2010 4:00 PM
> To: Rob Herring
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Rob Herring
> Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead
ofCONFIG_PPC_OF
> 
> Hi Mitch,
> 
> On Tue, 16 Nov 2010 13:40:58 -0700 Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >
> > On Tue, Nov 16, 2010 at 02:33:49PM -0600, Rob Herring wrote:
> > > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > >
> > > Some OF drivers could likely be used on non-powerpc OF based
platforms,
> > > so fix the kconfig depends to be CONFIG_OF instead of
CONFIG_PPC_OF
> > >
> > > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >
> > Which of these drivers are you actually using, or going to use in
the
> > near future?
> 
> And have you made sure that you haven't broken the allmodconfig builds
on
> other architectures that enable CONFIG_OF?

In general, is there an easy way to do this?  I can easily see a
difficult to bound testing
problem here, that might benefit from a build farm.

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
