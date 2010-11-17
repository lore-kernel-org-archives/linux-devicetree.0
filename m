From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead
	ofCONFIG_PPC_OF
Date: Tue, 16 Nov 2010 17:19:20 -0700
Message-ID: <AANLkTimw-1E+JQVr2X7mRHnrBPKNh8wxpONvgaccP4XY@mail.gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-2-git-send-email-robherring2@gmail.com>
	<20101116204058.GA5016@angua.secretlab.ca>
	<20101117105945.64b3b656.sfr@canb.auug.org.au>
	<64244dc8-4564-42e1-802b-ae1a939ef3b6@SG2EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <64244dc8-4564-42e1-802b-ae1a939ef3b6-RaUQJvECHis6W+Ha+8ZLibjjLBE8jN/0@public.gmane.org>
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
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 16, 2010 at 5:07 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From:
> devicetree-discuss-bounces+stephen.neuendorffer=3Dxilinx.com-uLR06cmDAlaKREJ1Ck/qmQ@public.gmane.org
> org [mailto:devicetree-
>> discuss-bounces+stephen.neuendorffer=3Dxilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On
> Behalf Of Stephen Rothwell
>> Sent: Tuesday, November 16, 2010 4:00 PM
>> To: Rob Herring
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Rob Herring
>> Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead
> ofCONFIG_PPC_OF
>>
>> Hi Mitch,
>>
>> On Tue, 16 Nov 2010 13:40:58 -0700 Grant Likely
> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> >
>> > On Tue, Nov 16, 2010 at 02:33:49PM -0600, Rob Herring wrote:
>> > > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> > >
>> > > Some OF drivers could likely be used on non-powerpc OF based
> platforms,
>> > > so fix the kconfig depends to be CONFIG_OF instead of
> CONFIG_PPC_OF
>> > >
>> > > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> >
>> > Which of these drivers are you actually using, or going to use in
> the
>> > near future?
>>
>> And have you made sure that you haven't broken the allmodconfig builds
> on
>> other architectures that enable CONFIG_OF?
>
> In general, is there an easy way to do this? =A0I can easily see a
> difficult to bound testing
> problem here, that might benefit from a build farm.

I can put it in my experimental branch that gets picked up by the
build server that ozlabs maintains.  However, having some level of
sanity checking beforehand is important before I do so.  Including a
log of what testing has been performed in the patch description is
always the right thing to do.

g.
