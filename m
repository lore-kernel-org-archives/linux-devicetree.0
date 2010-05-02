From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [patch 1/6] gpiolib: introduce chip addition/removal notifier
Date: Sun, 2 May 2010 13:34:52 -0600
Message-ID: <h2qfa686aa41005021234q3a7c5500y792743b0aaef1bad@mail.gmail.com>
References: <201004272111.o3RLBw1f020037@imap1.linux-foundation.org>
	<1272428830.24542.72.camel@pasglop>
	<20100430174240.GA29769@oksana.dev.rtsoft.ru>
	<s2ifa686aa41004301043uca9bfbafz6db2402bfa233de4@mail.gmail.com>
	<20100430174609.GA31455@oksana.dev.rtsoft.ru>
	<n2yfa686aa41004302350i32d385e7gc00b49f39de417cb@mail.gmail.com>
	<20100502165912.GA11300@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100502165912.GA11300-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bgat-uPd5UNENI//N9NzbbXoYwQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, May 2, 2010 at 10:59 AM, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> (Cc'ing devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org)
>
> On Sat, May 01, 2010 at 12:50:15AM -0600, Grant Likely wrote:
>> Not till now. =A0Here's what I've been working on. =A0It's based on my
>> test-devicetree branch.
> [...]
>> As you can see, I've pretty much come full circle on the adding
>> 'automatic' OF support to gpio chips. =A0Originally (as you well know) I
>> was strongly opposed to any addition of OF code to the core gpiolib.
>> All of the notifier work was a response to that.
>>
>> However, now that I actually have played with the code and looked and
>> the issues deeply, I've got an entirely different opinion.
>
> ROFL :-D
>
>> (The fact
>> that OF support is being ported to more architectures is also a
>> factor.)
>
> Yeah, I guess without multi-arch OF effort such an OF+gpiolib
> integration would be very dubious. But as OF spreads to other
> architectures, and we already have of_node in the 'struct
> device'... I guess that makes sense now.
>
>> Anyway, please take a look.
>
> It works here with some small fixes (patches on the way).

Thanks Anton.  I'll look for them and pick them up.

g.
