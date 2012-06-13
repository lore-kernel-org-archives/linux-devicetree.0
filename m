From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: Add empty of_property_match_string() function
Date: Wed, 13 Jun 2012 10:20:22 -0500
Message-ID: <4FD8AFB6.90905@gmail.com>
References: <1334327016-8949-1-git-send-email-thierry.reding@avionic-design.de>
 <20120426190112.GA28018@avionic-0098.mockup.avionic-design.de>
 <20120427164554.2F7E33E0B4D@localhost>
 <20120427204154.GA12617@avionic-0098.mockup.avionic-design.de>
 <20120427205307.GA16099@avionic-0098.mockup.avionic-design.de>
 <20120601055920.GA15874@avionic-0098.adnet.avionic-design.de>
 <20120613070256.GB5670@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120613070256.GB5670-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/13/2012 02:02 AM, Thierry Reding wrote:
> On Fri, Jun 01, 2012 at 07:59:20AM +0200, Thierry Reding wrote:
>> * Thierry Reding wrote:
>>> * Thierry Reding wrote:
>>>> The latest series for the PWM subsystem is here[0]. However that version
>>>> doesn't contain the latest changes that require this. I haven't pushed those
>>>> changes yet because they cause the build to fail (because of these two
>>>> missing patches).
>>>
>>> I just pushed the latest code to the for-next branch. That's the state that I
>>> was going to submit during the 3.5 merge window.
>>>
>>> Thierry
>>>
>>>> [0]: http://gitorious.org/linux-pwm/linux-pwm
>>
>> Hi Grant,
>>
>> Do you have any comments on this? I really want the PWM subsystem to go into
>> 3.6, and for that to happen we need to find a solution for this. As I stated
>> previously the empty functions are needed to compile the PWM core in !OF
>> configurations.
>>
>> Usually this would be solved by just #ifdef'ing the corresponding code, but
>> with the recent introduction of the config_enabled() and IS_ENABLED() macros
>> there seems to be a move to replace #ifdef usage with those in order to have
>> the corresponding code compile-checked in all configurations and have the
>> compiler throw away the unused code.
>>
>> I believe that this is a good thing, but it will required these empty OF
>> functions to be added. If you don't find this an acceptable solution, please
>> let me know and I'll convert the OF-specific code in the PWM core to use
>> #ifdef instead.
> 
> Grant, Rob,
> 
> any update on this?
> 

I agree with your comments, and every other OF function you are using
has an empty version already, so for both patches:

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

You can merge these with PWM support since you are dependent on it.

Rob
