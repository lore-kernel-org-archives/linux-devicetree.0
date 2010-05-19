From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 08:45:18 -0600
Message-ID: <AANLkTikQOXrOSZjZ1OqFBhO0wkhirkHLR_Q-iuu7SBuP@mail.gmail.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<201005181324.45701.jeremy.kerr@canonical.com>
	<20100518084954.GC25892@yookeroo>
	<alpine.LFD.2.00.1005180802010.12758@xanadu.home>
	<20100519002826.GG25892@yookeroo>
	<alpine.LFD.2.00.1005182109180.12758@xanadu.home>
	<20100519065015.GQ25892@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100519065015.GQ25892@yookeroo>
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
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 19, 2010 at 12:50 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, May 18, 2010 at 09:28:38PM -0400, Nicolas Pitre wrote:
>> On Wed, 19 May 2010, David Gibson wrote:
>>
>> > On Tue, May 18, 2010 at 08:24:06AM -0400, Nicolas Pitre wrote:
>> > > On Tue, 18 May 2010, David Gibson wrote:
>> > > > On Tue, May 18, 2010 at 01:24:43PM +0800, Jeremy Kerr wrote:
>> > > > > Nicolas Pitre wrote:
>> > [snip]
>> > > > The only reason you'd need a subarchitecture number or equivalent =
is
>> > > > if you need to do things differently in the very, very early asm b=
oot
>> > > > code. =A0We may need a minimal form of this on PowerPC if we ever
>> > > > support multiple MMU families in the same kernel binary.
>> > >
>> > > Exact. =A0For example, on ARM the machine ID is also used to figure =
out
>> > > the MMU mapping needed to be able to simply be able to debug the very
>> > > early assembly boot stage when there isn't even a stack available. W=
hile
>> > > this info is stored in the machine record, it is actually
>> > > subarchitecture specific and already half-digested for easy usage by
>> > > that initial MMU setup. =A0I just don't want to imagine what the
>> > > equivalent functionality with DT would look like.
>> >
>> > Well, it wouldn't be *that* bad - you'd need a minimal asm-only tree
>> > walker to find and look up the compatible property. =A0Quite possible
>> > but, yes, fairly awkward.
>> >
>> > Yeah, if you have to make really early MMU decisions based on
>> > subarchitecture it probbaly makes sense to have a simple ID for
>> > those. =A0So one thing to consider here is that we've contemplated
>> > adding an "MMU family" ID to the device tree blob header for this
>> > purpose on PowerPC. =A0If we did such a thing, it could also be used on
>> > ARM for a similar purpose. =A0Then all the relevant machine information
>> > is in one block, and it's just a simple fixed dereference to extract
>> > the MMU type from the early asm.
>> >
>> > I'd have to talk to Ben et al, but I think we'd be happy enough to
>> > create a new dtb v18 which included that field, as well as a couple of
>> > other small improvements to the header and blob internals. =A0ARM could
>> > standardize on that as the minimum acceptable dtb version.
>>
>> I still don't get it. =A0Why on earth would you insist on replacing the
>> already existing ID value that is _already_ passed to the kernel by all
>> ARM bootloaders with something evidently far more complex?
>
> Um.. no. =A0It's not more complex at all. =A0We're talking about this ID
> in the dt blob's header, not in the device tree itself. =A0As I said,
> it's one dereference to get to the ID, from the DT address which is
> being passed in. =A0i.e. *one* more instruction than having it passed in
> register.
>
> There are two advantages, both small, but contrary to your assertion
> it's not significantly more complex, so they don't need to be big.
> =A0 =A0 =A0 =A01) It means the DT blob contains *all* the information you
> need about the machine. =A0If you have multi-stage bootloaders, you can
> copy that blob and know you've got everything.
> =A0 =A0 =A0 =A02) It means we could have information with a similar purpo=
se
> in the same place for both PowerPC and ARM (and maybe others in
> future).

Regardless, I think Nicolas is right.  While there is value in common
methods between architectures, I don't think this case warrants it
when the existing method works fine and changing it is
non-backwards-compatible.

g.
