From: Steve.Glendinning-sdUf+H5yV5I@public.gmane.org
Subject: RE: [RFC] smsc911x device tree binding questions
Date: Fri, 3 Sep 2010 15:06:43 +0100
Message-ID: <OF34464B3E.5795F010-ON80257793.004C9683-80257793.004D8554@smsc.com>
References: <7948893881024232337@unknownmsgid>
	<AANLkTinC64uvCMzMnso5Bkvut0H3yFekG8SgwGWwX_qY@mail.gmail.com>
	<OFD2329EF8.8EA10F32-ON8025778E.0040004D-8025778E.0041E981@smsc.com>
	<000201cb4b5f$db36a940$91a3fbc0$@Pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <000201cb4b5f$db36a940$91a3fbc0$@Pieralisi-5wv7dgnIgG8@public.gmane.org>
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
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ian.Saturley-sdUf+H5yV5I@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> A question though(16-bit/32-bit controllers, e.g. 9118):
> 
> If the device is strapped to 16-bit host bus mode, a single read 32-bit 
would 
> reveal us if the bus converts the load 32-bit to two load 16-bit or
> not because the D[31:16] data bus lines are left in a high impedance 
state. 
> Right ?

Right.

> Maybe a pair of reads - same address -  is safer, the controller 
invalidate 
> the read (what does it mean in terms of bytes read ?) if it samples the 
same 
> address (load 32 not split in 16-bit loads) on consecutive reads.
> If the conversion is correct the smsc returns the BYTE_TEST value 
otherwise 
> we would notice the problem. 

If the device is strapped for 16-bit we must ALWAYS read or write in 
pairs.
Actually, one of the two reads is *supposed* to have A[1] set and one is 
supposed
to have it cleared to read the two halves.  The data sheet says that 
reading
the same 16-bit word twice gives invalid results but is not fatal.

> I can write the code in the DT port context, but I do not have any
> 16-bit strapped smsc lan controller at hand, so I cannot test it, but I 
can post
> the patch for review and testing on the list.

Quite a few device variants are 16-bit only (e.g. 9221), so there are 
plenty out
there.
