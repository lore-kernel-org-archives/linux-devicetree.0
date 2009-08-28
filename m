From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Clock binding
Date: Fri, 28 Aug 2009 14:09:47 -0600
Message-ID: <fa686aa40908281309g6eedcdb4neb6a96104807a3f1@mail.gmail.com>
References: <1250569288.19007.15.camel@pasglop>
	<4A96F69A.5050003@firmworks.com>
	<1251411532.20467.74.camel@pasglop> <4A970C85.8090703@firmworks.com>
	<1251420686.20467.96.camel@pasglop> <4A974295.9020504@firmworks.com>
	<1251427388.20467.122.camel@pasglop>
	<955e48b80908280516m457530cfn3b07b52f2fa2c471@mail.gmail.com>
	<fa686aa40908280906w7953017ek44ee498d57e0a642@mail.gmail.com>
	<955e48b80908281105q60c057e8pfc16213f17da9138@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <955e48b80908281105q60c057e8pfc16213f17da9138-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stuart Yoder <stuyoder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2009 at 12:05 PM, Stuart Yoder<stuyoder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Lets *not* do it on power.org. =A0I'd like to see the bindings used by
>> more than just powerpc people, and power.org might become a bit of a
>> mental barrier for non-powerpc folks. =A0kernel.org would be a good
>> host. =A0So would ozlabs or infradead. =A0Or I'd be happy to maintain one
>> on secretlab.
>
> I think broadening it beyond power.org is good. =A0Along those lines I'd =
prefer
> not having this on kernel.org, as device trees are not Linux-centric. =A0=
There
> are other OS vendors I've interacted with that I'd like to see use device=
 trees
> and separating it from Linux may be better IMO.
>
> We could also create a new domain like "devicetree.org" (?)..but it still
> would nee a host.

How about right here:  http://fdt.secretlab.ca/

I've only just created the site.  I'll fill in some documentation and
structure in the next few days.  Feel free to create an account and
start adding stuff.

We'll need to talk about how best to manage bindings and have some
form of review/agreement before a binding is marked as "stable".  And
the site URL could change as well.  But in the meantime we've got a
sandbox to start playing in.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
