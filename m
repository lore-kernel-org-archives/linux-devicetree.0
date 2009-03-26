From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] powerpc: NAND: FSL UPM: document new bindings
Date: Thu, 26 Mar 2009 08:42:03 +0100
Message-ID: <49CB31CB.2010704@grandegger.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>	
	<1237975701-23201-2-git-send-email-wg@grandegger.com>	
	<1237975701-23201-3-git-send-email-wg@grandegger.com>	
	<1237975701-23201-4-git-send-email-wg@grandegger.com>	
	<fa686aa40903251048g479d63f8i5a715defdbfc33d4@mail.gmail.com>	
	<49CA9899.30604@grandegger.com>
	<fa686aa40903252209r52a1bc1cn995a7da16bc3527f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40903252209r52a1bc1cn995a7da16bc3527f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Wed, Mar 25, 2009 at 2:48 PM, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org> wrote:
>> Grant Likely wrote:
>>> For the chip offset, it's not clear what the meaning is.  First, does
>>> the UPM controller support access of multiple chips simultaneously?
>> The offset drives the corresponding address lines, which are used to
>> select the chip. That's how it's done on the TQM8548 board. In
>> principle, the chips could also be selected through dedicated GPIO pins.
>> Well, I'm not a hardware guy.
> 
> Heh.  I mean elaborate in the binding documentation.  :-)
> 
>>> If so, then can you elaborate in the description on how board design
>>> translates to a chip-offset value.  If it cannot, then it might be
>>> better to have multiple tuples in the 'reg' property for each discrete
>>> chip.  Multiple reg tuples would also remove the need for the
>>> num-chips property.
>> The node still describes one device mapping all relevant control
>> registers. How about using fsl,upm-chip-offsets = <0x200 0x400>. It
>> would be more generic and makes num-chips obsolete as well. And the
>> property would be reserved for that way of implementing the chip select
>> in hardware.
> 
> It really sounds like this binding is describing multiple NAND chips
> mapped to different base addresses (and looking at the fsm_upm.c
> driver appears to confirm it).  So, does this work?  reg = <3 0x200 4
>  3 0x400 4>;

The chip-offset, and not the address, needs to be added to the MAR
register as well before running the pattern:

        mar = cmd << (32 - fun->upm.width);

        if (fun->chip_offset && fun->chip_number > 0)

                mar |= fun->chip_number * fun->chip_offset;

        fsl_upm_run_pattern(&fun->upm, chip->IO_ADDR_R, mar);


> It is true that other methods could be used for implementing the chip
> select, but that is *not* what the proposed binding describes.  This
> proposed binding describes NAND chips selected by address lines
> (particular addresses), and in this case I think using reg is the
> natural description.

OK, the chips are selected by accessing a defined address range. Will
prepare a patch using the reg property.

Wolfgang.




> g.
> 
