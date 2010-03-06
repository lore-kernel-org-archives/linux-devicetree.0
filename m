From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 02/11] arm: use generic infrastructure for early params
Date: Sat, 6 Mar 2010 09:01:20 -0700
Message-ID: <fa686aa41003060801x172a8199r8c71adb0ecbcde4a@mail.gmail.com>
References: <1261479296.245235.191110925832.0.gpush@pororo>
	<20100106162731.GB1728@n2100.arm.linux.org.uk>
	<201001070931.00811.jeremy.kerr@canonical.com>
	<201003060733.57636.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201003060733.57636.rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 6, 2010 at 6:33 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
> On Wednesday 06 January 2010 16:31:00 Jeremy Kerr wrote:
>> Russell,
>>
>> > This is something which should be separate from the rest of the DT
>> > patch - could we have this as a patch which can be applied to the
>> > current kernel tree please?
>>
>> Sure, patch coming.
>>
>> The first three patches of this series (prefixed with arm:, rather than
>> arm- dt:) are all generic arm patches that don't specifically add device
>> tree support, would you like the other two as well?
>>
>> I'm in the process of rebasing my work onto a merge or your and Grant
>> Likely's test-devicetree branch, so future patches should be easier to work
>> with.
>>
>> Cheers,
>
> What's the current status on the device tree for arm stuff?
>
> I'm going through some of my todo bookmarks and stumbled across
> http://lwn.net/Articles/367752/ and I'd like to poke at it under qemu.
>
> I've been patching the kernel kconfig stuff to let me plug various different arm
> processors into a versatile board (because it's convinced that you can't
> possibly have an armv6l versatilepb and qemu's -cpu option makes that easy).
> Feeding in a device tree (or better yet teaching qemu to generate one) sounds
> like a better long-term approach...

https://wiki.ubuntu.com/KernelTeam/ARMDeviceTrees

g.
