From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Fri, 26 Mar 2010 13:52:24 -0600
Message-ID: <fa686aa41003261252u7dc31bb6nca2e77ae8feb4355@mail.gmail.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
	<fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
	<alpine.LFD.2.00.1003261435460.694@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1003261435460.694-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, David Rusling <David.Rusling-5wv7dgnIgG8@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 1:30 PM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> On Fri, 26 Mar 2010, Grant Likely wrote:
>
>> On Fri, Mar 26, 2010 at 11:43 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrot=
e:
>> > Catalin Marinas wrote:
>> >> On Thu, 2010-03-25 at 21:04 +0000, Russell King - ARM Linux wrote:
>> >>> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
>> >>>> *IRQs disabled
>> >>>> *MMU off
>> >>>> *Instruction cache either on or off
>> >>>> *Data cache turned off
>> >>>
>> >>> Would recommend saying "Data cache(s) turned off" so that L2 cache is
>> >>> included.
>> >>
>> >> There are platforms where the L2 cache is turned on by the boot monit=
or
>> >> (secure monitor) and Linux has no control over it (I think OMAP).
>> >
>> > What is the reason for turning off the data caches? =A0Leaving all cac=
hes
>> > turned on and coherent with one another has always worked well for me =
at the
>> > interface from firmware to a booted program.
>>
>> Data cache off is specified in Documentation/arm/Booting in the Linux
>> source tree and I used that document as a starting point to get
>> discussion going. =A0I don't have a technical argument either way.
>>
>> Russell, what is the reason for having the data cache off?
>
> At least on machines with a VIVT cache, you need to have the MMU enabled
> for the data cache to be enabled. =A0That means a page table set up
> somewhere in memory, and then the kernel would need to know where that
> page table is not to overwrite it until the kernel has set its own page
> table, etc. =A0This makes the booting requirements more complex for very
> little gain.
>
> So by mandating that the MMU be off (implying that the dcache has to be
> disabled too) then the kernel can set it up without restrictions.

I could change the statement to something like, "virtually tagged or
indexed data cache(s) must be off", or drop the statement entirely
since it is implied by the requirement that the MMU must be off.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
