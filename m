From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Print machine name after dt probe
Date: Thu, 29 Jul 2010 01:02:06 -0600
Message-ID: <AANLkTik3AzttgXLPuWG5e791=yzYD+XKfPiwv-_z-OUK@mail.gmail.com>
References: <20100728044319.24530.72074.stgit@angua>
	<1280371228.11181.9.camel@pororo.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1280371228.11181.9.camel-353AF/3W9ll+urZeOPWqwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 28, 2010 at 8:40 PM, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wr=
ote:
> Hi Grant,
>
>> To match the behaviour of mach_type probing
>>
>> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>>
>> Hi Jeremy,
>>
>> I've got this patch in my tree. =A0I'm going to squash it into "arm/dt:
>> probe for platforms via the device tree".
>
> Looks good. How do you want to manage the trees from here? Are you going
> to adopt my arm-dt branch (and related branches), or should I keep
> maintaining it?

I'm treating my tree as a staging point for linux-next; so I'm happy
to cherry pick and stabilize patches, but unfortunately it also means
I'm going to continue to rebase a lot, which could mess you up a lot.
Let's talk about it on IRC tomorrow night (morning for you)

g.
