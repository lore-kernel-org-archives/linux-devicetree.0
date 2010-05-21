From: John Rigby <jcrigby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Fri, 21 May 2010 10:24:27 -0600
Message-ID: <AANLkTil3vDAN4QIJJImk8MnQklisqFJq_RBc7c9VEZxl@mail.gmail.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob@mail.gmail.com>
	<alpine.LFD.2.00.1005191055180.12758@xanadu.home>
	<20100519200819.GF1693@shareable.org>
	<alpine.LFD.2.00.1005191614580.12758@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1005191614580.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wow, no responses for almost two days, does that mean consensus has
been reached?

On Wed, May 19, 2010 at 2:22 PM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> On Wed, 19 May 2010, Jamie Lokier wrote:
>
>> Nicolas Pitre wrote:
>> > It is not up to the bootloader to "adjust" to the kernel. =A0But rather
>> > for the kernel to cope with the bootloader's provided information. =A0=
If
>> > the bootloader passes a specific machine ID with the ATAG list then the
>> > kernel will use that, and if the bootloader passes a DT machine ID with
>> > a DT blob then the kernel will use that. =A0You just have to configure
>> > your kernel with both "machine types" at the same time.
>>
>> Scenario:
>>
>> You upgrade your systems to a new DT-capable kernel and DT-capable
>> bootloader. =A0It works great. =A0You ship new instances of your device =
with this.
>>
>> Once they're in the field, someone reports a bug that doesn't happen
>> with the older device instances. =A0It's not a bug you can reproduce,
>> but you suspect the newer of kernel. =A0So you remote-update some of the
>> newly shipped devices with an old, pre-DT kernel binary that's been
>> stable on the older devices, to see if the bug goes away.
>>
>> Problem: The newer shipped devices have a DT-capable bootloader, and
>> it can't boot old kernels, because they don't understand the DT format.
>>
>> You could remote-downgrade the bootloaders, but that's risky. =A0You
>> could try building the old kernel with DT support, but that adds
>> another variable to your testing.
>>
>> Anticipating this well in advance, you of course built your DT-capable
>> bootloader with the ability to boot old and new style kernels...
>
> Exact. =A0Quoting myself:
>
> |I think that, for the moment, it is best if the bootloader on already
> |existing subarchitectures where DT is introduced still preserve the
> |already existing ability to boot using ATAGs. =A0This allows for the
> |testing and validation of the DT concept against the legacy ATAG method
> |more easily.
> |
> |On new subarchitectures, it might make sense to go with DT from the
> |start instead of creating setup code for every single machine. =A0In that
> |case the bootloader for those machines would only need to care about DT
> |and forget about ATAGs.
>
>
> Nicolas
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
