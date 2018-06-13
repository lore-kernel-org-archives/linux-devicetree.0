From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v2] arm: sun4i: Add support for Pengpod
 1000 tablet
Date: Wed, 13 Jun 2018 09:28:16 +0200
Message-ID: <4d041794-ba90-a9a6-0886-0ca18dab62b9@redhat.com>
References: <20180602160313.26763-1-rah@settrans.net>
 <20180604081302.hcn7j36gt6xeyquq@flea>
 <313a74ea-0be6-cff1-6b2f-06a4b0b7ba8d@settrans.net>
 <20180605145038.qptdlcphdbnw6jyg@flea>
 <e2787b2a-230d-ea3c-89b9-316ddcd20f67@settrans.net>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBEUPQPMQKGQE36L3WVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <e2787b2a-230d-ea3c-89b9-316ddcd20f67-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Bob Ham <rah-2mWpNWY8JZLk1uMJSBkQmQ@public.gmane.org>, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05-06-18 20:18, Bob Ham wrote:
> On 05/06/18 15:50, Maxime Ripard wrote:
>> On Mon, Jun 04, 2018 at 06:33:02PM +0100, Bob Ham wrote:
>>> On 04/06/18 09:13, Maxime Ripard wrote:
>>>> On Sat, Jun 02, 2018 at 05:03:13PM +0100, Bob Ham wrote:
>>>
>>>>> + * This file is dual-licensed: you can use it either under the terms
>>>>> + * of the GPL or the X11 license, at your option. Note that this dual
>>>>> + * licensing only applies to this file, and not this project as a
>>>>> + * whole.
>>>
>>>>> + *     The above copyright notice and this permission notice shall be
>>>>> + *     included in all copies or substantial portions of the Software.
>>>
>>>> And this is redundant with the SPDX header.
>>>
>>> The X11 license notice states explicitly that the notice has to be
>>> included in the file.  Wouldn't removing it be a violation of the license?
>>
>> The SPDX header is explicitly here to remove the license text and
>> create a tag that is in a indirect reference to the license text in
>> LICENSES. It's not going away.
> 
> Well, the top bit that I quoted above says that the licenses refer to
> only that one file in particular and not the project as a whole.  Then
> the X11 license states that the notice can't be removed from 'this
> software and associated documentation files (the "Software")' which
> would seem to refer to the single file.  Therefore, removing the notice
> from the single file and replacing it with an SPDX header would seem to
> violate the license.
> 
> It's a fine point but it makes me nervous.  I originally based my .dts
> on sun4i-a10-inet1.dts.  I've CC'd the original copyright holder, Hans
> de Goede.  Hans, are you willing to give permission for the license
> notice to be replaced with just an SPDX header indicating the dual
> licensing?

Yes that is fine by me and you've my permission to switch to using
just the SPDX header.

FWIW I do not believe the "can't be removed from 'this software and
associated documentation files (the "Software")'" language
applies to the software as a whole and not individual files.

> While we're at it, there are a number of other files with the same
> license text.  Hans, are you prepared to give permission for your other
> license notices to be replaced with SPDX headers?

Yes you may make the same change to all files with my copyright.

Regards,

Hans
