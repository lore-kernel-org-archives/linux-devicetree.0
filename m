From: Eric Nelson <eric@nelint.com>
Subject: Re: [PATCH V2 0/2] rc: Add timeout support to gpio-ir-recv
Date: Sat, 3 Oct 2015 08:10:00 -0700
Message-ID: <560FEFC8.20908@nelint.com>
References: <1441980024-1944-1-git-send-email-eric@nelint.com>
 <1442862524-3694-1-git-send-email-eric@nelint.com>
 <20151003112712.4f54925d@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20151003112712.4f54925d@recife.lan>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, patrice.chotard@st.com, fabf@skynet.be, wsa@the-dreams.de, heiko@sntech.de, devicetree@vger.kernel.org, otavio@ossystems.com.br
List-Id: devicetree@vger.kernel.org

Hi Mauro,

On 10/03/2015 07:27 AM, Mauro Carvalho Chehab wrote:
> Em Mon, 21 Sep 2015 12:08:42 -0700
> Eric Nelson <eric@nelint.com> escreveu:
> 
>> Add timeout support to the gpio-ir-recv driver as discussed
>> in this original patch:
>>
>> 	https://patchwork.ozlabs.org/patch/516827/
>>
>> V2 uses the timeout field of the rcdev instead of a device tree 
>> field to set the timeout value as suggested by Sean Young.
>>
>> Eric Nelson (2):
>>   rc-core: define a default timeout for drivers
>>   rc: gpio-ir-recv: add timeout on idle
> 
> I'm ok on having a default timeout for drivers, but the better would
> be to implement it at the RC core, and not inside each driver.
> 

Can you elaborate?

I'm not sure how that can be done, since the issue with the
gpio-ir driver stems from the fact that there's no tail-end
interrupt at the end of a burst. I think this isn't needed
for other hardware.

It seems that the call to schedule() in ir_raw_event_thread()
could be changed to schedule_timeout(), but

	- this should only be done when not idle, and
	- only some hardware drivers need it

I'm also not familiar with the rest of the code, so I'd
be concerned about breaking other interfaces.

Please advise,


Eric
