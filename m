From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM:boot:device tree: Merge specific atags into the
	device tree
Date: Tue, 1 Mar 2011 07:56:50 -0700
Message-ID: <AANLkTin1LBP61RNhgGxdXhVN8inw2N=6AqjYFZ1-FXMU@mail.gmail.com>
References: <20110228233153.24836.24176.stgit@riker>
	<20110228233337.24836.54594.stgit@riker>
	<alpine.LFD.2.00.1103010141140.10356@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1103010141140.10356-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 28, 2011 at 11:45 PM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrote:
> On Mon, 28 Feb 2011, John Bonesio wrote:
>
>> This patch is to merge in key atags into the appended device tree. =A0An=
 appended
>> device tree is where the zImage has a dtb binary appended at the end of =
it. The
>> boot code looks for an appended device tree, then looks for a few key at=
ags
>> passed in by the bootloader.
>>
>> The bootargs and memory size settings, if they exist, override existing =
values
>> in the appended device tree. If these values don't currently exist in the
>> appended device tree, they are added.
>>
>> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> Is this really useful?
>
> I understand this might be handy for testing purposes. =A0But if your
> bootloader does ATAG only then your hardware is likely to have support
> in the kernel without device tree support just fine.
>
> IOW I don't think this would be of much value in upstream.

That's fine.  This feature was implemented to meet a client's
requirement and to experiment with manipulating the .dtb in the zimage
wrapper.  We're posting it here for completeness if anyone else wants
to play with it.  Same for the last patch that allows appending
multiple dtbs.

g.
