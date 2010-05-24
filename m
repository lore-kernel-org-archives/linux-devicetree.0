From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: CELF Project Proposal/Add Device Tree emulation support to QEMU
Date: Sun, 23 May 2010 21:04:58 -1000
Message-ID: <4BFA251A.4080601@firmworks.com>
References: <4BF9BB22.2000603@crca.org.au>
	<AANLkTilCe5FyT6Pcz61FnhpbpdLhg2EGSfk4jZlKdQKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTilCe5FyT6Pcz61FnhpbpdLhg2EGSfk4jZlKdQKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Edgar E. Iglesias" <edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nigel Cunningham <ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> (cc'ing devicetree-discuss and others)
>
> On Sun, May 23, 2010 at 5:32 PM, Nigel Cunningham
> <ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org> wrote:
>   
>> http://elinux.org/CELF_Project_Proposal/Add_Device_Tree_emulation_support_to_QEMU
>>     

Just in case anyone is interested -

One Laptop Per Child is doing some ARM work, so I have resurrected 
FirmWorks' ARM version of Open Firmware.  It's in the open source OFW 
tree at http://openfirmware.info/Open_Firmware .  There is a build that 
runs under QEMU, in the subdirectory cpu/arm/versatilepb .  FirmWorks' 
core ARM stuff is fairly solid, having been developed to shipping 
quality for Digital's "Shark" (aka DNARD) system, just prior to 
Digital's demise and the sale of StrongARM to Intel.

I'll be adding more elaborations in the near future.  One item on the 
short list is to auto-generate a flattened device tree from the real 
device tree.  It's a pity that the dynamic device tree has to be 
projected onto a static structure, but I guess that Gresham's Law 
applies to software too.


>> Grant, I've joined the devicetree-discuss mailing list, and am seeking to
>> get up to speed with things, but want to find out before I get too carried
>> away what your thoughts are on Rob's proposal. In your opinion, is there a
>> useful contribution I can make in this area, or do you already have it all
>> in hand and not need any help? (I'm not sure how old Rob's proposal is).
>>     
>
> Hi Nigel,
>
> A bunch of work has already been done in this area, but not all of it
> has been pushed upstream.  Edgar Ingesias and John Williams
> collaborated to bring up QEMU microblaze support, including a device
> tree parser.  I believe John & Petalogix is continuing to pursue this
> work, but I don't know what the state of it is.  Much of the
> Microblaze support is in mainline, but I don't think the device tree
> parser has been pushed up yet.  John and Edgar can tell you about this
> much better than I.
>
> Independently, Jeremy Kerr added QEMU support for passing a device
> tree to the kernel on the ARM architecture via an ATAG, and I added
> code for generating the device tree contents from the set of
> instantiated devices.  This approach is rather different from what
> John and Edgar have done as it still requires a separate method of
> configuring QEMU.  While I find it useful, this approach probably
> isn't the best long term solution.
>
> I'm not actively working on this other than adding the bits and pieces
> I need to improve the ARM device tree support in the kernel.  You'll
> have to coordinate with John and Edgar to figure out if there is a
> useful contribution that you can make.
>
> Cheers,
> g.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>   
