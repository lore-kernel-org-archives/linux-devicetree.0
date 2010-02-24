From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Allow device tree to be modified by additonal device tree
	sections
Date: Tue, 23 Feb 2010 21:57:37 -0700
Message-ID: <fa686aa41002232057j45707ad0ofce684acc5680b6b@mail.gmail.com>
References: <20100223192659.11939.42521.stgit@angua>
	<20100224013658.GG7187@yookeroo>
	<fa686aa41002231805q1f5c6179j6fb7f6cd0558972e@mail.gmail.com>
	<20100224044220.GI7187@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100224044220.GI7187@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2010 at 9:42 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 23, 2010 at 07:05:53PM -0700, Grant Likely wrote:
>> On Tue, Feb 23, 2010 at 6:36 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Tue, Feb 23, 2010 at 12:28:13PM -0700, Grant Likely wrote:
> [snip]
>> My opinion: no way. =A0We're not working with real OF, and none of the
>> use cases I see have any need of such a feature. =A0While we could
>> forbid it now and permit it later, we cannot permit it now and forbid
>> it later. =A0I say no until someone comes up with a reasonable use case
>> on why it should be implemented.
>
> A sound argument. =A0Done.

Okay, thanks for the feedback.  I've rebased the patch onto your
multi-label patch and added support for merging labels.  I'll properly
test it and repost tomorrow.

Cheers,
g.
