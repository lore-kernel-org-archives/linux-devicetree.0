From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] smsc911x device tree binding questions
Date: Fri, 3 Sep 2010 08:07:13 -0600
Message-ID: <AANLkTi=46562KE1rWOHzD=SAg3BLbf2j7+YLoOEPckN6@mail.gmail.com>
References: <7948893881024232337@unknownmsgid>
	<AANLkTinC64uvCMzMnso5Bkvut0H3yFekG8SgwGWwX_qY@mail.gmail.com>
	<OFD2329EF8.8EA10F32-ON8025778E.0040004D-8025778E.0041E981@smsc.com>
	<2228456483530699700@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2228456483530699700@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Steve.Glendinning-sdUf+H5yV5I@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ian.Saturley-sdUf+H5yV5I@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 3, 2010 at 6:02 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> -----Original Message-----
>> From: Steve.Glendinning-sdUf+H5yV5I@public.gmane.org [mailto:Steve.Glendinning-sdUf+H5yV5I@public.gmane.org]
>> Sent: 29 August 2010 13:00
>> To: Grant Likely; Lorenzo Pieralisi
>> Cc: Catalin Marinas; David Miller; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
>> glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; Ian.Saturley-sdUf+H5yV5I@public.gmane.org
>> Subject: Re: [RFC] smsc911x device tree binding questions
>>
>> Hi Lorenzo,
>>
>> > > - the SMSC911x host bus size can be retrieved from the chip idrev (f=
or
>> > > chip idrev having just 16-bit bus IF) or for controllers like 9118
>> that
>> > > can have both (32/16), there is a D32/D16 HW strap readable from
>> HW_CFG.
>> > > The problem with these flags is that they define bus size from a CPU
>> > > perspective if I got it right, in particular if the CPU can access
>> > > the SMSC with 32-bit load/store to access 32 bit registers or
>> > > have to resort to two "locked" 16-bit accesses to ensure
>> > > atomicity. I think it is possible on some architectures to use a
>> 32-bit
>> > > load/store even if the smsc911x IF is 16-bit (e.g. bus downsize
>> converters,
>> > > which ensure 16-bit load/store locking).
>> > > It depends on the bus interconnect architecture. I think we
>> > > need a property to define this, thoughts much appreciated.
>>
>> Absolutely right - this flag defines whether the DRIVER has to use 16
>> or 32 bit accesses in order to succesfully access the chip. =A0If the bus
>> hardware is capable of performing atomic pairs of 16-bit operations
>> when we make a 32-bit read then this is very much preferred. =A0The 16-b=
it
>> path is MUCH slower as it has to take a spinlock on every access to
>> ensure the two reads/writes are atomic. =A0It's there as a last resort,
>> and its use is discouraged if avoidable.
>>
>> Autodetecting the bus width from register values is interesting, you'd
>> have to test that you can reliably read the registers in all of the above
>> modes. =A0It's my understanding that if the device is strapped for 16-bit
>> access it expects to see atomic pairs of reads, so I guess you could make
>> a pair of 32-bit reads (of something known like BYTE_TEST) and analyse
>> what you get back to determine how you're connected?
>
> Yes, we could try something like the code in smsc911x_init
> (BYTE_TEST pair of reads) but more generic to "probe" for the interconnec=
tion
> and set the flags accordingly.
>
> A question though(16-bit/32-bit controllers, e.g. 9118):
>
> If the device is strapped to 16-bit host bus mode, a single read 32-bit w=
ould
> reveal us if the bus converts the load 32-bit to two load 16-bit or
> not because the D[31:16] data bus lines are left in a high impedance stat=
e.
> Right ?
>
> Maybe a pair of reads - same address - =A0is safer, the controller invali=
date
> the read (what does it mean in terms of bytes read ?) if it samples the s=
ame
> address (load 32 not split in 16-bit loads) on consecutive reads.
> If the conversion is correct the smsc returns the BYTE_TEST value otherwi=
se
> we would notice the problem.
>
> I can write the code in the DT port context, but I do not have any
> 16-bit strapped smsc lan controller at hand, so I cannot test it, but I c=
an post
> the patch for review and testing on the list.

It probably is not worth the effort.  Anyone bringing up this driver
on a new board will know what the bus access width is, and that will
never change.  Just encode it into a device tree property and be done
with it.

g.
