From: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Subject: RE: [Nios2-dev] Device tree flattening code not copying
 propertiesfrom blob
Date: Wed, 12 Jun 2013 19:21:35 -0400
Message-ID: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF7A7@corpatsmail4.corp.sensis.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com><CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com><8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF722@corpatsmail4.corp.sensis.com><CACxGe6urthkotuwU2OtqEMn8WmBxU=hSmrKyffHR=Pbayo_HKg@mail.gmail.com>
 <51B8C827.7060704@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <51B8C827.7060704-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

It seems to be that any section that blob is loaded into except the
--init section would be ok. The main purpose is to keep it in accessible
memory.

Walter, what are your concerns with moving it to a non __init memory
section? Seems like all of the other approaches essentially are doing
that.

Rod

Rod Collins
Principal Software Engineer
Saab Sensis Corporation
315-445-5784
rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org


-----Original Message-----
From: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
[mailto:nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org] On Behalf Of Walter
Goossens
Sent: Wednesday, June 12, 2013 3:13 PM
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: nios2-dev
Subject: Re: [Nios2-dev] Device tree flattening code not copying
propertiesfrom blob

On 06/12/13 20:23, Grant Likely wrote:
> On Wed, Jun 12, 2013 at 6:33 PM, Collins, Rod 
> <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
>> The blob is built into the zImage.initramfs.gz image which is put 
>> into flash. The zImage.initramfs.gz is self copied from flash to RAM,

>> then uncompressed to the running area. I will dig into the location 
>> of the blob in the image and report back.
> Thanks. If it is appended to the zImage wrapper, then things should be

> fine (this is the expected way to do when not passed in from the 
> bootloader). If a *.dtb.o target has been used to embedded it into the

> kernel-proper (vmlinux) then you will have a problem. The *.dtb.S 
> target puts the dtb data into the dtb.init.rodata section which gets 
> discarded.
>
> g.

Hi Grant,

you're right that's exactly what nios2 is doing...
I guess we could modify the section where it gets loaded but that sounds
to me a bit like a hack... What is the best target to look at for a
clean, similar solution? Arm with CONFIG_ARM_APPENDED_DTB?

Walter
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>

_______________________________________________
Nios2-dev mailing list
Nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
http://sopc.et.ntust.edu.tw/cgi-bin/mailman/listinfo/nios2-dev
-
This message is intended only for the addressee and may contain information that is company confidential or privileged.  Any technical data in this message may be exported only in accordance with the U.S. International Traffic in Arms Regulations (22 CFR Parts 120-130) or the Export Administration Regulations (15 CFR Parts 730-774). Unauthorized use is strictly prohibited and may be unlawful. If you are not the intended recipient, or the person responsible for delivering to the intended recipient, you should not read, copy, disclose or otherwise use this message. If you have received this email in error, please delete it, and advise the sender immediately. 
-                                                                                                                                                                                                                                                       
