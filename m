From: Hugues FRUCHET <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add OV5640 parallel interface and RGB565/YUYV
 support
Date: Mon, 8 Jan 2018 17:13:39 +0000
Message-ID: <3010811e-ed37-4489-6a9f-6cc835f41575@st.com>
References: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
 <20180108153811.5xrvbaekm6nxtoa6@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108153811.5xrvbaekm6nxtoa6@flea>
Content-Language: en-US
Content-ID: <F28FB6BF15967F4694CBD7C24E092B0F-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

I'm using a ST board with OV5640 wired in parallel bus output in order 
to interface to my STM32 DCMI parallel interface.
Perhaps could you describe your setup so I could help on understanding 
the problem on your side. From my past experience with this sensor 
module, you can first check hsync/vsync polarities, the datasheet is 
buggy on VSYNC polarity as documented in patch 4/5.

Best regards,
Hugues.

On 01/08/2018 04:38 PM, Maxime Ripard wrote:
> Hi Hugues,
> 
> On Wed, Jan 03, 2018 at 10:57:27AM +0100, Hugues Fruchet wrote:
>> Enhance OV5640 CSI driver to support also DVP parallel interface.
>> Add RGB565 (LE & BE) and YUV422 YUYV format in addition to existing
>> YUV422 UYVY format.
>> Some other improvements on chip identifier check and removal
>> of warnings in powering phase around gpio handling.
> 
> I've been trying to use your patches on top of 4.14, but I cannot seem
> to get any signal out of it.
> 
> What is your test setup and which commands are you running?
> 
> Thanks!
> Maxime
> --
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
