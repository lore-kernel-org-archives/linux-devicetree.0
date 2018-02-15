From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Fix broken bananapi m2 devicetree/regulators
Date: Thu, 15 Feb 2018 12:19:17 +0100
Message-ID: <89d2da32-82c5-84d9-507e-aa17d782d766@gmail.com>
References: <20180214141025.22171-1-embed3d@gmail.com>
 <20180215090838.fnenymzrejs6vhcf@flea.home>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBOGZSXKAKGQEXQIOIKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180215090838.fnenymzrejs6vhcf-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 15.02.2018 10:08, Maxime Ripard wrote:
> On Wed, Feb 14, 2018 at 03:10:23PM +0100, Philipp Rossak wrote:
>> This patchseries fixes the bananapi m1 devicetree, to be able to boot again.
>> The first two patches update/improve the devicetree and the last patch adds
>> all missing regulators.
>>
>> Regards,
>> Philipp
>>
>> Changes since v1:
>> 	* squashed commit 1 and 3
>> 	* fix wrong mmc regulator
>>
>> Philipp Rossak (2):
>>    arm: dts: sun6i: a31s: bpi-m2: improve pmic properties
>>    arm: dts: sun6i: a31s: fix: bpi-m2: add missing regulators
> 
> Applied both.
> 
> I had to make a couple of changes though, in the commit title arm
> should be uppercase, and the fix isn't needed.
> 
> I also added stable in Cc, since these patches have been there for
> quite some time.
> 
> Maxime
> 

Thanks!

Philipp
