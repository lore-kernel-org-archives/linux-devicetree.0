From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] iio: lps331ap: Add support for DT
Date: Sun, 04 Aug 2013 15:30:12 +0200
Message-ID: <51FE5764.5090304@metafoo.de>
References: <1374240981-13560-1-git-send-email-j.anaszewski@samsung.com> <1374240981-13560-2-git-send-email-j.anaszewski@samsung.com> <51FE4117.3040404@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51FE4117.3040404-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/04/2013 01:55 PM, Jonathan Cameron wrote:
> On 07/19/13 14:36, Jacek Anaszewski wrote:
>> This patch adds DT support for the lps331ap barometer
>> sensor.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> This makes sense to me and looks similar to that in existing bindings
> hence,
> 
> Applied to the togreg branch of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
> 
> Note I am one of those maintainers who has very limited knowledge of device
> tree so am basing this decision on the 'it looks like existing mappings' rather
> than any deep understanding.

The bindings are not OK.

[...]
>> +  - drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)

This is a vendor specific property, so it needs a vendor prefix. Also
abbreviations are kind of frowned upon for dt property names. So
'st,data-ready-interrupt-pin' is probably a better name.

>> +  - interrupt-parent : phandle to the interrupt map subnode
>> +  - interrupts : interrupt mapping for LPS331AP interrupt sources:
>> +		 2 sources: 0 - data ready, 1 - threshold event
>> +  - irq-map : irq sub-node defining interrupt map
>> +	      (all properties listed below are required):
>> +      - #interrupt-cells : should be 1
>> +      - #address-cells : should be 0
>> +      - #size-cells : should be 0
>> +      - interrupt-map : table of entries consisting of three child elements:
>> +	  - unit_interrupt_specifier - 0 : data ready, 1 : threshold event
>> +	  - interrupt parent phandle
>> +	  - parent unit interrupt specifier consisiting of two elements:
>> +	      - index of the interrupt within the controller
[...]
