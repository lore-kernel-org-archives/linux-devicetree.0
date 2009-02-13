From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 01:32:19 +0100
Message-ID: <4994BF93.2070409@gmx.net>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<4994B22E.6060608@gmx.net>
	<200902122358.25864.paul@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <200902122358.25864.paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13.02.2009 00:58, Paul Brook wrote:
>> Unless I'm mistaken, Linux is able to probe most hardware properties.
>>     
>
> You are badly mistaken.
>   

Point taken.


> On x86 workstation/server class hardware you might get away with it because 
> everything interesting is either  standard legacy ports or PCI, and your 
> firmware/bios already took care of the really hairy bits.
>   

If the firmware doesn't set up the things which can't be probed, can it
even be called firmware or is it more like a glorified bootloader?


> On embedded systems there's often very little that can be automatically 
> detected, much less functionality provided by the firmware (You're lucky if 
> all your RAM is even turned on!) and you just have to know where stuff is.
>   

Ouch. I always thought turning on all the RAM was either a hardware (old
x86) or firmware (modern x86) task.

I'm a bit surprised by the lack of automatically detectable features in
embedded systems. Wouldn't automatic detection allow reusing whole OS
images on slighly different systems and thus lower development cost?


Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
