From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 09:25:24 +0100
Message-ID: <52FB2FF4.6060905@gmail.com>
References: <OF784BA598.ACFE9DA4-ONCA257C76.00827472-CA257C77.000BCFAD@csc.com> <20140206082635.GA7048@visitor2.iram.es> <OFA4C1AF9F.B23E83EC-ONCA257C78.00044235-CA257C78.00080D50@csc.com> <20140207101036.GA823@visitor2.iram.es> <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net> <20140210110342.GA15806@visitor2.iram.es> <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net> <20140211072606.GA26514@visitor2.iram.es> <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com> <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org> <52FAA97F.4060600@gmail.com> <1392162080.6733.404.camel@snotra.buserror.net> <52FAB65C.4090201@gmail.com> <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333-SmukeSwxQOQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/2014 01:21 AM, Stephen N Chivers wrote:
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote on
> 02/12/2014 10:46:36 AM:
>
>> From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen N Chivers
>> <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>,
>> linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>,
>> devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>> Date: 02/12/2014 11:04 AM
>> Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS
> files.
>>
>> On 02/12/2014 12:41 AM, Scott Wood wrote:
>>>
>>> Regardless of whether .type = "serial" gets removed, it seems wrong for
>>> of_match_node() to accept a .type-only match (or .name, or anything else
>>> that doesn't involve .compatible) before it accepts a compatible match
>>> other than the first in the compatible property.
>>
>> Right, I thought about it and came to the same conclusion. I sent a
>> patch a second ago to prefer .compatible != NULL matches over those
>> with .compatible == NULL.
>>
>> Would be great if Stephen can re-test that. If it solves the issue, I
>> can send a patch tomorrow.
> Done.
>
> But, the Interrupt Controller (MPIC)
> goes AWOL and it is down hill from there.
>
> The MPIC is specified in the DTS as:
>
>          mpic: pic@40000 {
>                          interrupt-controller;
>                          #address-cells = <0>;
>                          #interrupt-cells = <2>;
>                          reg = <0x40000 0x40000>;
>                          compatible = "chrp,open-pic";
>                          device_type = "open-pic";
>                          big-endian;
>                  };
>
> The board support file has the standard mechanism for allocating
> the PIC:
>
>          struct mpic *mpic;
>
>          mpic = mpic_alloc(NULL, 0, 0, 0, 256, " OpenPIC  ");
>          BUG_ON(mpic == NULL);
>
>          mpic_init(mpic);
>
> I checked for damage in applying the patch and it has applied
> correctly.

Hmm, I did a mistake in the patch:

-	while (m->name[0] || m->type[0]) {
+	while (m->compatible[0] || m->name[0] || m->type[0]) {

for the second added match. Otherwise, the matches are not
evaluated down to the sentinel but the loop quits on the first
match table entry without .name and .type set.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
