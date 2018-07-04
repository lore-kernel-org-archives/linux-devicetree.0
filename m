From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 0/2] Input: Add Cypress Gen5 Touchscreen driver
Date: Wed, 4 Jul 2018 16:21:58 +0000
Message-ID: <20180704162158.euiw2v3hyv3hzofn@penguin>
References: <20180703094309.18514-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703094309.18514-1-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com, maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mylène,

On Tue, Jul 03, 2018 at 11:43:07AM +0200, Mylène Josserand wrote:
> Hello,
> 
> Here is a V6 series to add the driver of the touchscreen Cypress,
> TrueTouch Generation 5.
> Based on v4.18-rc3.
> 
> This patch series has already been posted in several iterations:
>     - v1: Sent on 2017/05/29
>     - v2: Sent on 2017/08/18
>     - v3: Sent on 2017/09/27
>     - v4: Sent on 2017/12/01
>     - v5: Sent on 2017/12/20
> 
> I did not have any comments the last 4 versions.
> And no reviews on my v5 during 6 months. Could I have any updates
> or feedback on my series to know why it is not merged (to be able to
> correct what is wrong)?

Sorry, I must have missed the v5, sorry about that.

I probably asked this question before, but just to make sure - I see
references to HID in the patch - the device is really not HID
compatible? Is there any hope it could be made work with i2c-hid +
hid-multitouch?

Thanks.

-- 
Dmitry
