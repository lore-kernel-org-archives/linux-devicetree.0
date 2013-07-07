From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 2/3] ARM: mxs: cfa10049: Switch bus i2c1 to bitbanging
Date: Sun, 07 Jul 2013 10:47:21 +0200
Message-ID: <51D92B19.8000706@free-electrons.com>
References: <1372094699-3832-1-git-send-email-alexandre.belloni@free-electrons.com> <1372094699-3832-3-git-send-email-alexandre.belloni@free-electrons.com> <51D7F0E6.2000008@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51D7F0E6.2000008-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, jimwall@q.com, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/07/2013 12:26, Jonathan Cameron wrote:
> On 06/24/2013 06:24 PM, Alexandre Belloni wrote:
>> From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> The ADCs connected to this bus have been experiencing some timeout
>> issues when using the iMX28 i2c controller. Switching back to bitbanging
>> solves this.
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> As there are no disadvantages in taking the driver through IIO and these changes
> through the appropriate arch trees, I'd not propose to take these through IIO
> (even when the discussion is done) unless specifically asked to.
> 

Sure, especially since, we may finally not move to i2c bitbanging. I'll
probably resend a new version of those patches separately.

Shawn, please wait for the i2c-mxs PIO/DMA mode discussion to end before
applying. If possible, I would prefer not using bitbanging.

Regards,


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
