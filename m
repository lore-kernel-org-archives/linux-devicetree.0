From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 07/13] media: am437x-vpfe: Use a per instance format
 array instead of a static one
Date: Tue, 17 Sep 2019 11:19:11 -0500
Message-ID: <20190917161911.tldspiynarmxd4ky@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-8-bparrot@ti.com>
 <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d6aebae8-570a-284a-d336-f3a9670daa0b@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:07:29 +0200]:
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > +/*
> > + * This value needs to be at least as large as the number of entry in
> > + * formats[].
> > + * When formats[] is modified make sure to adjust this value also.
> > + */
> > +#define VPFE_MAX_ACTIVE_FMT	10
> 
> I recommend adding something like:
> 
> #if ARRAY_SIZE(formats) > VPFE_MAX_ACTIVE_FMT
> 	#error must update VPFE_MAX_ACTIVE_FMT
> #endif
> 
> to am437x-vpfe.c.
> 
> Or something along those lines. Don't rely on just the comment :-)

I remeber doing this a while back for another driver.
Not sure if you ever treid this or not but "#if ARRAY_SIZE()" construct
does not work because the ARRAY_SIZE() macro which needs to evaluate
sizeof() generates the following compiler error:

In file included from ../include/linux/delay.h:22,
                 from ../drivers/media/platform/am437x/am437x-vpfe.c:23:
../include/linux/kernel.h:47:26: warning: "sizeof" is not defined,
evaluates to 0 [-Wundef]
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
                          __must_be_array(arr))

So no luck there. But I remembered also how I previously fixed it.
In this case if instead of leaving the formats[] definition with empty
brackets you actually used the same defined value like
formats[VPFE_MAX_ACTIVE_FMT] then if you inadvertantly add more enties in
the table then the value of VPFE_MAX_ACTIVE_FMT then you'll get series of
compile time warnings like this:

drivers/media/platform/am437x/am437x-vpfe.c:108:5: warning: excess elements
in array initializer
  }, {
     ^
drivers/media/platform/am437x/am437x-vpfe.c:108:5: note: (near initialization
for ‘formats’)
drivers/media/platform/am437x/am437x-vpfe.c:115:5: warning: excess elements
in array initializer
  }, {

etc...

So this is how I will address this.

Benoit

> 
> Regards,
> 
> 	Hans
> 
