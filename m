From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [GIT PULL] arch/microblaze fixes for 2.6.34-rc2
Date: Fri, 26 Mar 2010 19:37:06 -0600
Message-ID: <fa686aa41003261837p3564d4e8k422cc95911f4c6a2@mail.gmail.com>
References: <4B98F32D.8020906@monstr.eu>
	<fa686aa41003201035r3d95b780naf37a4725293d648@mail.gmail.com>
	<1d3f23371003211532p57fe0785s5960ddea8218d4d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1d3f23371003211532p57fe0785s5960ddea8218d4d4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 21, 2010 at 4:32 PM, John Williams
<john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org> wrote:
> Grant,
>
> On Sun, Mar 21, 2010 at 3:35 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> On Thu, Mar 11, 2010 at 6:42 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>>> Hi Linus,
>>>
>>> Please pull Microblaze changes to your tree. There is support for PCI a=
nd
>>> new DMA interface.
>>>
>>> Thanks,
>>> Michal
>>
>> Hi Michal.
>>
>> I'm really unimpressed that you've merged the cloned PCI support code
>> when we talked about merging the common powerpc & microblaze bits
>> /before/ pushing it up to mainline. =A0At the very least I would have
>> expected a reply back from you telling me that you disagree and that
>> you wanted to merge anyway. =A0I didn't even get a reply back form you
>> when I asked about why the PCI bits were in your linux-next branch.
>>
>> Now it needs to be merged in-place which is a lot more work.
>
> You should blame me for this one. =A0There was nothing deliberate about
> it - I've been hassling Michal to get the DMA API upstream because
> there's other work that depends on it, and with everything else going
> on I plain forgot that his patchset included the PCI stuff that we
> were still discussing with you.

Blame dutifully assigned.

The next question is how to proceed.  I've not gotten to PCI code in
my rework yet, but I probably will in the next month or so.  If you or
Michal doesn't get to it first, then I'll probably move the OF
portions of the powerpc version into drivers/of and make them
conditional on !CONFIG_MICROBLAZE.  Microblaze adaptations can be
merged in at a later date and the !CONFIG_MICROBLAZE conditional
eventually dropped.

> Let me buy you a beer at ELC and you can berate me for it then!

done.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
