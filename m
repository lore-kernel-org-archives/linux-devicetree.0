From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Fri, 21 Dec 2012 09:39:20 -0800
Message-ID: <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
	<20121215072014.2E05E3E0AE3@localhost>
	<CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
	<CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, balbi@ti.com, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2012 at 12:14 AM, Vivek Gautam
<gautamvivek1987@gmail.com> wrote:
> On Wed, Dec 19, 2012 at 7:16 PM, Vivek Gautam <gautamvivek1987@gmail.com> wrote:
>>
>> On Sat, Dec 15, 2012 at 12:50 PM, Grant Likely
>> <grant.likely@secretlab.ca> wrote:
>>> On Thu, 13 Dec 2012 20:22:26 +0530, Vivek Gautam <gautam.vivek@samsung.com> wrote:
>>>> Using chip specific compatible string as it should be.
>>>> So fixing this for ehci-s5p, ohci-exynos and dwc3-exynos
>>>> which till now used a generic 'exynos' in their compatible strings.
>>>>
>>>> This goes as per the discussion happened in the thread for
>>>> [PATCH v2] ARM: Exynos5250: Enabling dwc3-exynos driver
>>>> available at:
>>>> http://www.spinics.net/lists/linux-usb/msg74145.html
>>>>
>>>> Vivek Gautam (2):
>>>>   usb: ehci-s5p/ohci-exynos: Fix compatible strings for the device
>>>>   usb: dwc3-exynos: Fix compatible strings for the device
>>>
>>> for both patches:
>>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>>>
>
> Any more thought about this patch-set?
> Or does this change seems fine?

These two changes look good to me.  For both of them:

Reviewed-by: Doug Anderson <dianders@chromium.org>
