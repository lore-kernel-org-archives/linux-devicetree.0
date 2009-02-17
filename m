From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Tue, 17 Feb 2009 08:54:55 +0100
Message-ID: <87prhhts4w.fsf@pike.pond.sub.org>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<1234378228.28751.79.camel@slate.austin.ibm.com>
	<87k57w0x4r.fsf@pike.pond.sub.org>
	<20090213003724.GA8104@yookeroo.seuss>
	<87ab8qr317.fsf@pike.pond.sub.org>
	<20090216034214.GB9772@yookeroo.seuss>
	<87iqnawd2r.fsf@pike.pond.sub.org>
	<20090217032909.GA29225@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090217032909.GA29225-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> (David Gibson's message
	of "Tue\, 17 Feb 2009 14\:29\:09 +1100")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:

> On Mon, Feb 16, 2009 at 05:39:40PM +0100, Markus Armbruster wrote:
>> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
>> > On Fri, Feb 13, 2009 at 12:26:28PM +0100, Markus Armbruster wrote:
> [snip]
>> > I think the idea behind using IEEE1275-like trees is that there is
>> > significant overlap between the device information that IEEE1275
>> > represents, and the device information which is configurable in qemu.
>> > Ultimately whether it buys you enough depends on how large that
>> > overlap is.
>> 
>> I think that's fair.
>> 
>> I believe we don't quite know yet whether the overlap will make it
>> worthwhile.
>
> Yeah, true enough.
>
>> One way to approach this is to assume it will until proven wrong.  You
>> start with an IEEE 1275 description of the machine, and extend or adapt
>> it as you go.  My problem with that is that we don't have such
>> descriptions for the machines that interest me.  Developing them is a
>> big step that pays no immediate benefits, but blocks the little steps
>> that do pay.  Moreover, without a *real* user of the description, I'd
>> likely develop something that looks like IEEE 1275 to me, but isn't.  If
>> it turns out that IEEE 1275 is not worth it, tough, we already paid for
>> it.
>> 
>> Another way to approach this is to admit we don't know enough and punt
>> the decision until we do.  Start with the beneficial baby steps.  Limit
>> the machine description business to what is required for the baby steps,
>> making a best effort to stay close to IEEE 1275 structurally.  If it
>> turns out that IEEE 1275 is worth it, we do whatever is left to make the
>> descriptions conform to it.
>> 
>> I'm much more comfortable with the second approach.
>
> That's reasonable.  However, once you've taken enough baby steps you
> do want to be careful that you don't end up long term with something
> that's similar enough to 1275 to be confusing, but not similar enough
> to be useful.  So at some point we do want to take a look ahead and
> see how much difference there will be between the qemu-required config
> information and the 1275 dectree.

Agreed.

I think it would help if 1275 experts reviewed the baby steps for
gratuitous deviations from 1275.

[Rest snipped, helpful comments, but I don't have anything interesting
to add...]
