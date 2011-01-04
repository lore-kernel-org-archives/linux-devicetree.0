From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: [RFC][PATCH] add FDT address translation
Date: Wed, 05 Jan 2011 00:20:16 +0100
Message-ID: <4D23AB30.5050502@home.nl>
References: <4D1BC658.4040608@home.nl> <4D23958D.6000206@home.nl>
	<20110104223847.GA13014@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110104223847.GA13014-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/4/11 11:38 PM, Grant Likely wrote:
> On Tue, Jan 04, 2011 at 10:47:57PM +0100, Walter Goossens wrote:
>> Nobody interested in this stuff?
> Heh, it's a little hard to get people's attention on patches posted
> right before the new year and right before the merge window.  I
> personally won't be able to take a proper look at it before -rc1.
>
> g.
That's no problem, I'm in no hurry, just wanted to know if there was 
still interest. Otherwise I'd just push it in the nios2 tree, but since 
this is not at all nios2 specific I'd rather wait a bit longer and get 
it in the devicetree git...

Thanks for the reply!

Walter
>> I'm working on devicetree support for the NiosII processor and there
>> bridges are quite commonly used so this is a must to get early
>> printk going without dirty hacks. I thought at least Microblaze
>> would need this as well as that's also a synthesizable core but
>> maybe I'm mistaking.
>>
>> On 12/30/10 12:38 AM, Walter Goossens wrote:
>>> This patch adds address translations to fdt. Needed when the early
>>> console is connected to a simple-bus that has address translation
>>> enabled.
>>>
>>> To be honest, I'm not too happy about this solution but it works
>>> and most code is stolen from other parts of the fdt code, so I'm
>>> probably not doing too weird stuff :)
>>> What do you guys think of this?
>>>
>>> Greetz Walter
>>>
>>>
>>> _______________________________________________
>>> devicetree-discuss mailing list
>>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
