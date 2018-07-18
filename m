From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v6 0/2] Input: Add Cypress Gen5 Touchscreen driver
Date: Wed, 18 Jul 2018 10:18:53 +0200
Message-ID: <20180718101854.31006b81@dell-desktop.home>
References: <20180703094309.18514-1-mylene.josserand@bootlin.com>
        <20180704162158.euiw2v3hyv3hzofn@penguin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704162158.euiw2v3hyv3hzofn@penguin>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com, maxime.ripard@free-electrons.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Dmitry,

On Wed, 4 Jul 2018 16:21:58 +0000
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Mylène,
> 
> On Tue, Jul 03, 2018 at 11:43:07AM +0200, Mylène Josserand wrote:
> > Hello,
> > 
> > Here is a V6 series to add the driver of the touchscreen Cypress,
> > TrueTouch Generation 5.
> > Based on v4.18-rc3.
> > 
> > This patch series has already been posted in several iterations:
> >     - v1: Sent on 2017/05/29
> >     - v2: Sent on 2017/08/18
> >     - v3: Sent on 2017/09/27
> >     - v4: Sent on 2017/12/01
> >     - v5: Sent on 2017/12/20
> > 
> > I did not have any comments the last 4 versions.
> > And no reviews on my v5 during 6 months. Could I have any updates
> > or feedback on my series to know why it is not merged (to be able to
> > correct what is wrong)?  
> 
> Sorry, I must have missed the v5, sorry about that.

No problem.

> 
> I probably asked this question before, but just to make sure - I see
> references to HID in the patch - the device is really not HID
> compatible? Is there any hope it could be made work with i2c-hid +
> hid-multitouch?

I do not think it is HID compatible but let me check the i2c-hid and
hid-multitouch drivers to confirm that (or not).

I will let you know in next few days.

Thank you,
Best regards,

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
