From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4] hwmon: Add support for Texas Instruments ADS1015
Date: Thu, 03 Mar 2011 14:15:55 -0700
Message-ID: <d24a5758-e7e8-4d21-b0d8-3b0dee1fddcd@email.android.com>
References: <1299138343-12773-1-git-send-email-eibach@gdsys.de>
	<20110303175050.GC22940@angua.secretlab.ca>
	<20110303200236.GA17132@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110303200236.GA17132-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Dirk Eibach <eibach-dJ+jgKLZIg4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

>> > ---
>> > Changes since v1:
>> > - fixed/extended Documentation
>> > - removed unused register definitions
>> > - hardcoded PGA fullscale table size
>> > - made sure patch applies against v2.6.38-rc4
>> > - reordered functions to avoid forward declaration
>> > - results from i2c_smbus_read_word_data() are handled correctly
>> > - moved locking into ads1015_read_value()
>> > - removed unnecessray clearing of bit
>> > - proper error handling in ads1015_read_value()
>> > - use DIV_ROUND_CLOSEST for scaling result
>> > - removed detect()
>> > 
>> > Changes since v2:
>> > - removed *all* leftovers from detect()
>> > - fixed return with mutex held
>> > - made sysfs representation configurable
>> >   (hope this will be the reference implementation for generations
>to come ;)
>> > 
>> > Changes since v3:
>> > - included linux/of.h
>> > - remove linux/types.h from header file
>> > - sysfs is now configured with a bitmask
>> > - assume big-endian of-properties
>> 
>> I recommend putting the revision history *above* the '---' trim line.
>> It turns out to be useful to have the revision history in the commit
>> text that actually gets merged into mainline.
>
>Is this common sense meanwhile? (That is quite many additional lines
>per
>commit)

Absolutely.  Commit text is cheap and useful.  I say the more detail the better.

g.


-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
