From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>
Subject: DTS syntax and DTC patches (was: Re: [Qemu-devel] [RFC] Machine
	description as data)
Date: Fri, 13 Feb 2009 03:45:45 +0100
Message-ID: <4994DED9.6020803@gmx.net>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<1234378228.28751.79.camel@slate.austin.ibm.com>	<20090212040138.GD31142@yookeroo.seuss>	<87iqng0x3t.fsf@pike.pond.sub.org>	<20090213004305.GB8104@yookeroo.seuss>
	<4994D6C8.5050004@gmx.net> <20090213021704.GA10476@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090213021704.GA10476-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Coreboot <coreboot-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Adding the coreboot mailing list to CC. It's moderated for
non-subscribers, but it won't take long for legitimate mails to be
approved.]

On 13.02.2009 03:17, David Gibson wrote:
> On Fri, Feb 13, 2009 at 03:11:20AM +0100, Carl-Daniel Hailfinger wrote:
>   
>> On 13.02.2009 01:43, David Gibson wrote:
>>     
>>> On Thu, Feb 12, 2009 at 11:26:46AM +0100, Markus Armbruster wrote:
>>>   
>>>       
>>>> I didn't mean to say they are a bad idea for FDTs, just that they're on
>>>> an awkward level of abstraction for QEMU configuration.  There, I'd
>>>> rather express a PCI address as "02:01.0" than as <0x00000220>.
>>>> Translating text to binary is the machine's job, not the user's.
>>>>     
>>>>         
>>> Ah, I see what you mean.  Hrm, there are several possibilities here,
>>> we'll have to see which works out best for your purposes.
>>>       
>> Using the DTC version included in the coreboot v3 sources would solve
>> that problem and give you a readable PCI address representation.
>>     
>
> Hrm.. it would be nice if you'd co-ordinated with Jon and I about
> this.  Then we could have at least the bits which make sense in
> upstream dtc...
>   

Probably the biggest obstacle for a full merge right now is that the
coreboot v3 DTC is rather old and has been extended not only for a more
readable DTS syntax variant, but also for additional output modes (C
header and C code).

We (coreboot developers) are interested in reducing our diff with
upstream DTC in order to improve maintainability of our DTC code.


Regards,
Carl-Daniel
