From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/5] of/irq: merge of_irq_find_parent()
Date: Mon, 21 Jun 2010 15:11:28 -0600
Message-ID: <AANLkTimW92nSwxqo_Pbrm1KR2rmagHigaLTBEJipmZIU@mail.gmail.com>
References: <20100604212134.10552.70717.stgit@angua>
	<20100604212145.10552.95452.stgit@angua>
	<1276151887.1962.53.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1276151887.1962.53.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 10, 2010 at 12:38 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2010-06-04 at 15:21 -0600, Grant Likely wrote:
>> Merge common code between PowerPC and Microblaze. =A0Also create a new
>> arch hook, of_irq_find_parent_by_phandle() to handle arch-specific
>> quirks.
>
> First, you changeset comment should be much more verbose as to
> what that arch specific quirk is about etc... it took me time to figure
> it out again :-)
>
> I dislike the naming you use. Your "of_irq_find_parent_by_phandle"
> doesn't ring "right" to me.
>
> I'm tempted to say we should put the quirks in the common code, your
> attempt at "abstracting" them just makes the code much harder to follow.
>
> Also, if we stick to your approach the "default" variant should either
> be an inline protected by an ifndef or a weak function.

Alright, I've rewritten all the IRQ changes and I've left the quirk
handling in common code, while moving the powermac quirk code into
arch/powerpc/platforms/powermac.  I'll repost today.

g.
