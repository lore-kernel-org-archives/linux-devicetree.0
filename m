From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Fri, 15 Oct 2010 17:51:20 -0600
Message-ID: <AANLkTik73W-btJsx4rLtuEgKYiOBvuA9iX6jim=0uF2j@mail.gmail.com>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
	<b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
	<AANLkTinPWv94Xoz+mDxiE=KujQYAyQj9PsPWHEORypJ3@mail.gmail.com>
	<eba820f8-3e4f-4d57-9024-39cc562a99eb@VA3EHSMHS012.ehs.local>
	<AANLkTikWfMXEbdwFY6FNoMwuD6fC74Kohtr3QRJqSrM0@mail.gmail.com>
	<ed27a45d-3607-41e3-831f-1d7e3dd44379@SG2EHSMHS003.ehs.local>
	<AANLkTikzyDFiQZzPmeos6pf_DS33RvkfER+Mz0jceSJy@mail.gmail.com>
	<1287174956.4535.1414.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1287174956.4535.1414.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 2:35 PM, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org> wrote:
[snip]
> If we had:
> /remove-node/ foo;
>
> Then we could make the parser give an error on:
> /remove-node/ foo {};
>
> We could even possibly make
> /trim-node/ foo;
> an error.
>
> This way there is less room for confusion or trip-ups.
>
> What are your thoughts?

I'm still partial to using a single keyword for both use-cases, but
most of the implementation will be the same regardless of which is
chosen.  Go ahead and code it and post a patch.

g.
