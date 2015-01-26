From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Mon, 26 Jan 2015 17:18:53 +0100
Message-ID: <54C668ED.4050804@free-electrons.com>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org> <20150119182113.GH32663@lunn.ch> <op.xsrcplz12s3iss@ecaz> <54C51FAA.4080300@gmail.com> <20150125170925.GB23862@lunn.ch> <20150125191822.GI24989@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150125191822.GI24989-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason, Andrew,

On 25/01/2015 20:18, Jason Cooper wrote:
> On Sun, Jan 25, 2015 at 06:09:25PM +0100, Andrew Lunn wrote:
>>>>>> +
>>>>>> +        power {
>>>>>> +            label = "mamba:white:power";
>>>>>
>>>>> Please replace this mamba with wrt1900ac. It is a property of the
>>>>> device, not the board. Another device using the mamba board may use it
>>>>> differently.
>>>>>
>>>>
>>>> See above.
>>>
>>> The LED should be named by the device, not the platform. If OpenWRT
>>> userspace already expects "mamba" in here, I guess we are stuck with
>>> it. If not, call it "wrt1900ac:white:power".
>>
>> Hi Sebastian
>>
>> We have some flexibility here. There is the mantra, don't break
>> userspace, but that only applies once code has reached mainline.
> 
> Full agree.
> 
>> If it is decided that mamba is used everywhere, then it should be used
>> here. If wrt1900ac is used, then i would like to see this LED named
>> wrt1900ac.
> 
> I think the main problem here is that we are trying to predict the
> future decisions of an opaque entity (Linksys).  We can't.  All we can
> do is be specific about what we have before us today.  Then we can
> create a new compatible string in the future that reflects the
> differences post-opaque-entity-decisions.
> 
> To that end, engineering is considerably more reliable than marketing.
> So I would be inclined to use 'mamba' for this board.  If Linksys
> creates a variant of this board and keeps the board name, then we can
> call it 'mamba-v2'.  Or, 'mamba-revB' if that's on the silk layer.
> 
> At any rate, unless the DT maintainers disagree, compatible strings
> should reflect engineering attributes, and 'model' should reflect
> marketing names users would be familiar with.
> 
> So...
> 
> 	model = "Linksys WRT1900AC";
> 	compatible = "linksys,mamba", "...";
> 
> ...
> 
> 	power {
> 		label = "mamba:white:power";
> 

Until now for the Armada 37x/38x/XP/ evaluation board we used the marketing
(or something close to it) as compatible name and the model was used for the
extensive marketing name. It would have made more sens to use the "engineering"
name as compatible string as Jason suggested. For this reason I agree with this
binding but I don't have a strong opinion on it.


Thanks,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
