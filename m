From: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 46/49] ath11k: add wmi.h
Date: Fri, 23 Aug 2019 09:51:47 +0530
Message-ID: <826dd60c50a2b821fe82c5c04730deb1@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-47-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_181541_270184_9285B240)
 <c60afe716cc9ce3b511d8be0b04958342dfea908.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c60afe716cc9ce3b511d8be0b04958342dfea908.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2019-08-21 01:59, Johannes Berg wrote:
> On Tue, 2019-08-20 at 18:48 +0300, Kalle Valo wrote:
>> 
>> +enum wmi_cmd_group {
>> +	/* 0 to 2 are reserved */
>> +	WMI_GRP_START = 0x3,
>> +	WMI_GRP_SCAN = WMI_GRP_START, /* 0x3 */
>> +	WMI_GRP_PDEV,           /* 0x4 */
> 
> If you're going to spell out the numbers anyway, why not do it in C
> rather than a comment?
> 
> 	WMI_GRP_PDEV		= 0x4,
> 
> would tell you just as much, and be much less error-prone.

Sure, we'll do it that way.

> 
>> +struct wmi_pdev_set_hw_mode_cmd_param {
>> +	u32 tlv_header;
>> +	u32 pdev_id;
>> +	u32 hw_mode_index;
>> +	u32 num_band_to_mac;
>> +} __packed;
> 
> Does it really makes sense for something to be using "u32" (i.e. host
> endian) but then __packed (kinda tagging it as "I am using this with 
> the
> hardware, don't change the layout")?

Yes, this is mainly for tagging. Since Copy Engine does the 
byte-swapping when working with big-endian
system, these are declared in host endian. Removing __packed also fine, 
I guess.

> 
> That really applies to a lot of the things here.
> 
>> +struct channel_param {
>> +	u8 chan_id;
>> +	u8 pwr;
>> +	u32 mhz;
>> +	u32 half_rate:1,
>> +	    quarter_rate:1,
>> +	    dfs_set:1,
>> +	    dfs_set_cfreq2:1,
>> +	    is_chan_passive:1,
>> +	    allow_ht:1,
>> +	    allow_vht:1,
>> +	    set_agile:1;
>> +	u32 phy_mode;
>> +	u32 cfreq1;
>> +	u32 cfreq2;
>> +	char   maxpower;
>> +	char   minpower;
>> +	char   maxregpower;
>> +	u8  antennamax;
>> +	u8  reg_class_id;
>> +} __packed;
> 
> Bitfields in FW structs are even less likely to work right, I'd avoid
> that.
> 
> (and if you have this copy engine do endian conversion, then the u8
> fields won't work right since that ending seems to be working on u32s?)
> 
> That probably all applies elsewhere too, but the file is pretty long 
> ;-)

Sure, we'll clean this up.

> 
> Personally, I'd also consider splitting internal driver usage stuff and
> FW API into different files, but that's your decision. I just find it
> lets me understand it better even when I'm looking at it myself.
> 

Sure, this will look better.


Thanks,

Vasanth
