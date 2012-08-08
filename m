From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: <Query> Reg: Adding a gpio initialization sequence in dts is
 valid or not
Date: Wed, 08 Aug 2012 09:38:09 -0600
Message-ID: <502287E1.3040508@wwwdotorg.org>
References: <CAL1wa8fjJg33vVM4ZOFuA2ACps55cahoK65MDf4ebAi9B6KUxg@mail.gmail.com>
 <502269EC.2070008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502269EC.2070008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/08/2012 07:30 AM, Rob Herring wrote:
> On 08/08/2012 04:52 AM, Leela Krishna Amudala wrote:
>> Hello All,
>>
>> I came across that to set power to an LCD, few panels require a pull
>> up/pull down operation on single GPIO line
>> and few panels need some gpio line setting sequence with some delay in between.
...
>> Putting the sequence in dts file like below for an LCD which requires
>> gpio sequence
>>                lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - for pull up)
>>                                       <&gpx1 5 1 1 0>,    (1 - for pull down)
>>                                       <&gpx1 5 1 3 0>;    (3 - for pull up)
>>                delay = x;
>>
>> and only one gpio entry in the case of LCD which doesn't require gpio
>> sequence setting
>>                lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - pull up)
>>
>> The 4 arguments in the above handle denotes
>>
>> <[phandle of the gpio controller node]
>>       [pin number within the gpio controller]
>>       [mux function]
>>       [pull up/down]
>>       [drive strength]>

Mux function, pull-up/down and drive-strength should be handled by the
pinctrl subsystem, and associated DT bindings.

I suppose the proposal in the "runtime interpreted power sequences"
thread could be extended to have an action for activating a particular
pinctrl state too.
