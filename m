From: "Pallala, Ramakrishna" <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: max17042: Add POR init procedure from Maxim appnote
Date: Wed, 6 Nov 2013 05:43:19 +0000
Message-ID: <D854C92F57B1B347B57E531E78D05EAD2DE1A0C0@BGSMSX104.gar.corp.intel.com>
References: <20131105202444.GG3949@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131105202444.GG3949-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>The patch f3a71a6eb13b: "max17042: Add POR init procedure from Maxim appnote" from Mar 13, 2012, leads to the following static checker warning: "drivers/power/max17042_battery.c:339
>>max17042_init_model()
>>	 warn: passing casted pointer 'temp_data' to 'max17042_model_data_compare()' 32 vs 16."

Dan, Thanks for pointing out the bug. I will fix it.

Thanks,,
Ram
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
