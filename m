From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 03:11:20 +0100
Message-ID: <4994D6C8.5050004@gmx.net>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>	<1234378228.28751.79.camel@slate.austin.ibm.com>	<20090212040138.GD31142@yookeroo.seuss>	<87iqng0x3t.fsf@pike.pond.sub.org>
	<20090213004305.GB8104@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090213004305.GB8104-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13.02.2009 01:43, David Gibson wrote:
> On Thu, Feb 12, 2009 at 11:26:46AM +0100, Markus Armbruster wrote:
>   
>> I didn't mean to say they are a bad idea for FDTs, just that they're on
>> an awkward level of abstraction for QEMU configuration.  There, I'd
>> rather express a PCI address as "02:01.0" than as <0x00000220>.
>> Translating text to binary is the machine's job, not the user's.
>>     
>
> Ah, I see what you mean.  Hrm, there are several possibilities here,
> we'll have to see which works out best for your purposes.
>   

Using the DTC version included in the coreboot v3 sources would solve
that problem and give you a readable PCI address representation.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
