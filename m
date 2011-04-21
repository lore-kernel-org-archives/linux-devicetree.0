From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc: document the FSL MPIC message register
	binding
Date: Thu, 21 Apr 2011 14:26:46 -0500
Message-ID: <4DB084F6.4060103@mentor.com>
References: <1303232375-25014-1-git-send-email-meador_inge@mentor.com>	<1303232375-25014-2-git-send-email-meador_inge@mentor.com>	<20110419125214.560f4b99@schlenkerla.am.freescale.net>	<4DADD3D2.6070805@mentor.com>
	<20110419133336.46d8566f@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110419133336.46d8566f-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/19/2011 01:33 PM, Scott Wood wrote:
> On Tue, 19 Apr 2011 13:26:26 -0500
> Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> 
>> On 04/19/2011 12:52 PM, Scott Wood wrote:
>>> On Tue, 19 Apr 2011 11:59:34 -0500
>>> Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>>>  Aliases are of the form 'msgr-block<n>',
>>>> +    where <n> is an integer specifying the block's number.  Numbers shall start
>>>> +    at 0.
>>>
>>> The hw docs refer to "group A" and "group B", not "block 0" and "block 1".
>>>
>>> Plus, I'd put "mpic-" in the alias name.
>>
>> Are you suggesting that the alias should be called: 'mpic-groupA',
>> 'mpic-groupB', 'mpic-groupC', etc... ?
> 
> I was thinking something like "mpic-msgr-group-a", "mpic-msgr-group-b" --
> though if you want to use numbers instead to more easily map to potential
> APIs, that's OK.
> 

Hmmm ...  In the MPC8572E and P1022DS manuals I don't see the terminology
group used for message registers.  The MPIC global timers on the other hand
do use group A and group B.  I will definitely add the 'mpic-' prefix, but
unless I am looking in the wrong place in the manuals, then I am not so
sure there are MPIC message register groups.  As a side note,
the term "register block" pops up in a few places not related to
message registers.

If you feel like group is a more idiomatic term, I can change it.

-- 
Meador Inge     | meador_inge AT mentor.com
Mentor Embedded | http://www.mentor.com/embedded-software
