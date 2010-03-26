From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Fri, 26 Mar 2010 12:13:39 -0600
Message-ID: <fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BACF238.3040405-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, David Rusling <David.Rusling-5wv7dgnIgG8@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dave P Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 26, 2010 at 11:43 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> Catalin Marinas wrote:
>> On Thu, 2010-03-25 at 21:04 +0000, Russell King - ARM Linux wrote:
>>> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
>>>> *IRQs disabled
>>>> *MMU off
>>>> *Instruction cache either on or off
>>>> *Data cache turned off
>>>
>>> Would recommend saying "Data cache(s) turned off" so that L2 cache is
>>> included.
>>
>> There are platforms where the L2 cache is turned on by the boot monitor
>> (secure monitor) and Linux has no control over it (I think OMAP).
>
> What is the reason for turning off the data caches? =A0Leaving all caches
> turned on and coherent with one another has always worked well for me at =
the
> interface from firmware to a booted program.

Data cache off is specified in Documentation/arm/Booting in the Linux
source tree and I used that document as a starting point to get
discussion going.  I don't have a technical argument either way.

Russell, what is the reason for having the data cache off?

g.
