From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 11:10:01 -0600
Message-ID: <AANLkTinzTKkSIwGemGJ-gI0DSD-ANOSePkdwFZhMwFnM@mail.gmail.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<201005181324.45701.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005180742500.12758@xanadu.home>
	<AANLkTinsOSI_TIc7Jyy4QFuFaS2d-fi0y3LMuITLyG3N@mail.gmail.com>
	<20100519164534.GE1693@shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100519164534.GE1693-yetKDKU6eevNLxjTenLetw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jamie,

On Wed, May 19, 2010 at 10:45 AM, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org> wrote:
> Grant Likely wrote:
>> Doing it this way means a non-compatible break in the interface. =A0It
>> means that the bootloader needs to know what interface the kernel is
>> expecting for boot; information that is not readily available from the
>> image type. =A0The user then needs to tell the boot loader which
>> interface to use rather than a backwards compatible addition of a blob
>> of data.
>
> Also the other way around: Sometimes you want to install the same
> kernel on systems with old and new bootloaders, without touching the
> bootloaders (due to that not being powerfail-safe, say). =A0The kernel
> needs to know if it's passed a DT from a newer bootloader or not.
>
> And sometimes you'd like to install a newer, tested kernel (that uses
> DTs) on systems with old bootloaders.

Which will be an issue regardless of which approach is chosen.  Either
way, this case does require the use of a boot shim or wrapper.

>> You mention below "shifting the World Order on ARM" and it creating
>> resistance for merging DT support. =A0Isn't this much the same thing as
>> it creates a non backwards compatible change in the way bootloaders
>> pass data to the kernel. =A0The cutover in powerpc from the old
>> interface to the new caused no end of confusion and people who could
>> no longer get their systems to boot. =A0On PowerPC is was necessary
>> because the old method was completely broken, but ATAGs are clean,
>> simple and well implemented.
>
> You can't always update the boot loader. =A0Sometimes you're stuck with
> what's there for the life of a device. =A0Either it's ROM, or it's too
> risky to modify in place.

Yes.  Though this is a bit of a side issue when talking about the boot
interface.  We're still going to have cases where the bootloader
passes bad data and we may need a shim or wrapper (not part of
firmware) to adapt or fix it up.  Just like with booting new kernels
on old (no-dt-support) firmware.

There is a larger issue w.r.t. what the overall boot architecture is,
and what recommendations distributions (like Ubuntu) should make to
device manufactures to ensure firmware is reliable and can boot a
distribution OS image.  That's a topic for a different email.

>> It also means teaching every boot loader two separate methods for
>> booting and exposing those differences to the user.
>
> Embedded devices usually don't have any way for the "user" to choose
> from a boot menu ;-)
>
> ATAG_DEVTREE sounds good to me for mix'n'match systems.
>
> New systems that always use DTs could use _just_ ATAG_DEVTREE, to
> avoid questions of conflicting info.

Yes, this is trivial to do.

> =A0They could also settle on a
> fixed R1 value meaning "devtree platform".
>
> Or if a fixed "devtree platform" R1 is used, R2 could point directly
> at the DT, no atag list in that specific case.

My sticking point is I want there to be exactly one method of passing
the device tree blob.  I don't see any advantage in having more than
one mechanism for passing the dtb pointer.  Whether it be ATAG or bare
DT pointer, we should be able to choose a single method now that is
suitable for the foreseeable future.

Thanks,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
